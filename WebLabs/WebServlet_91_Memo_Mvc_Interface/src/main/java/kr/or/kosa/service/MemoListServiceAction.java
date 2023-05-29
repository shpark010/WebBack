package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemoDao;
import kr.or.kosa.dto.Memo;

public class MemoListServiceAction implements Action {

	@Override
	public ActionForward excuete(HttpServletRequest request, HttpServletResponse response) {
		List<Memo> memolist = new ArrayList<>();
		MemoDao dao = new MemoDao();
		memolist = dao.getMemoList();
		request.setAttribute("memolist", memolist);
		//ActionForward 객체를 통해 (viewpage : redirect , forward) 지정, 경로 설정
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false); // forward 방식으로...
    	forward.setPath("memolist.jsp");
		return forward;
	}

}
