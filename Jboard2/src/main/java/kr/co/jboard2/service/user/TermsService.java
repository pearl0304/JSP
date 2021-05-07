package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommonService;
import kr.co.jboard2.dao.UserDao;
import kr.co.jboard2.vo.TermsVo;

public class TermsService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		try {
			TermsVo vo = UserDao.getInstance().selectTerms();
			
			//view���� vo ��ü�� �����ϱ� ���� controller-service-view���� �����Ǵ� requset ��ü �̿� 
			req.setAttribute("vo", vo);
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return "/user/terms.jsp";
	}

}
