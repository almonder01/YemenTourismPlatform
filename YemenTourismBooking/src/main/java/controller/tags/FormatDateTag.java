package controller.tags;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

public class FormatDateTag extends SimpleTagSupport {

    private Date value;
    private String pattern;

    public void setValue(Date value) {
        this.value = value;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    @Override
    public void doTag() throws JspException, IOException {
        if (value == null) {
            return;
        }

        String formatPattern = (pattern != null && !pattern.isEmpty()) ? pattern : "dd MMMM, yyyy";

        try {
            SimpleDateFormat sdf = new SimpleDateFormat(formatPattern);
            String formattedDate = sdf.format(value);
            JspWriter out = getJspContext().getOut();
            out.print(formattedDate);
        } catch (Exception e) {
            throw new JspException("Error formatting date: " + e.getMessage(), e);
        }
    }
}