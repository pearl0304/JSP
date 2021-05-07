package kr.co.Jboard.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	private static DBConfig instance = new DBConfig();
	private DBConfig() {};
	
	public static DBConfig getIncetence() {
		return instance;
	}
	
	//DB Á¤º¸
	private String HOST = "jdbc:mysql://3.36.97.36:3306/WorkSpace";
	private String USER = "pearl";
	private String PASS = "dkakwhs2@";
	
	public Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
