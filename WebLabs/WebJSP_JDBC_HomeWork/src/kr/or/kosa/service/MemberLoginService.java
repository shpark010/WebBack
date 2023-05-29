package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberLoginService implements Action {

	MemberDao dao = new MemberDao();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		Member m = dao.login(id, pwd);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		// ID 존재
		if (pwd.equals(m.getPwd())) {
			// ID 존재 , PWD(o)
			HttpSession session = request.getSession();
			session.setAttribute("userid", m.getId());
			forward.setPath("/main.do");;
		} else {
			// ID 존재 , PWD(x)
			forward.setPath("/login.do");;
		}
		return forward;
	}

}
