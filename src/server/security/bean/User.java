package server.security.bean;

import java.util.HashMap;
import java.util.HashSet;

public class User {
	private static final String Username = "username";
	private static final String Password = "password";
	private static final String Role = "role";
	private static final String RoleSet = "roleSet";

	private String username;
	private String password;
	private String role;
	
	public User(String username, String password, String role) {
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public HashSet<Integer> getRoleSet(){
		HashSet<Integer> roleSet = new HashSet<>();
		if(role!=null && !role.equals("")){
			String[] array = role.split(",");
			for(int i=0; i<array.length; i++){
				if(!array[i].equals("")){
					roleSet.add(Integer.parseInt(array[i]));
				}
			}
		}
		return roleSet;
	}

	public HashMap<String, Object> toMap() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put(Username, username);
		map.put(Password, password);
		map.put(Role, role);
		map.put(RoleSet, getRoleSet());

		return map;
	}
}
