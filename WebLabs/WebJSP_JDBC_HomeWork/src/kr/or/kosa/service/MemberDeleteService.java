package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;

public class MemberDeleteService implements Action{
	
	MemberDao dao = new MemberDao();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int resultrow = dao.deleteMember(id);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/memberlist.do");
		return forward;
	}

}
