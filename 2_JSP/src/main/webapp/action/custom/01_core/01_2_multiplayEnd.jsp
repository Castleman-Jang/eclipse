<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>set 태그</h2>
	<!-- 변수 선언 scope 생략이 되면 기본은 page 오늘 뭔소린지 무슨수업인지 1도 모르겠네 진짜루 ~  -->
	<c:set var="no1" value="${ param.num1 }"/>
	<c:set var="no2" value="${ param.num2 }"/>
	<c:set var="result" value="${ no1 * no2 }"/>
	
	<p>${no1 }곱하기 ${ no2 } 값은 ${result }입니다.</p> 
	
	<hr/>
	
	<h2>c:remove 태그</h2>
	<<p> 지정한 변수를 모든 scope에서 검색해 삭제하거나 지정한 scope에서만 삭제</p>
	<c+set var="result" value="9999" scope="request"/>
	삭ㅔ 전 result : ${ result } <br/> <!-- 30 -->
	삭제 전 requestScope.result : ${ requestScope.result } <br/>
	
	<br/>
	
	<c:remove var="result" scope="request"/>
	삭제 후 result : ${result }<br/>
	삭제 후 requestScope.result : ${ requestScope.result } <br/>
	
	
	
	
	
	
	
	
	${ param.num1 } / ${ param.num2 }
</body>
</html>