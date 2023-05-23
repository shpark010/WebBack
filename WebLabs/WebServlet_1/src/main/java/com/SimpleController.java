package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
1. SimpleController extends HttpServlet
>> SimpleController HttpServlet 파일을 상속하고 있다.
>> SimpleController.java >> 웹에 사용되는 객체를 사용 가능 >> 일반 자바파일이 아니라 웹용 자바파일(Servlet)

>> HttpServletRequest request = new HttpServletRequest(); 
>> request 객체가 자동 생성 -> request 객체를 가지고 놀 수있다.

>> HttpServletResponse response = new HttpServletResopnse(); 
>> response 객체가 자동 생성 -> response 객체를 가지고 놀 수있다.

jsp 파일
주소창에 : http://..../default.jsp

Servlet 파일
주소창에 : http://..../SimpleController.java ->(X)

web.xml 파일에서 요청 주소를 설정
[어떤 요청 주소]가 들어오면 SimpleController.java 파일을 컴파일 하고 실행할것인지 정의

web.xml
에서
	<servlet-name>simplecontroller</servlet-name>
  	<url-pattern>/simple</url-pattern>
  	1. http://localhost:8090/WebServlet_1/simple 요청이 오면
  	2. <servlet-name>simplecontroller</servlet-name>
  	   <servlet-class>com.SimpleController</servlet-class>	설정의 근거로
  	   com.SimpleController.java 컴파일하고 실행 합니다.
  	3. 다음 똑같은 요청 들어오면 실행파일 있으면 실행한다.

서블릿 조건 : 일반 java 파일이 extends HttpServlet을 상속 >> 웹 요청(request), 웹에 대한 응답(response) 객체 사용
-servlet url 요청 바로 할 수 없다. >> 요청 >> mapping >> xml or annotation

1. web.xml (구방식)
2. @WebServlet (현재방식) ex) @WebServlet("/Simple") 매핑



protected void doGet() 함수
ex) http://localhost:8090/WebServlet_1/simple GET방식

protected void doPost() 함수
ex)_ http://localhost:8090/WebServlet_1/simple (form 만들고 method=post 지정)
함수 -> 일반적 : 명시적인 호출에 의해서 동작 

2개의 함수는 어떤 사건이 발생하면 자동 호출 되도록 설계

EX) Javascript 이벤트 시작 시 자동으로 함수 호출 (onload... 사건이 발생하면 핸들러 함수 자동 호출)

doGet(), doPost()
1. request 객체, response 객체를 가지고 데이터 처리 -> 받고, 응답하고 ...

*/
//@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SimpleController() {
		super();
		System.out.println("SimpleController 생성자 함수 실행 : 초기화");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("클라이언트 요청 : GET");
		//JSP 사용했던 방식과 동일
		
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 데이터 받기 (회원가입, 게시판 글쓰기, 로그아웃...)
		String type = request.getParameter("type");
		
		//3. 로직(업무수행) > service 수행
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
			resultobj = "hello world";
		}else if(type.equals("date")) {
			resultobj = new Date();
		}else {
			resultobj = "invalid String type";
		}
		
		//MVC 패턴 흉내 (JSP 있는 시대)
		//4. JSP (view) 데이터 출력 할려면 >> servlet이 가ㅣㅈ고 있는 자원을 >> View 에 전달 (JSP)
		//결과를 저장 : application, session(scpoe), request(scope page 한정) 객체에 저장 가능 (include, forwad)
		//내가 만든 자원이 모든 페이지에서 필요하지 않다면  ... request를 사용 ... 다른 페이지에(forward)
		request.setAttribute("result", resultobj);
		
		//5. 저장한 결과를 JSP 페이지에 전달(UI 구성)
		//현재 : webapp > simpleview.jsp
		//개발 : webapp > WEB-INF > views > board > board.jsp
		
		//getRequestDispatcher >> view 페이지를 지정
		RequestDispatcher dis =  request.getRequestDispatcher("/simpleview.jsp");
		
		dis.forward(request, response);	//현재 내가 가지고 있는 request 객체의 주소값을 forward -> parameter로
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("클라이언트 요청 : POST");		
	}

}
