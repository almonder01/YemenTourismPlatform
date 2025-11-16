package util;

import dao.UserDao;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet("/setup-initial-admin-account")
public class SetupAdminServlet extends HttpServlet {

    //@Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        UserDao userDao = new UserDao();

        if (userDao.getUserByUsername("admin") != null) {
            out.println("<h1>Admin user already exists. No action taken.</h1>");
            return;
        }

        User adminUser = new User();
        adminUser.setUsername("admin");
        adminUser.setEmail("admin@yementourism.com");
        adminUser.setPasswordHash("admin123"); 
        adminUser.setRole("admin");

        try {
            userDao.addUser(adminUser);
            out.println("<h1>Admin account created successfully!</h1>");
            out.println("<p>Username: admin</p>");
            out.println("<p>Password: admin123</p>");
            out.println("<p>You can now login. It is recommended to delete or disable this servlet from deployment after first use.</p>");
        } catch (Exception e) {
            out.println("<h1>An error occurred while creating the admin account.</h1>");
            e.printStackTrace(out);
        }
    }
}