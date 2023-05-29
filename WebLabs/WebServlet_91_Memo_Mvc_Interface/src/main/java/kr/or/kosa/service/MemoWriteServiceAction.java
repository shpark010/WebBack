package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemoDao;
import kr.or.kosa.dto.Memo;

public class MemoWriteServiceAction implements Action {

	@Override
	public ActionForward excuete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String memo = request.getParameter("memo");
		Memo m = new Memo();
		m.setId(id);
		m.setEmail(email);
		m.setMemo(memo);
		MemoDao dao = new MemoDao();
		int result = dao.insertMemo(m);
		request.setAttribute("reslut", result);
		//ActionForward 객체를 통해 (viewpage : redirect , forward) 지정, 경로 설정
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false); // forward 방식으로...
    	forward.setPath("/memolist.do");
		return forward;
	}

}
