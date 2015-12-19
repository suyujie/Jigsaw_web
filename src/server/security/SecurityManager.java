package server.security;

import java.io.File;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import server.security.bean.User;

/**
 * 服务器配置。
 */
public class SecurityManager implements Serializable {
	private static final long serialVersionUID = 7927813753563387843L;
	private final static Logger logger = LogManager.getLogger(SecurityManager.class.getName());
	protected static SecurityManager instance = new SecurityManager();
	//角色集合，key:roleId,value:roleName
	public HashMap<Integer, String> roles = null;
	//用户集合，key:username,value:User
	public HashMap<String, User> users = null;
	//开放资源集合，resourceName
	public HashSet<String> openResources = null;
	//forNode资源集合，resourceName
	public HashSet<String> forNodeResources = null;
	//角色-资源对应表，key:roleId,value:resourceSet
	public HashMap<Integer, HashSet<String>> role_resources = null;

	private SecurityManager(){
		
	}
	/**
	 * 获取唯一实例.
	 * @return
	 */
	public static SecurityManager getInstance() {
		return instance;
	}

	/**
	 * 从配置文件加载配置
	 * @return
	 */
	public boolean load() {
		roles = new HashMap<Integer, String>();
		users = new HashMap<String, User>();
		openResources = new HashSet<String>();
		forNodeResources = new HashSet<String>();
		role_resources = new HashMap<Integer, HashSet<String>>() ;
		
		String fileName = null;
		try {
			fileName = URLDecoder.decode(this.getClass().getResource("/").getPath() + "properties/security.xml", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		File file = new File(fileName);

		if (!file.exists()) {
			logger.error("NOT FOUND security file!");
			return false;
		}

		SAXReader reader = new SAXReader();
		try {
			Document doc = reader.read(file);
			Element root = doc.getRootElement();

			//----------角色列表------------
			Element rolesElement = root.element("roles");
			if (null != rolesElement) {
				@SuppressWarnings("unchecked")
				List<Element> roleElementArray = rolesElement.elements("role");
				for (Element el : roleElementArray) {
					Integer roleId = Integer.parseInt(el.attributeValue("id"));
					String roleName = el.getTextTrim();
					roles.put(roleId, roleName);
					role_resources.put(roleId, new HashSet<String>());
				}
			}

			//----------用户列表----------
			Element usersElement = root.element("users");
			if (null != usersElement) {
				@SuppressWarnings("unchecked")
				List<Element> userElementArray = usersElement.elements("user");
				if (null != userElementArray) {
					for (Element userElement : userElementArray) {
						Attribute usernameAttr = userElement.attribute("username");
						Attribute passwordAttr = userElement.attribute("password");
						Attribute roleAttr = userElement.attribute("role");
						
						if(usernameAttr==null || roleAttr==null || passwordAttr==null){
							continue;
						}
						
						String username = usernameAttr.getValue().trim();
						String password = passwordAttr.getValue().trim();
						String role = roleAttr.getValue().trim();
						
						if(username.equals("")){
							continue;
						}
						
						User user = new User(username, password, role);
						users.put(username, user);
					}
				}
			}
			
			//----------资源列表----------
			Element resourcesElement = root.element("resources");
			if (null != resourcesElement) {
				//openResource
				Element openResourcesElement = resourcesElement.element("openResources");
				@SuppressWarnings("unchecked")
				List<Element> resourceElementArray_open = openResourcesElement.elements("resource");
				if (null != resourceElementArray_open) {
					for (Element resource : resourceElementArray_open) {						
						String name = resource.attributeValue("name").trim();
						if(name==null || name.equals("")){
							continue;
						}
						openResources.add(name);
					}
				}
				
				//forNodeResource
				Element forNodeResourcesElement = resourcesElement.element("forNodeResources");
				@SuppressWarnings("unchecked")
				List<Element> resourceElementArray_forNode = forNodeResourcesElement.elements("resource");
				if (null != resourceElementArray_forNode) {
					for (Element resource : resourceElementArray_forNode) {						
						String name = resource.attributeValue("name").trim();
						if(name==null || name.equals("")){
							continue;
						}
						forNodeResources.add(name);
					}
				}
				
				//roleResource
				Element roleResourcesElement = resourcesElement.element("roleResources");
				@SuppressWarnings("unchecked")
				List<Element> resourceElementArray_role = roleResourcesElement.elements("resource");
				if (null != resourceElementArray_role) {
					for (Element resource : resourceElementArray_role) {						
						String name = resource.attributeValue("name").trim();
						String role = resource.attributeValue("role").trim();
						
						if(name==null || name.equals("")){
							continue;
						}
						
						if(role!=null && !role.equals("")){
							String[] roleArray = role.split(",");
							for(int i=0; i<roleArray.length; i++){
								int roleId = Integer.parseInt(roleArray[i]);
								if(role_resources.containsKey(roleId)){
									HashSet<String> resourceNameSet = role_resources.get(roleId);
									resourceNameSet.add(name);
									role_resources.put(roleId, resourceNameSet);
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		//读取数据库user数据
		List<User> userList = SecurityRoot.userSystem.readUsersFromDB();
		if(userList!=null && !userList.isEmpty()){
			for(User user : userList){
				users.put(user.getUsername(), user);
			}
		}

		return true;
	}

}
