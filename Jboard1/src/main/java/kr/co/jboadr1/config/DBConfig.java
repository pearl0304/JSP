package kr.co.jboadr1.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

	//�̱��� ��ü
	private static DBConfig instance = new DBConfig();
	private DBConfig () {} //�ܺο��� ��ü ������ ���ϵ��� ��
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	//�����ͺ��̽� ����
	private	final String HOST = "jdbc:mysql://192.168.10.114:3306/ljj";
	private	final String USER = "ljj";
	private	final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);	
		return conn; 
	}	
}
