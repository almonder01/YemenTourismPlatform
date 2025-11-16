package controller.tags;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.PageContext;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class IfGuestTag extends SimpleTagSupport {

    @Override
    public void doTag() throws JspException, IOException {
        PageContext pageContext = (PageContext) getJspContext();
        HttpSession session = pageContext.getSession();
        if (session == null || session.getAttribute("user") == null) {
            getJspBody().invoke(null);
        }
    }
}