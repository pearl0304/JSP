package sub1;

import javax.servlet.jsp.JspWriter;

public class Account{
	
	private String bank;
	private String accId;
	private String name;
	private int money;
	
	public Account(String bank, String accId, String name, int money) {
		this.bank=bank;
		this.accId=accId;
		this.name=name;
		this.money=money;
	}
	
	public void deposit(int money) {
		this.money += money;
	}
	
	public void withdraw(int money) {
		this.money -= money;
	}
	
	public void show(JspWriter out) throws Exception {
		out.print("<p>");
		out.print("은행명 : "+bank+"</br>");
		out.print("계좌번호 : "+accId+"</br>");	
		out.print("입금주 : "+name+"</br>");	
		out.print("현재잔액 : "+money+"</br>");	
		out.print("</p>");
		
	}

	
	
	
	
	
}