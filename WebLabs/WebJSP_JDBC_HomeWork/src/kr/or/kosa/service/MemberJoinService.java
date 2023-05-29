package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

public class MemberJoinService implements Action {

	MemberDao dao = new MemberDao();
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Member m = new Member();
		m.setId(request.getParameter("id"));
		m.setPwd(request.getParameter("pwd"));
		m.setName(request.getParameter("mname"));
		m.setAge(Integer.parseInt(request.getParameter("age")));
		m.setGender(request.getParameter("gender"));
		m.setEmail(request.getParameter("email"));
		m.setIp(request.getRemoteAddr());
		
		int resultrow = dao.insertMember(m);
		
		ActionForward forward = new ActionForward();
	  	forward.setRedirect(false);
	  	if(resultrow > 0) {
	  		forward.setPath("/login.do");	  		
	  	}else {
	  		forward.setPath("/join.do");	  			  		
	  	}
		return forward;
	}

}
