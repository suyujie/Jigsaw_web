package server.web.system;

import gamecore.AbstractSystem;
import gamecore.util.FileUtil;
import gamecore.util.ZipFileUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import server.StorageManager;
import trigger.message.VersionMessage;

import common.aws.AwsS3;
import common.aws.AwsS3StorageBean;
import common.microsoft.azure.AzureStorage;
import common.microsoft.azure.AzureStorageBean;

public class VersionSystem extends AbstractSystem {

	//客户端版本
	private static Integer gameVersion = null;
	//客户端最新下载地址
	private static String newVersionUrl = null;
	//xml版本
	private HashMap<String, Integer> xmlVersion = null;
	//res版本
	private HashMap<String, Integer> resVersion = null;

	private List<String> newXmls = null;
	private List<String> newRes = null;

	@Override
	public boolean startup() {
		xmlVersion = new HashMap<String, Integer>();
		resVersion = new HashMap<String, Integer>();
		newXmls = new ArrayList<String>();
		newRes = new ArrayList<String>();
		//先读取游戏版本
		boolean b = loadGameVersion();
		//再读取xml版本
		b = b & loadXmlVersion();
		//读取资源版本
		b = b & loadResVersion();

		return b;
	}

	@Override
	public void shutdown() {
	}

	//读取gameversion 从version文件中
	public boolean loadGameVersion() {//读取version文件
		File versionFile = new File(StorageManager.getInstance().versionPath + "version");

		List<String> vl = null;
		try {
			vl = FileUtil.readLines(versionFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (vl == null || vl.isEmpty()) {
			gameVersion = 0;
			newVersionUrl = "";
			writeGameVersion();
		} else {

			for (String str : vl) {
				if (str.contains("gameVersion")) {
					gameVersion = Integer.parseInt(str.replace("gameVersion:", ""));
				}
				if (str.contains("newVersionUrl")) {
					newVersionUrl = str.replace("newVersionUrl:", "");
				}
			}

		}

		return true;

	}

	//写入gameversion文件
	private void writeGameVersion() {//写version文件
		File versionFile = new File(StorageManager.getInstance().versionPath + "version");

		String msg = new StringBuffer("gameVersion:").append(gameVersion).append("\n").append("newVersionUrl:").append(newVersionUrl).toString();

		try {
			FileUtil.writeFile(versionFile, msg, false);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public boolean loadXmlVersion() {//读取xml的版本
		List<String> xmlList = FileUtil.readFileNames(StorageManager.getInstance().xmlPath, "xml");

		for (String fileName : xmlList) {
			String name_version = fileName.substring(0, fileName.lastIndexOf("."));
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			if (name_version.contains("_")) {
				String key = name_version.substring(0, name_version.lastIndexOf("_")) + suffix;
				int v = Integer.parseInt(name_version.substring(name_version.lastIndexOf("_") + 1));
				if (xmlVersion.get(key) == null) {
					xmlVersion.put(key, v);
				} else {
					if (v > xmlVersion.get(key).intValue()) {
						xmlVersion.put(key, v);
					}
				}

			} else {
				if (xmlVersion.get(fileName) == null) {
					xmlVersion.put(fileName, 0);
				}
			}
		}

		return true;

	}

	public boolean loadResVersion() {//读取res的版本
		//文件命名规范,例如:abc.xxx    abc_1.xxx
		List<String> resList = FileUtil.readFileNames(StorageManager.getInstance().resPath, "assetbundle");

		for (String fileName : resList) {
			String name_version = fileName.substring(0, fileName.lastIndexOf("."));
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			if (name_version.contains("_")) {
				String key = name_version.substring(0, name_version.lastIndexOf("_")) + suffix;
				int v = Integer.parseInt(name_version.substring(name_version.lastIndexOf("_") + 1));
				if (resVersion.get(key) == null) {
					resVersion.put(key, v);
				} else {
					if (v > resVersion.get(key).intValue()) {
						resVersion.put(key, v);
					}
				}

			} else {
				if (resVersion.get(fileName) == null) {
					resVersion.put(fileName, 0);
				}
			}
		}

		return true;

	}

	public void addNewXmls(String xmlName) {
		if (newXmls == null) {
			newXmls = new ArrayList<String>();
		}
		if (!newXmls.contains(xmlName)) {
			newXmls.add(xmlName);
		}
	}

	public List<String> takeNewXmlList() {
		List<String> list = new ArrayList<String>();
		list.addAll(newXmls);
		return list;
	}

	public void clearNewXmlList() {
		newXmls.clear();
	}

	public void addNewRes(String resName) {
		if (newRes == null) {
			newRes = new ArrayList<String>();
		}
		if (!newRes.contains(resName)) {
			newRes.add(resName);
		}
	}

	public List<String> takeNewReslList() {
		List<String> list = new ArrayList<String>();
		list.addAll(newRes);
		return list;
	}

	public void clearNewResList() {
		newRes.clear();
	}

	public int getGameVersion() {
		return gameVersion;
	}

	public String getNewVersionUrl() {
		return newVersionUrl;
	}

	public HashMap<String, Integer> getResVersion() {
		return resVersion;
	}

	//获取最新的xml版本号
	public String getXmlVersionStr() {
		StringBuffer sb = new StringBuffer();

		Iterator<Entry<String, Integer>> iter = xmlVersion.entrySet().iterator();
		while (iter.hasNext()) {
			Entry<String, Integer> entry = iter.next();
			String key = entry.getKey();
			Integer val = entry.getValue();

			sb.append(key).append(":").append(val).append(",");
		}

		if (sb.length() > 0) {
			sb.deleteCharAt(sb.length() - 1);
		}

		return sb.toString();

	}

	//获取最新的xml版本号
	public String getResVersionStr() {
		StringBuffer sb = new StringBuffer();

		Iterator<Entry<String, Integer>> iter = resVersion.entrySet().iterator();
		while (iter.hasNext()) {
			Entry<String, Integer> entry = iter.next();
			String key = entry.getKey();
			Integer val = entry.getValue();

			sb.append(key).append(":").append(val).append(",");
		}

		if (sb.length() > 0) {
			sb.deleteCharAt(sb.length() - 1);
		}

		return sb.toString();

	}

	public HashMap<String, Integer> getXmlVersion() {
		return xmlVersion;
	}

	public void updateGameVersion(Integer version, String url) {
		gameVersion = version;
		newVersionUrl = url;
		writeGameVersion();
	}

	/**
	 * 上传xml文件到服务器
	 * @param item
	 */
	public void uploadXmlFile(FileItem item) {
		String name_version = item.getName().substring(0, item.getName().lastIndexOf("."));//abc_1   文件名_版本 也有可能没有版本号
		String suffix = item.getName().substring(item.getName().lastIndexOf("."));//.Xxx

		String name;
		String key;
		File uploadFile = null;
		if (name_version.contains("_")) {//文件名称包含版本
			name = name_version.substring(0, name_version.lastIndexOf("_"));//abc
			key = name_version.substring(0, name_version.lastIndexOf("_")) + suffix;//abc.Xxx
			int v = Integer.parseInt(name_version.substring(name_version.lastIndexOf("_") + 1));//版本号

			if (xmlVersion.get(key) == null || v > xmlVersion.get(key)) {
				xmlVersion.put(key, v);
				uploadFile = new File(StorageManager.getInstance().xmlPath + File.separatorChar + name + "_" + v + suffix);
			} else {
				int newVersion = xmlVersion.get(key) + 1;
				xmlVersion.put(key, newVersion);
				uploadFile = new File(StorageManager.getInstance().xmlPath + File.separatorChar + name + "_" + newVersion + suffix);
			}
		} else {
			name = name_version;//abc
			key = name + suffix;
			if (xmlVersion.get(key) == null) {
				xmlVersion.put(key, 0);
				uploadFile = new File(StorageManager.getInstance().xmlPath + File.separatorChar + name + suffix);
			} else {
				int newVersion = xmlVersion.get(key) + 1;
				xmlVersion.put(key, newVersion);
				uploadFile = new File(StorageManager.getInstance().xmlPath + File.separatorChar + name + "_" + newVersion + suffix);
			}
		}

		try {
			if (uploadFile != null) {
				addNewXmls(key);
				item.write(uploadFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 上传资源文件到服务器
	 * @param item
	 */
	public void uploadResFile(FileItem item) {
		String name_version = item.getName().substring(0, item.getName().lastIndexOf("."));//abc_1   文件名_版本 也有可能没有版本号
		String suffix = item.getName().substring(item.getName().lastIndexOf("."));//.Xxx

		String name;
		String key;
		File uploadFile = null;
		if (name_version.contains("_")) {//文件名称包含版本
			name = name_version.substring(0, name_version.lastIndexOf("_"));//abc
			key = name_version.substring(0, name_version.lastIndexOf("_")) + suffix;//abc.Xxx
			int v = Integer.parseInt(name_version.substring(name_version.lastIndexOf("_") + 1));//版本号
			if (resVersion.get(key) == null || v > resVersion.get(key)) {
				resVersion.put(key, v);
				uploadFile = new File(StorageManager.getInstance().resPath + File.separatorChar + name + "_" + v + suffix);
			} else {
				int newVersion = resVersion.get(key) + 1;
				resVersion.put(key, newVersion);
				uploadFile = new File(StorageManager.getInstance().resPath + File.separatorChar + name + "_" + newVersion + suffix);
			}
		} else {
			name = name_version;//abc
			key = name + suffix;
			if (resVersion.get(key) == null) {
				resVersion.put(key, 0);
				uploadFile = new File(StorageManager.getInstance().resPath + File.separatorChar + name + suffix);
			} else {
				int newVersion = resVersion.get(key) + 1;
				resVersion.put(key, newVersion);
				uploadFile = new File(StorageManager.getInstance().resPath + File.separatorChar + name + "_" + newVersion + suffix);
			}
		}

		try {
			if (uploadFile != null) {
				addNewRes(key);
				item.write(uploadFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 更新xml文件到云存储
	 * @param path xml文件的源路径
	 * @param needUpdateFile 新xml文件的文件名，不含版本号，如bossData.xml
	 * @return
	 */
	public String xmlUploadAzure2Storage(String path, List<String> needUpdateFile) {
		String blobName = "xml";
		StringBuffer sb = new StringBuffer();

		for (AzureStorageBean storage : StorageManager.getInstance().azureStorages.values()) {
			try {

				for (String key : needUpdateFile) {
					String name = key.substring(0, key.lastIndexOf("."));//文件名
					String suffix = key.substring(key.lastIndexOf("."));//带.的后缀名 
					String filePath = null;
					int version = xmlVersion.get(key);
					if (version == 0) {
						filePath = path + File.separatorChar + name + suffix;
					} else {
						filePath = path + File.separatorChar + name + "_" + version + suffix;
					}
					String blobFileName = name + "_" + version + suffix;

					//Azure上传
					boolean uploadSuccess = AzureStorage.upload2Storage(storage, blobName, filePath, key, blobFileName);
					if (uploadSuccess) {
						sb.append(storage.storageAccount).append("  [").append(blobName).append("]  ").append("  [").append(key).append("] ok").append("\n");
					} else {
						sb.append(storage.storageAccount).append("  [").append(blobName).append("]  ").append("  [").append(key).append("] error").append("\n");
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
				sb.append(storage.storageAccount).append(" error").append("\n");
			}

		}

		return sb.toString();

	}

	/**
	 * 更新资源文件到云存储
	 * @param path 资源文件的源路径
	 * @param needUpdateFile 新资源文件的文件名，不含版本号
	 * @return
	 */
	public String resUploadAzure2Storage(String path, List<String> needUpdateFile) {
		String blobName = "assetbundles";
		StringBuffer sb = new StringBuffer();

		for (AzureStorageBean storage : StorageManager.getInstance().azureStorages.values()) {
			try {

				for (String key : needUpdateFile) {
					String name = key.substring(0, key.lastIndexOf("."));//文件名
					String suffix = key.substring(key.lastIndexOf("."));//带.的后缀名 
					String filePath = null;
					int version = resVersion.get(key);
					if (version == 0) {
						filePath = path + File.separatorChar + name + suffix;
					} else {
						filePath = path + File.separatorChar + name + "_" + version + suffix;
					}
					String blobFileName = name + "_" + version + suffix;

					boolean uploadSuccess = AzureStorage.upload2Storage(storage, blobName, filePath, key, blobFileName);
					if (uploadSuccess) {
						sb.append(storage.storageAccount).append("  [").append(blobName).append("]  ").append("  [").append(key).append("] ok").append("\n");
					} else {
						sb.append(storage.storageAccount).append("  [").append(blobName).append("]  ").append("  [").append(key).append("] error").append("\n");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				sb.append(storage.storageAccount).append(" error").append("\n");
			}
		}

		return sb.toString();
	}

	/**
	 */
	public String xmlUploadAws2Storage(String path, List<String> needUpdateFile) {
		String blobName = "xml";
		StringBuffer sb = new StringBuffer();

		for (AwsS3StorageBean storage : StorageManager.getInstance().awsS3StorageBeans.values()) {
			try {

				for (String key : needUpdateFile) {
					String name = key.substring(0, key.lastIndexOf("."));//文件名
					String suffix = key.substring(key.lastIndexOf("."));//带.的后缀名 
					String filePath = null;
					int version = xmlVersion.get(key);
					if (version == 0) {
						filePath = path + File.separatorChar + name + suffix;
					} else {
						filePath = path + File.separatorChar + name + "_" + version + suffix;
					}
					String blobFileName = name + "_" + version + suffix;

					boolean uploadSuccess = AwsS3.upload(storage, blobName + "/" + blobFileName, new File(filePath));
					if (uploadSuccess) {
						sb.append("aws").append("  [").append(blobName).append("]  ").append("  [").append(key).append("] ok").append("\n");
					} else {
						sb.append("aws").append("  [").append(blobName).append("]  ").append("  [").append(key).append("] error").append("\n");
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
				sb.append("aws").append(" error").append("\n");
			}
		}

		return sb.toString();

	}

	/**
	 * 更新资源文件到云存储
	 * @param path 资源文件的源路径
	 * @param needUpdateFile 新资源文件的文件名，不含版本号
	 * @return
	 */
	public String resUploadAws2Storage(String path, List<String> needUpdateFile) {
		String blobName = "assetbundles";
		StringBuffer sb = new StringBuffer();
		for (AwsS3StorageBean storage : StorageManager.getInstance().awsS3StorageBeans.values()) {
			try {

				for (String key : needUpdateFile) {
					String name = key.substring(0, key.lastIndexOf("."));//文件名
					String suffix = key.substring(key.lastIndexOf("."));//带.的后缀名 
					String filePath = null;
					int version = resVersion.get(key);
					if (version == 0) {
						filePath = path + File.separatorChar + name + suffix;
					} else {
						filePath = path + File.separatorChar + name + "_" + version + suffix;
					}
					String blobFileName = name + "_" + version + suffix;

					boolean uploadSuccess = AwsS3.upload(storage, blobName + "/" + blobFileName, new File(filePath));
					if (uploadSuccess) {
						sb.append("aws").append("  [").append(blobName).append("]  ").append("  [").append(key).append("] ok").append("\n");
					} else {
						sb.append("aws").append("  [").append(blobName).append("]  ").append("  [").append(key).append("] error").append("\n");
					}

				}
			} catch (Exception e) {
				e.printStackTrace();
				sb.append("aws").append(" error").append("\n");
			}
		}
		return sb.toString();
	}

	/**
	 * 将最新版本的xml或res文件打包
	 * @throws IOException 
	 */
	public void packNewFiles(String fileType) throws IOException {
		String packageName = null;
		String versionTxtName = null;
		String path = null;
		HashMap<String, Integer> versionMap = null;
		String tempFolder = "tempFile/";

		if (fileType.equals("xml")) {
			packageName = "latestVersionXmls.zip";
			versionTxtName = "xmlVersion.txt";
			path = StorageManager.getInstance().xmlPath;
			versionMap = xmlVersion;
		} else if (fileType.equals("res")) {
			packageName = "latestVersionReses.zip";
			versionTxtName = "resVersion.txt";
			path = StorageManager.getInstance().resPath;
			versionMap = resVersion;
		} else {
			return;
		}

		//创建临时目录
		File tempFolderFile = new File(path + tempFolder);
		if (!tempFolderFile.exists()) {
			tempFolderFile.mkdir();
		}

		String packageFilePath = path + File.separatorChar + packageName;
		List<File> files = new ArrayList<>();

		//生成一个记录所有文件最新版本号的文件
		File versionTxt = new File(path + tempFolder + File.separatorChar + versionTxtName);
		versionTxt.createNewFile();
		FileOutputStream out = new FileOutputStream(versionTxt);

		//获取最新版本的所有文件
		Iterator<Map.Entry<String, Integer>> iterator = versionMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, Integer> entry = iterator.next();
			String fileName = entry.getKey();
			int version = entry.getValue();

			String name = fileName.substring(0, fileName.lastIndexOf("."));//文件名，不含版本号和后缀
			String suffix = fileName.substring(fileName.lastIndexOf("."));//带.的后缀名 

			String filePath = null;
			if (version != 0) {
				filePath = path + File.separatorChar + name + "_" + version + suffix;
			} else {
				String srcFilePath = path + File.separatorChar + name + suffix;
				filePath = path + tempFolder + File.separatorChar + name + "_" + version + suffix;
				FileUtil.copyFile(srcFilePath, filePath);
			}

			File file = new File(filePath);
			files.add(file);

			String line = name + "=" + version + "\r\n";
			out.write(line.getBytes());
		}
		out.flush();
		out.close();
		files.add(versionTxt);

		try {
			ZipFileUtil.zipFiles(files, packageFilePath);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//删除临时目录
		FileUtil.delDir(path + tempFolder);
	}

	/**
	 * 下载xml、资源包
	 * @param fileType
	 * @param response
	 * @return
	 */
	public HttpServletResponse downloadPackageFile(String fileType, HttpServletResponse response) {
		String packageName = null;
		String path = null;

		if (fileType.equals("xml")) {
			packageName = "latestVersionXmls.zip";
			path = StorageManager.getInstance().xmlPath;
		} else if (fileType.equals("res")) {
			packageName = "latestVersionReses.zip";
			path = StorageManager.getInstance().resPath;
		} else {
			return response;
		}

		File file = new File(path + File.separatorChar + packageName);
		response = ZipFileUtil.downloadZip(file, response);

		return response;
	}

	/**
	 * 将选中的xml或res文件打包
	 * @throws IOException 
	 */
	public void packCheckedFiles(String fileType, String[] fileNames) throws IOException {
		String packageName = null;
		String path = null;
		HashMap<String, Integer> versionMap = null;
		String tempFolder = "temp/";

		if (fileType.equals("xml")) {
			packageName = "checkedXmls.zip";
			path = StorageManager.getInstance().xmlPath;
			versionMap = xmlVersion;
		} else if (fileType.equals("res")) {
			packageName = "checkedReses.zip";
			path = StorageManager.getInstance().resPath;
			versionMap = resVersion;
		} else {
			return;
		}

		//创建临时目录
		File tempFolderFile = new File(path + tempFolder);
		if (!tempFolderFile.exists()) {
			tempFolderFile.mkdir();
		}

		String packageFilePath = path + File.separatorChar + packageName;
		List<File> files = new ArrayList<>();

		for (int i = 0; i < fileNames.length; i++) {
			String fileName = fileNames[i];

			if (versionMap.get(fileName) == null) {
				continue;
			}
			int version = versionMap.get(fileName);

			String name = fileName.substring(0, fileName.lastIndexOf("."));//文件名，不含版本号和后缀
			String suffix = fileName.substring(fileName.lastIndexOf("."));//带.的后缀名 

			String filePath = null;
			if (version == 0) {
				filePath = path + File.separatorChar + fileName;
			} else {
				String srcFilePath = path + File.separatorChar + name + "_" + version + suffix;
				filePath = path + tempFolder + File.separatorChar + name + suffix;
				FileUtil.copyFile(srcFilePath, filePath);
			}

			File file = new File(filePath);
			files.add(file);
		}

		try {
			ZipFileUtil.zipFiles(files, packageFilePath);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//删除临时目录
		FileUtil.delDir(path + tempFolder);
	}

	/**
	 * 下载选中的文件包（xml、资源）
	 * @param fileType
	 * @param response
	 * @return
	 */
	public HttpServletResponse downloadCheckedPackageFile(String fileType, HttpServletResponse response) {
		String packageName = null;
		String path = null;

		if (fileType.equals("xml")) {
			packageName = "checkedXmls.zip";
			path = StorageManager.getInstance().xmlPath;
		} else if (fileType.equals("res")) {
			packageName = "checkedReses.zip";
			path = StorageManager.getInstance().resPath;
		} else {
			return response;
		}

		File file = new File(path + File.separatorChar + packageName);
		response = ZipFileUtil.downloadZip(file, response);

		return response;
	}

	/**
	 * 发布消息
	 */
	public void publishMessage(String operateName, String managerName, String fileType) {
		List<String> fileNameList = null;
		if (fileType.equals("xml")) {
			fileNameList = newXmls;
		}
		if (fileType.equals("res")) {
			fileNameList = newRes;
		}

		if ((fileNameList == null) || (fileNameList != null && !fileNameList.isEmpty())) {
			VersionMessage message = new VersionMessage(operateName, managerName, fileType, fileNameList);
			this.publish(message);
		}
	}
	
	/**
	 * 检查云存储上面文件是否存在
	 * @param fileName
	 * @return findResult,key:文件存放位置,value:文件是否存在（1表示存在，0表示不存在）
	 * @throws IOException
	 */
	public HashMap<String, Integer> findStorageFile(String fileName) throws IOException{
		HashMap<String, Integer> findResult = new HashMap<>();
		
		String fileType = fileName.substring(fileName.lastIndexOf(".")+1);
		String blobName = fileType.equals("xml") ? "xml":"assetbundles";
		HashMap<String, Integer> versions = fileType.equals("xml") ? xmlVersion:resVersion;
		int version = versions.get(fileName);
		if(version>0){
			fileName = fileName.replace(".", "_"+version+".");
		}
		
		HashMap<Integer, AzureStorageBean> azureStorageBeans = StorageManager.getInstance().azureStorages;
		Iterator<Entry<Integer, AzureStorageBean>> iterator1 = azureStorageBeans.entrySet().iterator();
		while (iterator1.hasNext()) {
			Entry<Integer, AzureStorageBean> entry = iterator1.next();
			int tag = entry.getKey();
			AzureStorageBean azureStorageBean = entry.getValue();
			String filePath = azureStorageBean.getStorageConnectionUri() + "/" + blobName + "/" + fileName;
			URL url = new URL(filePath);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			String message = connection.getHeaderField(0);
			
			if(message!=null && message.equals("HTTP/1.1 200 OK")){
				findResult.put("AzureStorage" + tag, 1);
			}else{
				findResult.put("AzureStorage" + tag, 0);
			}
		}
		
		HashMap<Integer, AwsS3StorageBean> awsS3StorageBeans = StorageManager.getInstance().awsS3StorageBeans;
		Iterator<Entry<Integer, AwsS3StorageBean>> iterator2 = awsS3StorageBeans.entrySet().iterator();
		while (iterator2.hasNext()) {
			Entry<Integer, AwsS3StorageBean> entry = iterator2.next();
			int tag = entry.getKey();
			AwsS3StorageBean awsS3StorageBean = entry.getValue();
			String filePath = awsS3StorageBean.getAccessUrl() + "/" + blobName + "/" + fileName;
			URL url = new URL(filePath);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			String message = connection.getHeaderField(0);
			
			if(message.equals("HTTP/1.1 200 OK")){
				findResult.put("AwsS3Storage" + tag, 1);
			}else{
				findResult.put("AwsS3Storage" + tag, 0);
			}
		}
		
		return findResult;
	}

}
