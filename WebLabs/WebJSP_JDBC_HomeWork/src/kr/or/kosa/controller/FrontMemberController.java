package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.service.MemberDeleteService;
import kr.or.kosa.service.MemberDetailService;
import kr.or.kosa.service.MemberEditService;
import kr.or.kosa.service.MemberJoinService;
import kr.or.kosa.service.MemberListService;
import kr.or.kosa.service.MemberLoginService;
import kr.or.kosa.service.MemberLogoutService;
import kr.or.kosa.service.MemberSearchByIdService;
import kr.or.kosa.service.MemberSearchByNameService;

/**
 * Servlet implementation class FrontMemberController
 */
@WebServlet("*.do")
public class FrontMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontMemberController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestURI.substring(contextPath.length());
		
		System.out.println(url);

		Action action = null;
		ActionForward forward = null;
		
		if (url.equals("/main.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/Ex02_JDBC_Main.jsp");
		} else if (url.equals("/join.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/join/Ex02_JDBC_JoinForm.jsp");
		} else if (url.equals("/joinok.do")) {
			action = new MemberJoinService();
			forward = action.execute(request, response);
		} else if (url.equals("/login.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/login/Ex02_JDBC_Login.jsp");
		} else if (url.equals("/logout.do")) {
			action = new MemberLogoutService();
			forward = action.execute(request, response);
		} else if (url.equals("/loginok.do")) {
			action = new MemberLoginService();
			forward = action.execute(request, response);
		} else if (url.equals("/memberlist.do")) {
			action = new MemberListService();
			forward = action.execute(request, response);
		} else if(url.equals("/edit.do")) {
			action = new MemberSearchByIdService();
			forward = action.execute(request, response);
		} else if(url.equals("/editok.do")) {
			action = new MemberEditService();
			forward = action.execute(request, response);
		} else if(url.equals("/searchbyname.do")) {
			action = new MemberSearchByNameService();
			forward = action.execute(request, response);
		} else if(url.equals("/detail.do")) {
			action = new MemberDetailService();
			forward = action.execute(request, response);
		} else if(url.equals("/delete.do")) {
			action = new MemberDeleteService();
			forward = action.execute(request, response);
		}
		
		if(forward != null) {
    		if(forward.isRedirect()) { //true 페이지 재 요청 (location.href="페이지"
    			response.sendRedirect(forward.getPath());
    		}else { //기본적으로 forward ....
    			    //1. UI 전달된 경우
    			    //2. UI + 로직
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
