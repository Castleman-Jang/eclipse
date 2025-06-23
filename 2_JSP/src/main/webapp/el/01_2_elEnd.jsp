<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="person.model.vo.Person"%>
<%-- 
<%
	Person p = (Person)request.getAttribute("person");
	String beverage = (String)request.getAttribute("beverage");
	int year = (int)request.getAttribute("year");
	String[] products = (String[])request.getAttribute("products");
//	String book = (String)request.getAttribute("book");
//	String movie = (String)request.getAttribute("movie");
	String book = (String)session.getAttribute("book");
	String movie = (String)application.getAttribute("movie"); 
	
%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<h2>scriptlet을 통해 request객체에 저장된 데이터 출력해보기</h2>
		<h4>개인정보(<%= year %>)</h4>
		이름 : <%= p.getName() %>
		성별 : <%= p.getGender() %>
		나이 : <%= p.getAge() %>
		<h4>취향정보</h4>
		가장 좋아하는 음료 : <%= beverage %> <br/>
		가장 좋아하는 물건 : <%= products[0] %>, <%= products[1] %>, <%= products[2] %> <br/>
		가장 좋아하는 도서 : <%= book %> <br/>
		가장 좋아하는 영화 : <%= movie %> <br/> --%>

		<hr/>
		<h2>el의 내장객체 XXXScope를 통해 저장된 데이터 출력하기</h2>
		<h4>개인 정보(${ requestScope.year })</h4>
		이름 : ${ requestScope.person.name } <br/> <!-- ~~~Scope에서 배열에서 가져올때는 get을 빼도 됨 -->
		성별 : ${ requestScope.person.gender }<br/>
		나이 : ${ requestScope.person.age }
		<h4>취향 정보</h4>
		가장 좋아하는 음료 : ${ requestScope.beverage } <br/>
		가장 좋아하는 물건 : ${ requestScope.product[0] },${ requestScope.product[1] },${ requestScope.product[2] }<br/>
		가장 좋아하는 도서 : ${ sessionScope.book }<br/>
		가장 좋아하는 영화 : ${ applicationScope.movie }
		
		<hr/>
		
		<h2>scope 생략하여 저장된 데이터 출력하기</h2>
		<p>
			el 내장 객체 pageScope, requestScope, sessionScope, applicationScope는 생략 가능 <br/>
			el은 scope가 생략되면 pageScope -> requestScope -> sessionScope -> applicationScope순으로 찾음<br/>
			여러 scope에 동일한 속성을 기록하고 이름 충돌이 발생하면 명시적으로 scope를 지정해야 함 
		</p>
			<h4>개인 정보(${ requestScope.year })</h4>
		이름 : ${ person.name } <br/> <!-- ~~~Scope에서 배열에서 가져올때는 get을 빼도 됨 -->
		성별 : ${ person.gender }<br/>
		나이 : ${ person.age }
		<h4>취향 정보</h4>
		가장 좋아하는 음료 : ${ beverage } <br/>
		가장 좋아하는 물건 : ${ product[0] },${ product[1] },${ product[2] }<br/>
		가장 좋아하는 도서 : ${ book }<br/>
		가장 좋아하는 영화 : ${ movie }
		
		
		<hr/>
		<hr/>
		
		<h2>주문 내역</h2>
		상품 명 : ${ param.name }<br/>
		수량 : ${ param.count }<br/>
		옵션1 : ${ paramValues.option[0] } <br/>
		옵션2 : ${ paramValues.option[1] }
</body>
</html>