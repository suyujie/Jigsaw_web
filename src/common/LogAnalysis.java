package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;

public class LogAnalysis {
	//日志源文件路径
//	private static final String LogSrcFilePath = "G:/node-log-22/";
	private static final String LogSrcFilePath = "G:/node-log-54164/";
	//日志分析文件路径
//	private static final String LogAnalysisFilePath = "/home/rulesgames/log_analysis/errorLogs-22.txt";
	private static final String LogAnalysisFilePath = "/home/rulesgames/log_analysis/errorLogs-54164.txt";
	//一秒钟内接收请求最多的次数
	private static int maxRequestNumInSecond = 0;
	//最大响应时长，单位毫秒
	private static int maxResponseTime = 0;
	//key:commondId, value:最大响应时间
	private static HashMap<Integer,Integer> longTimeCommondId = new HashMap<>();
	
	public LogAnalysis(){
		
	}
	
	public static void nodeInfoAnalysis() throws IOException{
		File errorLogFile = new File(LogAnalysisFilePath);
		File errorLogFileParent = errorLogFile.getParentFile();
		if(!errorLogFileParent.exists()){
			errorLogFileParent.mkdirs();
		}
		FileWriter writer = new FileWriter(errorLogFile,true);
		
		File file = new File(LogSrcFilePath);
		File[] files = file.listFiles();
		String requestTime_s_last = "";
		int requestNumInSecond = 0;
		
		if(files.length>0){
			for(File f : files){
				writer.write(f.getName() + "\r\n");
				BufferedReader br = new BufferedReader(new FileReader(f));
				String line = null;
				while((line = br.readLine())!=null){
					// 02:55:23.379 INFO  server.node.servlet.RobotServlet - run true comandId[401] bodyLength[10] time[1427770523304->1427770523379=75]
					String regex = "^\\d{2}\\:\\d{2}\\:\\d{2}\\.\\d{3}\\s[\\s|\\S]*";
					if(!line.matches(regex)){
						continue;
					}
					line = line.replaceAll(" +"," ");
					String[] array = line.split(" ");
					
					String requestTime = array[0];
					String requestTime_s = requestTime.substring(0, requestTime.indexOf("."));
					if(requestTime_s.equals(requestTime_s_last)){
						requestNumInSecond++;
					}else{
						if(maxRequestNumInSecond < requestNumInSecond){
							maxRequestNumInSecond = requestNumInSecond;
						}
						requestTime_s_last = requestTime_s;
						requestNumInSecond = 1;
					}
					
					String logLevel = array[1];
					int commondId = 0;
					int responseTime = 0;
					
					if(logLevel.equals("ERROR")){
						writer.write(line + "\r\n");
						continue;
					}
					
					if(!array[2].equals("server.node.servlet.RobotServlet")){
						continue;
					}
					
					String array6 = array[6];
					int beginIndex = array6.indexOf("[")+1;
					int endIndex = array6.indexOf("]");
					commondId = Integer.parseInt(array6.substring(beginIndex, endIndex));
					
					String array8 = array[8];
					int beginIndex2 = array8.indexOf("=")+1;
					int endIndex2 = array8.indexOf("]");
					responseTime = Integer.parseInt(array8.substring(beginIndex2, endIndex2));
					if(responseTime > maxResponseTime){
						maxResponseTime = responseTime;
					}
					if(responseTime > 100){
						Integer oldResponseTime = longTimeCommondId.get(commondId);
						if(oldResponseTime==null || (oldResponseTime!=null && responseTime>oldResponseTime)){
							longTimeCommondId.put(commondId, responseTime);
						}
					}
				}
				br.close();
			}
		}
		
		writer.write("\r\n\r\n");
		writer.write("日志分析总结：\r\n");
		writer.write("==============================================================\r\n");
		writer.write("每秒钟最大请求数量: " + maxRequestNumInSecond + "\r\n");
		writer.write("最大响应时长(单位：毫秒): " + maxResponseTime + "\r\n");
		writer.write("请求最大响应时长(>100ms，格式：commandId=maxResponseTime): " + longTimeCommondId + "\r\n");
		
		writer.flush();
		writer.close();
	}
	
	public static void main(String[] args) throws IOException{
		nodeInfoAnalysis();
		System.out.println("maxRequestNumInSecond: " + maxRequestNumInSecond);
		System.out.println("maxResponseTime: " + maxResponseTime);
		System.out.println("long responese time commondId: " + longTimeCommondId);
	}
}
