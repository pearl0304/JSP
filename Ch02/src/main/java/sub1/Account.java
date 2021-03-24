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
		out.print("����� : "+bank+"</br>");
		out.print("���¹�ȣ : "+accId+"</br>");	
		out.print("�Ա��� : "+name+"</br>");	
		out.print("�����ܾ� : "+money+"</br>");	
		out.print("</p>");
		
	}

	
	
	
	
	
}