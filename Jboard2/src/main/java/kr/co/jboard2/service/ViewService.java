package kr.co.jboard2.service;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommonService;
import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class ViewService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
			
			String seq = req.getParameter("seq");

				//데이터 베이스 처리 - 게시물 가져오기
				ArticleVo ab=ArticleDao.getInstance().selectArticle(seq);
				req.setAttribute("ab", ab);
				
				//데이터베이스 처리 - 조회수 업데이트
				ArticleDao dao = ArticleDao.getInstance();
				dao.updateArticleHit(seq);
				
				//데이터베이스 처리 - 댓글 가져오기
				List<ArticleVo> comments =dao.selectComments(seq);
		
			return "/view.jsp";

			
	}

}
