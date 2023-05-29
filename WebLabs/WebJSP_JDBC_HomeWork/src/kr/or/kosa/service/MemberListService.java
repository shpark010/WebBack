package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberListService implements Action {
	
	MemberDao dao = new MemberDao();

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<Member> memberlist = new ArrayList<>();
		memberlist = dao.getMemberList();
		request.setAttribute("memberlist", memberlist);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);		
		forward.setPath("/WEB-INF/views/member/Ex03_Memberlist.jsp");
		return forward;
	}

}
