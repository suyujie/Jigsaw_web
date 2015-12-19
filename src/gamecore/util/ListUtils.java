package gamecore.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ListUtils {

	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List shuffled(List list){
		List result = new ArrayList();
		
		Set set = new HashSet();
		
		for (Object object : list) {
			set.add(object);
		}
		
		result.addAll(set);
		
		
		return result;
	}
	
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		
		for (int i = 0; i < 10; i++) {
			list.add("String"+i);
		}
			
		list = 	ListUtils.shuffled(list);
			
		for (String string : list) {
			System.out.println(string);
		}
		
	}
	
	
	
	
}
