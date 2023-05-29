package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberSearchByNameService implements Action {
	
	MemberDao dao = new MemberDao();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<Member> memberlist = new ArrayList<>();
		String name = request.getParameter("search");
		memberlist = dao.searchByName(name);
		request.setAttribute("memberlist", memberlist);
		request.setAttribute("name", name);
		request.setAttribute("resultrow", memberlist.size());
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/member/Ex03_MemberSearch.jsp");
		return forward;
	}

}
