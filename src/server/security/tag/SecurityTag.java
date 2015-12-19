package server.security.tag;

import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import server.security.bean.User;

public class SecurityTag extends TagSupport {

	private static final long serialVersionUID = -7784275839112618942L;
	
	private static final String UserStr = "User";

	public String roles;
	
	@Override
	public int doStartTag() throws JspException {
		String roleStrs = getRoles();
		String[] roleArray = roleStrs.split("[, ]");
		
		HttpSession session = pageContext.getSession();
		User user = (User) session.getAttribute(UserStr);
		
		Set<Integer> roleSet = user.getRoleSet();
		for (int i = 0; i < roleArray.length; i++) {
			String roleId = roleArray[i].trim();
			if(!roleId.equals("")){
				if(roleSet.contains(Integer.parseInt(roleId))){
					return EVAL_BODY_INCLUDE;
				}
			}
		}
		return SKIP_BODY;
	}

	@Override
	public int doAfterBody() throws JspException {
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}
	
	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}
	
}
