package com.kosa;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/action.do")
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontServletController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		String viewpage = null;
		if(cmd.equals("greeting")) {
			Message msg = new Message();
			msg.getMessage(cmd);
			request.setAttribute("msg", msg);
			String str = msg.getMessage(cmd);
			request.setAttribute("str", str);
			viewpage = "/greeting.jsp";
		}else {
			viewpage = "/error/error.jsp";
		}
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
