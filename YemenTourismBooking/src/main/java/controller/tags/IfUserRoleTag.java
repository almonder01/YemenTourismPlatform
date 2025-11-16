package controller.tags;

import model.User;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class IfUserRoleTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        PageContext pageContext = (PageContext) getJspContext();
        HttpSession session = pageContext.getSession();
        
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null && "user".equalsIgnoreCase(user.getRole())) {
                getJspBody().invoke(null);
            }
        }
    }
}