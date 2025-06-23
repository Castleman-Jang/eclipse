package el.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import person.model.vo.Person;

public class ELServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		
		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		int age = Integer.parseInt(request.getParameter("age"));
		
		Person p = new Person(name, gender, age);
		
		String[] products = request.getParameterValues("product");
		String book = request.getParameter("book");
		String movie = request.getParameter("movie");
		String beverage = request.getParameter("beverage");
		
		request.setAttribute("person", p); //person에 위에 변수로 담은 p를 담겠다
		request.setAttribute("beverage", beverage);
		request.setAttribute("year", 2025);
		request.setAttribute("product", products);
		
		HttpSession session = request.getSession();
		session.setAttribute("book", book);
		
		ServletContext application = request.getServletContext();
		application.setAttribute("movie", movie);
		
		RequestDispatcher view = request.getRequestDispatcher("el/01_2_elEnd.jsp"); // el에 있는 01_2_eelEnd.jsp로 경로를 잡겠다 보내겠다 , RequestDispatcher타입이니까  그리고 그걸 view담고
		view.forward(request, response); // view. forward 로 보냄
		
	}
}
