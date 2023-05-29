package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberDetailService implements Action{

	MemberDao dao = new MemberDao();
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Member m = new Member();
		String id = request.getParameter("id");
		m = dao.SearchById(id);
		request.setAttribute("member", m);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/member/Ex03_MemberDetail.jsp");
		return forward;
	}

}
