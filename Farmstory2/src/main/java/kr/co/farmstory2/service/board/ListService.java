package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.service.CommonService;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		req.setAttribute("cate", cate);
		req.setAttribute("group", group);
		return "/board/list.jsp";
	}

}
