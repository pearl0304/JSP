package kr.co.Jboard.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.Jboard.been.ArticleBean;
import kr.co.Jboard.been.FileBean;
import kr.co.Jboard.config.DBConfig;
import kr.co.Jboard.config.Sql;

public class ArticleDao {
	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	public static ArticleDao getInstence() {
		return instance;
	}
	
	//게시판 리스트 페이지 처리 관련 메서드 
	public int getPageStratNum(int total, int start) throws Exception{
		return total-start;
	}
	
	public int[] getPageGroup(int currentPage, int lastPageNum) throws Exception{
		int groupCurrent =(int) Math.ceil(currentPage/10.0);
		int groupStart = (groupCurrent-1)*10+1;
		int groupEnd = groupCurrent*10;
		if(groupEnd>lastPageNum) {
			groupEnd=lastPageNum;
		}
		int groups[] = {groupStart, groupEnd};
		return groups;
	}
	
	public int getcurrentPage (String pg) throws Exception{
		int currentPage =1;
		if(pg!=null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	public int getLimitStart(int currentPage) throws Exception{
		return (currentPage-1)*10;
	}
	
	public int getLastPageNum(int total) throws Exception{
		int lastPageNum=0;
		if(total%10==0) {
			lastPageNum =total/10;
		}else {
			lastPageNum = (total/10)+1;
		}
		return lastPageNum;
	}
	
	public int selectCountArticel() throws Exception{
		//1~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		Statement stmt = conn.createStatement();
		//4단계
		ResultSet rs = stmt.executeQuery(Sql.SELECT_COUNT_ARTICLE);
		int total=0;
		//5단계
		if(rs.next()) {
			total=rs.getInt(1);
		}
		//6단계
		rs.close();
		stmt.close();
		conn.close();
		return total;
	}

	public int selecMaxSeq() throws Exception{
		//1~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		Statement stmt = conn.createStatement();
		//4단계
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ); 
		//5단계
		int seq=0;
		if(rs.next()) {
			seq=rs.getInt(1);
		}
		//6단계
		rs.close();
		stmt.close();
		conn.close();
		
		return seq;
	}
	
	public int insertArticle(ArticleBean article) throws Exception{

		//1~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		PreparedStatement psmt =conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1,article.getTitle());
		psmt.setString(2,article.getContent());
		psmt.setInt(3,article.getFile());
		psmt.setString(4,article.getUid());
		psmt.setString(5,article.getRegip());
		//4단계
		psmt.executeUpdate();
		//5단계
		//6단계
		psmt.close();
		conn.close();
		
		//방금 insert한 글번호 가져오기 
		int seq=selecMaxSeq();
		return seq;
		}
	
		public void insestFile(int parent, String oldName, String newName) throws Exception {
		//1단계~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
		psmt.setInt(1, parent);
		psmt.setString(2, oldName);
		psmt.setString(3, newName);
		//4단계 
		psmt.executeUpdate();
		//5단계 
		//6단계 
		psmt.close();
		conn.close();

		}
	
	public ArticleBean selectArticle(String seq) throws Exception{
		//1~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
		psmt.setString(1, seq);
		//4단계
		ResultSet rs = psmt.executeQuery();
		//5단계
		ArticleBean ab = new ArticleBean();
		FileBean fb = new FileBean();
		if(rs.next()) {
		ab.setSeq(rs.getInt(1));	
		ab.setParent(rs.getInt(2));	
		ab.setComment(rs.getInt(3));	
		ab.setCate(rs.getString(4));	
		ab.setTitle(rs.getString(5));	
		ab.setContent(rs.getString(6));	
		ab.setFile(rs.getInt(7));	
		ab.setHit(rs.getInt(8));	
		ab.setUid(rs.getString(9));	
		ab.setRegip(rs.getString(10));	
		ab.setRdate(rs.getString(11));		
		
		fb.setSeq(rs.getInt(12));
		fb.setParent(rs.getInt(13));
		fb.setOldName(rs.getString(14));
		fb.setNewName(rs.getString(15));
		fb.setDownload(rs.getInt(16));
		fb.setRdate(rs.getString(17));
		
		ab.setFb(fb);
		}
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return ab;
		}
	
	public List<ArticleBean> selectAritlces(int start) throws Exception{
		//1~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
		psmt.setInt(1,start);
		//4단계
		ResultSet rs = psmt.executeQuery();
		//5단계
		List<ArticleBean> articles = new ArrayList<>();
		while(rs.next()) {
			ArticleBean ab= new ArticleBean();
			ab.setSeq(rs.getInt(1));	
			ab.setParent(rs.getInt(2));	
			ab.setComment(rs.getInt(3));	
			ab.setCate(rs.getString(4));	
			ab.setTitle(rs.getString(5));	
			ab.setContent(rs.getString(6));	
			ab.setFile(rs.getInt(7));	
			ab.setHit(rs.getInt(8));	
			ab.setUid(rs.getString(9));	
			ab.setRegip(rs.getString(10));	
			ab.setRdate(rs.getString(11));
			ab.setNick(rs.getString(12));
			
			articles.add(ab);
			
		}
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		
		return articles;
	}
	
	public void insertComment(String parent, String content, String uid, String regip) throws Exception{
		//1~2단계
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계 
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
		psmt.setString(1, parent);
		psmt.setString(2, content);
		psmt.setString(3, uid);
		psmt.setString(4, regip);

		//4단계 
		psmt.executeUpdate();
		//5단계 
		//6단계 
		psmt.close();
		conn.close();
	}
	public List<ArticleBean> selectComments (String parent) throws Exception{
		//1~2단계 
		Connection conn = DBConfig.getIncetence().getConnection();
		//3단계 
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
		psmt.setString(1, parent);
		//4단계 
		ResultSet rs = psmt.executeQuery();
		//5단계 
		List<ArticleBean> comments = new ArrayList<>();
		while (rs.next()) {
			ArticleBean ab = new ArticleBean();
			ab.setSeq(rs.getInt(1));	
			ab.setParent(rs.getInt(2));	
			ab.setComment(rs.getInt(3));	
			ab.setCate(rs.getString(4));	
			ab.setTitle(rs.getString(5));	
			ab.setContent(rs.getString(6));	
			ab.setFile(rs.getInt(7));	
			ab.setHit(rs.getInt(8));	
			ab.setUid(rs.getString(9));	
			ab.setRegip(rs.getString(10));	
			ab.setRdate(rs.getString(11));
			ab.setNick(rs.getString(12));
			
			comments.add(ab);
		}
		//6단계
		rs.close();
		psmt.close();
		conn.close();
		return comments;
	}
		public void updateArticleHit(String seq) throws Exception{
			//1~2단계
			Connection conn = DBConfig.getIncetence().getConnection();
			//3단계 
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, seq);
			//4단계
			psmt.executeUpdate();
			//5단계 
			//6단계 
			psmt.close();
			conn.close();
		}
		
