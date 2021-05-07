package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommonService;
import kr.co.jboard2.dao.ArticleDao;

public class DeleteCommentService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String seq = req.getParameter("seq");
		String parent =req.getParameter("parent");
		
		//댓글 삭제
		ArticleDao dao = ArticleDao.getInstance();
		dao.deleteComment(seq);
		
		//원글 댓글 카운트 -1
		dao.updateArticleCommentDec(parent);
		
		return "redirect:/Jboard2/view.jsp?seq="+parent;
	}

}
