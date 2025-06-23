<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.io.File"
    errorPage="error/errorPage.jsp"
    %>
    <!-- 지금 파일은 자바 파일이 아니기 때문에 ArrayList같은 건 직접 import작성해야 한다. 페이지인코딩 뒤에 , 로 여러개 할 수도 있지만 다른 방법도 있다-->
    <!-- 에러가 나면 어떤 화면을 보여줄지? 어떤 page를 보여줄지 설정해줬다.  -->
    <!--  아래처럼 따로 작성해줌. -->
<%@ page import="java.sql.Connection" %>
<%--
	page 지시어 : JSP페이지를 처리하는데 필요한 각종 속성을 기술하는 부분
		language	: 사용할 스크립트 언어
		contentType	: 웹 브라우저가 받아볼 페이지 인코딩 방식
		pageEncoding: JSP파일에 쓰이는 소스코드 자체 인코딩 방식
		import		: java 에서의 import 랑 같음
		errorPage	: 현재 페이지에서 오류가 났을 때 호출할 페이지 지정
		isErrorPage	: 오류 처리 파일로 사용할 때 이용, true 로 설정하면 exception 객체 사용 가능
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HTML 주석 -->
	<%--JSP주석 --%>

	<%
		int total = 0;
		for(int i = 1; i <=10; i++){
	%>
			<h1>하이하이</h1>
	<%
			total += i;
		}
		
		ArrayList<String> list = new ArrayList<String>();
		File f = null;
		Connection conn = null;
		list.add(null);
		list.get(0).charAt(0);
		
		
		
	%>
	<!-- 중간에 <h1>하이하이</h1>을 넣기 위해 자바코드들만 감싸줬다. -->
	
	
	expression 출력 : 1부터 10까지의 합은 <%= total %>입니다.<br/>
	scriptlet 출력 : 1부터 10까지의 합은 <% out.println(total); %>입니다.<br/> <!-- 자바코드를 사용하기 -->
	
	
	
</body>
</html>