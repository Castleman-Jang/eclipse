<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="str" value="How are you?"/>
	<h1>${ str }</h1>
	
	${ fn:toUpperCase(str) }<br/>
	${ fn:toLowerCase(str) }<br/>
	${ fn:indexOf(str, 'are')}<br/>
	${ fn:replace(str, 'are', "were") } / ${ str }<br/>
	${ fn:length(str) }<br/>
	
	
	
	
</body>
</html>