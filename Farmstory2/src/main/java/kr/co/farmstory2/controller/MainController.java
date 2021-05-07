package kr.co.farmstory2.controller;

import java.io.FileInputStream;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.service.CommonService;


public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// ��Ʈ�ѷ��� ���� ����ɶ� ����Ǵ� �ʱ�ȭ �޼���  
		
		// ������Ƽ ����(�׼��ּ� ���� ����) ��� ���ϱ�
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		// ������Ƽ ���� �Է� ��Ʈ�� ����
		Properties prop = new Properties();
		
		try {
			
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// ������Ƽ ��ü ���� �� Service ��ü ������ ����
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	public void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// ��û �ּҿ��� service ��ü key ���ϱ�
		String path = req.getContextPath();
		String uri  = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// service ��ü map���� ������
		CommonService instance = (CommonService) instances.get(key);		
		
		// service ��ü ������ view ���� �ޱ�
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// �����̷�Ʈ
			String redirectUrl = result.substring(9);			
			resp.sendRedirect(redirectUrl);
			
		}else if(result.startsWith("json:")) {
			// Json ���
			PrintWriter out = resp.getWriter();
			out.print(result.substring(5));				
			
		}else if(result.startsWith("file:")){
			
			String fname = result.substring(5);
			
			// ���� �ٿ�ε� response �������
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode("fname", "utf-8"));
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
			
		}else {
			// View ������
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);	
		}
	}
}






















