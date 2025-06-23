package com.kh.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet3 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); //post방식일때는 한글 데이터가 깨질 수 있으니 인코딩 처리 해줘야함 . (톰캣 버전이 높으면 생략가능)
		
		String name = request.getParameter("name"); //name이라는 이름의 파라미터를 받아올것이다. 반환타입은 String임 . name 이 name인걸 받아와서 name이란 변수에 초기화 ?
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String city = request.getParameter("city");
		String height = request.getParameter("height");
		String[] food = request.getParameterValues("food"); //food 여러개 골랐는데 하나만 나옴, getParameterValues로 바꿔봄.그리고 반환타입을 맞춰줬음 배열로  
		
		String recommendation = null;
		switch(age) {
		case "10대 미만": recommendation = "사탕"; break;
		case "10대": recommendation = "문화상품권"; break;
		case "20대": recommendation = "향수"; break;
		case "30대": recommendation = "지갑"; break;
		case "40대": recommendation = "양주"; break;
		case "50대": recommendation = "임영웅 콘서트 티켓"; break;
		}
		
	/*	System.out.println(name);
		System.out.println(gender);
		System.out.println(age);
		System.out.println(city);
		System.out.println(height);
		System.out.println(Arrays.toString(food));
	*/
		
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("city", city);
		request.setAttribute("height", height);
		request.setAttribute("foods", String.join("," , food));  //배열 food에 있는걸 , 이어붙인걸 foods에  ??
		request.setAttribute("recomm", recommendation);  
		// 보낼거 //
		
		RequestDispatcher view = request.getRequestDispatcher("servlet/testServlet3End.jsp"); //경로 지정, 이 쪽으로 보낼거야 
		view.forward(request, response); //포워딩 작업. 전달하는거임 
	}

}
