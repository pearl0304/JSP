package kr.co.jboadr1.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

	//싱글톤 객체
	private static DBConfig instance = new DBConfig();
	private DBConfig () {} //외부에서 객체 생성을 못하도록 함
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	//데이터베이스 정보
	private	final String HOST = "jdbc:mysql://192.168.10.114:3306/ljj";
	private	final String USER = "ljj";
	private	final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);	
		return conn; 
	}	
}
