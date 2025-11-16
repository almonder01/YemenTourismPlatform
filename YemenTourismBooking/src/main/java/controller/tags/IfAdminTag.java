package controller.tags;

import java.io.IOException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import model.User;

public class IfAdminTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        PageContext pageContext = (PageContext) getJspContext();
        HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null && "admin".equalsIgnoreCase(user.getRole())) {
                getJspBody().invoke(null);
            }
        }
    }
}