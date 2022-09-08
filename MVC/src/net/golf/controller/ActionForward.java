package net.golf.controller;

public class ActionForward {

	private boolean isRedirect;//어떻게 이동을 할  것인지를 판단하는 분기 변수
	private String path;//이동할 매핑주소 또는 뷰페이지 경로
	
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
