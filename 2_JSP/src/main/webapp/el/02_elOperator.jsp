<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="person.model.vo.Person, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str1 = "안녕";
		String str2 = new String("안녕");
		
		int big = 10;
		int small = 3;
		Person p1 = new Person("강건강", '남', 20);
		Person p2 = new Person("강건강", '남', 20);
		
		ArrayList<String> list1 = new ArrayList<String>();
		list1.add(str1);
		ArrayList<String> list2 = new ArrayList<String>();
		ArrayList<String> list3 = null;
		
		pageContext.setAttribute("str1", str1);
		pageContext.setAttribute("str2", str2);
		pageContext.setAttribute("big", big);
		pageContext.setAttribute("small", small);
		pageContext.setAttribute("p1", p1);
		pageContext.setAttribute("p2", p2);
		pageContext.setAttribute("list1", list1);
		pageContext.setAttribute("list2", list2);
		pageContext.setAttribute("list3", list3);
	%>
	
	${ 10*7 }<br/>
	${ 100/4 } = ${ 100 div 4 }<br/>
	${ 25%3 } = ${25 mod 3 } <br/>
	
	<br/>
	
	<%= str1 == str2 %><br/>
	${str1 == str2 } = ${ str1 eq str2 } = ${ str1.equals(str2) }<br/>
	${str1 != str2 } = ${str1 ne str2  } = ${!str1.equals(str2) }<br/>
	
	<br/>
	
	${big>small } = ${ big gt small }
	${big<small } = ${ big lt small }
	
	<br/>
	
	<%= p1 == p2 %> <br/>
	${p1==p2 }<br/>
	
	<br/>
	
	${ list1 == null } / ${ empty list1 } <br/>
	${ list2 == null } / ${ empty list2 }<br/>
	${ list3 == null } / ${ empty list3 }<br/>
	
	<br/>
	
	${ true && true } = ${ true and true } <br/>
	${ false || false } = ${ false or false }<br/>
	${ !false  } = ${ not false }<br/>
</body>
</html>