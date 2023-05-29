package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;

public class MemberLogoutService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/login.do");
		return forward;
	}

}
