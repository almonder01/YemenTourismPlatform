package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Testconnect {
	
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/demo";
		String username = "root";
		String password = "0000";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connection Successfully");
		} catch(Exception e) {
			System.out.println(e);
		}
	}
}
