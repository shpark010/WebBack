package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;
import kr.or.kosa.service.BoardWriteOkServiceAction;
import kr.or.kosa.service.LoginOkServiceAction;
import kr.or.kosa.service.RegisterOkServiceAction;

/*
Url 방식 (command 방식 상관 없다)
http://192.168.0.166:8090/WebSite/list.do >> *.do 매핑
http://192.168.0.166:8090/WebSite/write.do >> *.do 매핑

Command 방식(parameter로 업무 파악)
@WebServlet("site.do")
http://192.168.0.166:8090/WebSite/site.do?cmd=list
http://192.168.0.166:8090/WebSite/site.do?cmd=write
*/
@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontRegisterController() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//1. 한글처리
    	request.setCharacterEncoding("UTF-8");
    	//2. 데이터 받기
    	//String cmd = request.getParameter("cmd");
    	
    	//Url 방식으로 요청 판단하기
    	//http://192.168.0.166:8090/WebSite/list.do

    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestUri.substring(contextPath.length());
    	
    	System.out.println("requestUri : " + requestUri);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("urlcommand : " + urlcommand);
    	
    	/*
    	requestUri : /WebServlet_9_Member_Service_Interface/register.do
		contextPath : /WebServlet_9_Member_Service_Interface
		urlcommand : /register.do
    	*/
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	//Client 요청 (1. 화면주세요(Service 필요없음) 2. 처리해주세요(별도의 Service 필요)
    	if(urlcommand.equals("/register.do")) {
    		//UI제공 (서비스 객체 필요없음)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/register/register.jsp");
    	}else if(urlcommand.equals("/registerok.do")) {
    		//UI제공 + 서비스 로직 필요
    		action = new RegisterOkServiceAction();
    		forward = action.excuete(request, response);
    	}else if(urlcommand.equals("/login.do")) {
    		//UI제공 (서비스 객체 필요없음)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/login/login.jsp");
    	}else if(urlcommand.equals("/loginok.do")) {
    		//UI제공 + 서비스 로직 필요
    		action = new LoginOkServiceAction();
    		forward = action.excuete(request, response);
    	}else if(urlcommand.equals("/write.do")) {
    		//UI제공 (서비스 객체 필요없음)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/board/boardwrite.jsp");
    	}else if(urlcommand.equals("/boardok.do")) {
    		//UI제공 + 서비스 로직 필요
    		action = new BoardWriteOkServiceAction();
    		forward = action.excuete(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {	//ture location.href="" 새로운 페이지를 받겠다.
    			response.sendRedirect(forward.getPath());
    		}else { //false (forward) >> view 페이지  >> 저장 자원 출력
    			//5. view 지정
    	    	RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    	    	//6. view로 forward
    	    	dis.forward(request, response);
    		}
    	}
    	
    	/*
    	//3. 요청 판단 (판단에 따른 서비스 진행하기)
    	// register 라면 회원가입 주세요
    	// registerok 라면 회원데이터 받아서 DB insert 하세요. 그리고 welcome 페이지 forward
    	// reqeust에 회원 id 하고 환영인사 담아서 view 에서 출력
    	String viewpage = null;
    	if(urlcommand.equals("/register.do")) {
    		viewpage = "/WEB-INF/views/register/register.jsp";
    	}else if(urlcommand.equals("/registerok.do")) {
    		int id = Integer.parseInt(request.getParameter("id"));
        	String pwd = request.getParameter("pwd");
        	String email = request.getParameter("email");
        	RegisterDao dao = new RegisterDao();
        	RegisterDto dto = new RegisterDto();
        	dto.setId(id);
        	dto.setPwd(pwd);
        	dto.setEmail(email);
        	int result = dao.writeOk(dto);
        	String resultdata = "";
        	if(result > 0) {
        		resultdata = id + "님 환영합니다.";
        	} else {
        		resultdata = "데이터 삽입 실패....";
        	}
        	request.setAttribute("resultdata", resultdata);        	
        	viewpage = "/WEB-INF/views/register/register_welcome.jsp";
    	}
    	//4. 데이터 담기
    	//5. view 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	//6. view로 forward
    	dis.forward(request, response);
    	*/
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
