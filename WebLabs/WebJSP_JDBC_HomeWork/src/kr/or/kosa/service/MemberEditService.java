package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberEditService implements Action {
	
	MemberDao dao = new MemberDao();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		Member m = new Member();
		m.setId(request.getParameter("id"));
		m.setName(request.getParameter("name"));
		m.setAge(Integer.parseInt(request.getParameter("age")));
		m.setGender(request.getParameter("gender"));
		m.setEmail(request.getParameter("email"));
		
		int resultrow = dao.updateMember(m);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/edit.do");
		return forward;
	}

}
