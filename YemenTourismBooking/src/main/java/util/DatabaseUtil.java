package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	public static Connection get_connection() {
		String url = "jdbc:mysql://localhost:3306/yemen_tourism_db";
		String username = "root";
		String password = "77MoNdEr200!";
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connection Successfully");
		} catch (Exception e) {
			System.out.println("DB Connection error: " + e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}
}