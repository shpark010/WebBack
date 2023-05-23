package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "게시판 front 컨트롤러 입니다.", urlPatterns = { "/Board" })
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontBoardController() {
		super();

	}

	// 요청(동기식) >> doGet, doPost 실행 >> 로직 동일 >> private void doProcess 만들어서 호출 (둘다)
	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method)
			throws ServletException, IOException {
		// GET 요청이나, POST 요청 둘 다 doProcess 처리
		System.out.println("클라이언트 요청 방식 : " + method);

		// 1. 한글처리

		// 2. 요청받기 (request)

		// 3. 요청판단 (기준 : 1.parameter 사용 = cmd=value >> cmd 값에 따라 판단 >> command 방식
		// ex) http:192.168.0.166:8090/Web/Board?cmd=write&id=park&content=방가방가 -> 글쓰기
		// ex) http:192.168.0.166:8090/Web/Board?cmd=list -> 목록보기 (약속)
		// 2.URL 주소 사용

		// 4. 결과저장(application(전역), session(특정사용자), request(페이지 한정))

		// 5. View 지정

		// 6. View에 전달 (결과:session, request) >> Forward 방식으로 >> 클라이언트 주소 변하지 않고 내용 보내기
		// 가능

		request.setCharacterEncoding("UTF-8");

		String cmd = request.getParameter("cmd");

		String viewpage = null;
		// cmd > null -> error.jsp
		// cmd > boardlist -> list.jsp
		// cmd > boardwrite -> write.jsp
		if (cmd == null) {
			viewpage = "/error/error.jsp";
		} else if (cmd.equals("boardlist")) {
			/*
			DB연결 > select > 객체담기
			boardDao dao = new boardDao();
			List<Board> boardlist = dao.selectBoardList();
			request.setAttribute("list",boardlist);
			forward > view > jsp > request.getAttribute("list");
			*/
			viewpage = "/board/boardlist.jsp";
		} else if (cmd.equals("boardwrite")) {
			viewpage = "/board/boardwrite.jsp";
		} else if (cmd.equals("boarddelete")) {
			viewpage = "/board/boarddelete.jsp";
		} else if (cmd.equals("login")) {
			viewpage = "/WEB-INF/views/login/login.jsp";
		}else {
			viewpage = "/error/error.jsp";			
		}
		
		//결과 저장
		//결과를 저장했다고 하고
		//request.set..
		
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "POST");

	}

}