		public void updateArticleCommetnInc(String seq) throws Exception{
			//1~2단계
			Connection conn = DBConfig.getIncetence().getConnection();
			//3단계 
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_INC);
			psmt.setString(1, seq);
			//4단계
			psmt.executeUpdate();
			//5단계 
			//6단계 
			psmt.close();
			conn.close();
		}
		
		public void updateArticleCommentDec(String seq) throws Exception{
			//1~2단계
			Connection conn = DBConfig.getIncetence().getConnection();
			//3단계 
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_DEC);
			psmt.setString(1, seq);
			//4단계
			psmt.executeUpdate();
			//5단계 
			//6단계 
			psmt.close();
			conn.close();
		}
		
		public void deleteArticleComment(String seq) throws Exception{
			//1~2단계
			Connection conn = DBConfig.getIncetence().getConnection();
			//3단계 
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, seq);
			//4단계
			psmt.executeUpdate();
			//5단계 
			//6단계 
			psmt.close();
			conn.close();
		}
		
		
		
		public int updateArticle(ArticleBean article) throws Exception{

			//1~2단계
			Connection conn = DBConfig.getIncetence().getConnection();
			//3단계
			PreparedStatement psmt =conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1,article.getTitle());
			psmt.setString(2,article.getContent());
			psmt.setInt(3,article.getFile());
			psmt.setString(4,article.getUid());
			psmt.setString(5,article.getRegip());
			//4단계
			psmt.executeUpdate();
			//5단계
			//6단계
			psmt.close();
			conn.close();
			
			//방금 insert한 글번호 가져오기 
			int seq=selecMaxSeq();
			return seq;
			}
		
			public void updateFile(int parent, String oldName, String newName) throws Exception {
			//1단계~2단계
			Connection conn = DBConfig.getIncetence().getConnection();
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, oldName);
			psmt.setString(3, newName);
			//4단계 
			psmt.executeUpdate();
			//5단계 
			//6단계 
			psmt.close();
			conn.close();
	
			}		
		
		
		
}




