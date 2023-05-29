package kr.or.kosa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서비스 클래스의 모든 함수는 동일한 리턴타입과 parameter를 가지고 사용되었으면 좋겠다...
public interface Action {
	public ActionForward excuete(HttpServletRequest request, HttpServletResponse response);
}
