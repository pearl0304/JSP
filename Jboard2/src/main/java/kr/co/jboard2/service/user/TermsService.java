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
			
			//view에서 vo 객체를 참조하기 위해 controller-service-view에서 공유되는 requset 객체 이용 
			req.setAttribute("vo", vo);
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return "/user/terms.jsp";
	}

}
