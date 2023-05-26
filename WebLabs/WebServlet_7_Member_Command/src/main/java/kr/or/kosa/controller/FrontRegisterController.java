package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;

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
    	RegisterDao dao = new RegisterDao();
    	
    	//1. 한글처리
    	request.setCharacterEncoding("UTF-8");
    	//2. 데이터 받기
    	String cmd = request.getParameter("cmd");
    	String viewpage = null;
    	//3. 요청 판단 (판단에 따른 서비스 진행하기)
    	// register 라면 회원가입 주세요
    	// registerok 라면 회원데이터 받아서 DB insert 하세요. 그리고 welcome 페이지 forward
    	// reqeust에 회원 id 하고 환영인사 담아서 view 에서 출력
    	if(cmd.equals("register")) {
    		viewpage = "/WEB-INF/views/register/register.jsp";
    	}else if(cmd.equals("registerok")) {
    		int id = Integer.parseInt(request.getParameter("id"));
        	String pwd = request.getParameter("pwd");
        	String email = request.getParameter("email");
        	RegisterDto dto = new RegisterDto();
        	dto.setId(id);
        	dto.setPwd(pwd);
        	dto.setEmail(email);
        	int result = dao.writeOk(dto);
        	if(result > 0) {
        		request.setAttribute("id", id);
        		viewpage = "/WEB-INF/views/register/register_welcome.jsp";
        	}
        	
    	}
    	//4. 데이터 담기
    	//5. view 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	//6. view로 forward
    	dis.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
