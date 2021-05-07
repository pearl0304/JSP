package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.controller.CommonService;
import kr.co.jboard2.dao.UserDao;
import kr.co.jboard2.vo.UserVo;

public class LoginService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("POST")) {
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			UserVo vo = UserDao.getInstance().selectUser(uid, pass);
			
				if(vo !=null) {
					//ȸ���� ���� ��� 
					HttpSession sess = req.getSession();
					sess.setAttribute("suser", vo);
					
					//�����̷�Ʈ
					return "redirect:/Jboard2/list.do";
						
					}else {
					//ȸ���� �ƴҰ�� 
						return "redirect:/Jboard2/user/login.do?result=0";
					}
			}else{
				return "/user/login.jsp";}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

