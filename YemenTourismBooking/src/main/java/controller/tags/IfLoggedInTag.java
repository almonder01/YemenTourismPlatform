package controller.tags;

import model.User;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

public class IfLoggedInTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        PageContext pageContext = (PageContext) getJspContext();
        HttpSession session = pageContext.getSession();
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                getJspBody().invoke(null);
            }
        }
    }
}