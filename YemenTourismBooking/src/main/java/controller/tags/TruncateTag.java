package controller.tags;

import java.io.IOException;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

public class TruncateTag extends SimpleTagSupport {

    private String text;
    private int length;
    private String suffix;

    public void setText(String text) {
        this.text = text;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    @Override
    public void doTag() throws JspException, IOException {
        if (text == null || text.isEmpty() || length <= 0) {
            return;
        }

        String finalSuffix = (suffix != null) ? suffix : "...";
        String outText;

        if (text.length() > length) {
            if (length > finalSuffix.length()) {
                 outText = text.substring(0, length - finalSuffix.length()) + finalSuffix;
            } else {
                 outText = text.substring(0, length);
            }
        } else {
            outText = text;
        }

        JspWriter out = getJspContext().getOut();
        out.print(outText);
    }
}