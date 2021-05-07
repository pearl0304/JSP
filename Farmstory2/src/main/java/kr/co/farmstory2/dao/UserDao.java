package kr.co.farmstory2.dao;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.farmstory2.config.DBConfig;
import kr.co.farmstory2.config.Sql;
import kr.co.farmstory2.vo.Termsvo;
import kr.co.farmstory2.vo.UserVo;

import java.sql.PreparedStatement;


public class UserDao {
	
	private static UserDao instnace = new UserDao();
	private UserDao() {}
	
	public static UserDao getInstnace() {
		return instnace;
	}
	

	public Termsvo selectTerms() throws Exception{
		//1�ܰ� ~2�ܰ� - �����ͺ��̽� ����̺� �ε� �� �����ͺ��̽� ����
		Connection conn = DBConfig.getIncetence().getConnection();
		//3�ܰ� SQL ��ü ���� 
		Statement stmt = conn.createStatement();
		//4�ܰ� SQL ���� 
		ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
		
		//5�ܰ�  SQL ���ó�� 
		Termsvo tb = new Termsvo();
		
		if (rs.next()) {
			tb.setTerms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		}
		
		//6�ܰ� SQL �ݱ� 
		rs.close();
		stmt.close();
		conn.close();
		return tb;
	}	

	public void insertUser(UserVo user) throws Exception{
		//1~2�ܰ� 
		Connection conn = DBConfig.getIncetence().getConnection();
		//3�ܰ� SQL ��ü����� 
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_USER);
		psmt.setString(1,user.getUid());
		psmt.setString(2,user.getPass());
		psmt.setString(3,user.getName());
		psmt.setString(4,user.getNick());
		psmt.setString(5,user.getEmail());
		psmt.setString(6,user.getHp());
		psmt.setString(7,user.getZip());
		psmt.setString(8,user.getAddr1());
		psmt.setString(9,user.getAddr2());
		psmt.setString(10,user.getRegip());
		//4�ܰ� 
		psmt.executeUpdate();
		//5�ܰ�
		//6�ܰ�
		psmt.close();
		conn.close();
	}

	public UserVo selectUser(String uid, String pass) throws Exception{
		//1�ܰ�~2�ܰ�
		Connection conn = DBConfig.getIncetence().getConnection();
		//3�ܰ�
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		//4�ܰ�
		ResultSet rs = psmt.executeQuery();
		
		//5�ܰ�
		UserVo user= null;
		
		if(rs.next()) {
			//ȸ���� �´� ��� 
			user = new UserVo();
			user.setUid(rs.getString(1));
			user.setPass(rs.getString(2));
			user.setName(rs.getString(3));
			user.setNick(rs.getString(4));
			user.setEmail(rs.getString(5));
			user.setHp(rs.getString(6));
			user.setGrade(rs.getInt(7));
			user.setZip(rs.getString(8));
			user.setAddr1(rs.getString(9));
			user.setAddr2(rs.getString(10));
			user.setRegip(rs.getString(11));
			user.setRdate(rs.getString(12));
		}
		//6�ܰ�
			rs.close();
			psmt.cancel();
			conn.close();
			return user;
		}









}
