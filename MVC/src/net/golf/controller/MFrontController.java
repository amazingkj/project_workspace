package net.golf.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MFrontController extends HttpServlet {
	
	/* 서블릿 자바 특징)
	 *  1.서블릿은 HttpSerlvet로 부터 상속받는다. 
	 *  2.서블릿은 온라인 웹상에서 누구나 다 접근 가능하게 public으로 선언한다.
	 *  3.get or post 양쪽방식 모두 다 접근가능하게 service()메서드를 오버라이딩 해서 호출한다.
	 *  4.HttpServletRequest  서블릿은 사용자 폼에서 입력한 정보를 서버로 가져오는 역할을 한다.
	 *  5.HttpServletResponse 서블릿은 서버의 가공된 정보를 사용자 웹에 응답할 때 사용한다.
	 */
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();// /MVC/*.do 경로를 구함.
		String contextPath=request.getContextPath(); //컨텍스트 패스 경로를 구함. /MVC
		String command=RequestURI.substring(contextPath.length()); // /MVC 컨텍스트 패스 경로 이후
		//URL 매핑주소인 *.do를 구함
		
		ActionForward forward=null;
		Action action=null;
		
		Properties prop=new Properties(); //컬렉션 클래스로 키,값 쌍으로 저장하는 자료구조
		FileInputStream fis=new FileInputStream(
				request.getRealPath("WEB-INF/classes/golf.properties"));
		/* 생성자 인자값으로  WEB-INF/classes경로는 톰캣에 의해서 실제 변경된 톰캣 실제 프로젝트 경로이다.바로 이 경로를 톰캣에서
		 * 인식하여 브라우저에 나오게 된다.이클립스에서 보이는 가상 프로젝트 경로를 WAS 서버가 인식하는 것은 아니다.
		 * 실제 톰캣프로젝트 경로는 C:\20220607\Web_work\.metadata\.plugins\org.eclipse.wst.server.core\
		 * tmp0\wtpwebapps\MVC\   (WEB-INF\classes)
		 * 이클립스 가상경로에서는 WEB-INF/classes경로가 없다.WEB-INF/classes에 해당하는 이클립스 다이나믹 웹프로젝트 경로
		 * 는 build/classes가 된다.결국 daum.properties이 들어가는 이클립스 경로는 src가 된다.
		 * getRealPath()메서드를 사용해서 실제 톰캣 프로젝트 경로를 구함.
		 */
		prop.load(fis);//프로퍼티 파일 로드
		fis.close();//입력스트림을 닫는다.
		
		System.out.println(command);//매핑주소를 이클립스 콘솔모드에서 출력
		
		String value=prop.getProperty(command);//키이름 매핑주소에 해당하는 값을 구함.
		
		System.out.println(value);//키이름에 대한 값을 출력
		
		if(value.substring(0,7).equals("execute")) {//0이상 7미만 사이의 문자가 execute와 같다면
			try {
			  StringTokenizer st=new StringTokenizer(value,"|");//|를 기준으로 문자를 분리	
			  String url_1=st.nextToken();//분리된 토큰 문자열을 execute를 구함.
			  String url_2=st.nextToken();//|이후 풀패키지 경로를 구함.=>net.golf.controller.컨트롤러클래스명
			  Class url=Class.forName(url_2);
			  
			  action=(Action)url.newInstance();
			  
			  try {
				  forward=action.execute(request, response);//컨트롤러에 오버라이딩 된 execute()메서드를
				  //호출해서 ActionForward를 생성
			  }catch(Exception e) {
				  e.printStackTrace();
			  }
			}catch(ClassNotFoundException ce) {//해당 클래스 파일을 못찾는 경우
				ce.printStackTrace();
			}catch(InstantiationException ex) {//추상클래스 나 인터페이스를 인스턴스 즉 객체화 하고자 할때
				ex.printStackTrace();
			}catch(IllegalAccessException ex) {//클래스 접근을 못할 때
				ex.printStackTrace();
			}
		}//if
		
		if(forward != null) {
			if(forward.isRedirect()) { //==true가 생략됨
				response.sendRedirect(forward.getPath());//새로운 매핑주소로 이동하기 때문에 request.setAttri
				//bute(속성키이름,값)로 저장된 값을 잃어 버린다. 하지만 로그인 인증시 사용되는 세션키이름값은 유지한다.
			}else {
				RequestDispatcher dis=request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);//포워드로 이동하면 기존 매핑주소값을 유지하고,request or sessi
				//on객체에 의해서 저장된 키이름, 값도 각각 유지한다.
			}
		}//if
	}
}















