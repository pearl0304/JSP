package kr.co.Jboard.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;


import kr.co.Jboard.been.TermsBean;
import kr.co.Jboard.been.UserBean;
import kr.co.Jboard.config.DBConfig;
import kr.co.Jboard.config.Sql;

public class UserDao {
	
	private static UserDao instnace = new UserDao();
	private UserDao() {}
	
	public static UserDao getInstnace() {
		return instnace;
	}
	

	public TermsBean selectTerms() throws Exception{
		//1단계 ~2단계 - 데이터베이스 드라이브 로드 및 데이터베이스 연동
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계 SQL 객체 생성 
		Statement stmt = conn.createStatement();
		//4단계 SQL 실행 
		ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
		
		//5단계  SQL 결과처리 
		TermsBean tb = new TermsBean();
		
		if (rs.next()) {
			tb.setTerm(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		}
		
		//6단계 SQL 닫기 
		rs.close();
		stmt.close();
		conn.close();
		return tb;
	}	

	public void insertUser(UserBean user) throws Exception{
		//1~2단계 
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계 SQL 객체만들기 
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
		//4단계 
		psmt.executeUpdate();
		//5단계
		//6단계
		psmt.close();
		conn.close();
	}

	public UserBean selectUser(String uid, String pass) throws Exception{
		//1단계~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		//4단계
		ResultSet rs = psmt.executeQuery();
		
		//5단계
		UserBean user= null;
		
		if(rs.next()) {
			//회원이 맞는 경우 
			user = new UserBean();
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
		//6단계
			rs.close();
			psmt.cancel();
			conn.close();
			return user;
		}









}
