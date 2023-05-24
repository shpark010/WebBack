package kr.or.kosa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.EmpDao;
import kr.or.kosa.dto.Emp;

@WebServlet("/emplist")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String viewpage = "/teamQuiz.jsp";
		List<Emp> emp = new EmpDao().getEmpAllList();
		request.setAttribute("emplist", emp);
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
