<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//java �ڵ带 ���� ����
	//jsp ���Ͽ����� �츮�� ���ϴ� ��� �۾� ���� (DB ���� > ���� > ��� > ȭ�� ���) > jsp (������ �ʿ��� ��� �۾� ����)
	//jsp ���� : ����.
	//	  ���� : �о�ȭ �����, �������� (��� �ڵ尡 �Ѱ���) >> ���ɻ簡 �и� �Ǿ� ���� �ʴ´�.
	
	Date date = new Date();
	/*
		JSP ������ : UI(html + css + javascript) + JAVA�ڵ�(<% ��ũ��Ʈ�� �ȿ� ����)
		>> �������ڵ� + ������ �����ڵ� ���� : ������ > ����, �������� �ϱ� ��ƴ�
				
		servlet(��) > �� ���� java ���� > jsp(����)
		>>java �� ��� ����� �ƴϴ�. > ����, �׸���, ������ ���α׷�(awt, swing) > �� ����(��ü : request, response)
		>>java ������ Web�� ���� ���� > login.java > loinko.java (����ü ���...) > ������ ����ϴ� �ڹ�(servlet)
		>>���� : ���� ��ƴ�, ������ �۾� (�����), ����(X)
		
			[ ���������� ������ �ڵ�]
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<html>");
				out.print("<head><title>HELLO</title></head>");
				out.print("<body>");
					out.print("���� ��¥ : " + new Date() + "<br>");
					out.print("<script>alert('���')</script");
				out.print("</body>");
			out.print("<html>");
		
		>> JSP ź�� >> ���� >> UI�۾� >> web page >> html base >> ������ good >> ���� java�ڵ� <%....�ȿ�
		>> ���� (JAVA + UI) >> �����...
		
		����)
		������ ������ �츮�� (�������� ���α׷����� ���ϴ� ���� Ű�� ����, ������ ȿ��) >> MVC ���� ����
		>> JSP(UI) + JAVA(������ �ڹ� �ڵ�) + servlet(�� ��û, ���� ������ ����)
		�о� ����
		Model (DTO , DAO)	>> ������ JAVA
		View  (UI)			>> JSP
		Controller(�߾�����)  	>> Servlet
		
		MVC �������� ������� ���� �ǰ� �ִ�. >> �߰������� MSA ��� ������ �ִ�.
		>> model1, model2
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
��¥ : <%=date %>
</body>
</html>