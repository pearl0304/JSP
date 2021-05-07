package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.jboard2.controller.CommonService;
import kr.co.jboard2.dao.ArticleDao;
public class CommentService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String parent = req.getParameter("parent");
		String comment = req.getParameter("comment");
		String uid = req.getParameter("uid");
		String regip = req.getRemoteAddr();
		
	
		//데이터 베이스 처리 - 댓글 insert
		ArticleDao dao = ArticleDao.getInstance();
		dao.insertComment(parent, comment, uid, regip);
		
		//데이터베이스 처리 - 원글 댓글 카운트 update
		dao.updateArticleCommetnInc(parent);
							
		return "redirect:/Jboard2/view.do?seq="+parent;
	}
}
