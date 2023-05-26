package kr.or.kosa.action;

/*
servlet (client) 요청

1. 화면을 주세요
2. 처리해 주세요

*/
public class ActionForward {
	private boolean isRedirect = false;	//view의 전환 (redirect or forward)
	private String path = null; //이동경로 (뷰의 주소)
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
