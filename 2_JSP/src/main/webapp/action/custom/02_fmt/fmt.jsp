<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:formatNumber value="123456789"/><br/> <!-- 알아서 천 단위씩 구분기호가 생김. -->
	<fmt:formatNumber value="123456789" groupingUsed="false"/><br/>
	<fmt:formatNumber value="1.23456789" /><br/> <!-- 소수점 넷 째 자리에서 반올림되서 1.235 로 나옴, 소수점 세자리까지 표시됨 -->
	<fmt:formatNumber value="1.23456789" pattern="#.##" /><br/> <!-- #.## 까지 나오곰 반올림됨 -->
	<fmt:formatNumber value="1.2" pattern="#.##" /><br/> <!-- 없는 자리는 비워두고 -->
	<fmt:formatNumber value="1.2" pattern="#.00" /><br/> <!-- 없는 자리는 0으로 채움 -->
	<fmt:formatNumber value="0.12" type="percent" /><br/> <!-- 0.12를 12%로 표기함 -->
	<fmt:formatNumber value="123456789" type="currency" /><br/> <!-- 숫자 앞에 원화 표시  -->
	<fmt:formatNumber value="123456789" type="currency" currencySymbol="$" /><br/> <!-- 원화표시 말고 지정된 기호 표시 -->
</body>
</html>