package net.golf.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {

	public abstract ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	//추상메서드는 {}가 없고,실행문장이 없음.호출이 불가능, public abstract은 생략가능함.
}
