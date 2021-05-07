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

				//������ ���̽� ó�� - �Խù� ��������
				ArticleVo ab=ArticleDao.getInstance().selectArticle(seq);
				req.setAttribute("ab", ab);
				
				//�����ͺ��̽� ó�� - ��ȸ�� ������Ʈ
				ArticleDao dao = ArticleDao.getInstance();
				dao.updateArticleHit(seq);
				
				//�����ͺ��̽� ó�� - ��� ��������
				List<ArticleVo> comments =dao.selectComments(seq);
		
			return "/view.jsp";

			
	}

}
