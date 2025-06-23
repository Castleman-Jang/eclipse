package employee.controller;

import java.io.IOException;

import employee.model.service.EmployeeService;
import employee.model.vo.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		
		Employee e = new Employee();
		e.setEmpNo(id);
		e.setPwd(pwd);
		
		EmployeeService eService = new EmployeeService();
		//로그인 할 땐 객체 반환해야함. boolean이나 count 등은 회원에 대한 정보를 알 수 없기 때문에 가져올 수 없음 ..?이해는 못 한듯.....select *
		Employee login = eService.login(e);
		
//		System.out.println(login);
		
		
		/*
		 						forward				vs				sendRedirect
		 									view로 이동해주는 메소드
		 				request, response 유지					request, response 새로 생성
		 				ㄴ 담은 데이터 유지							ㄴ담은 데이터 유지 안됨
		 				ㄴ 전달해야하는 데이터가 있을 때 					ㄴ전달할 데이터가 없을 때
		 				
		 				요청했었던 url유지							새롭게 지정한 url로 변경
		  */
		if(login != null) {
			//로그인 정보 있을 때 
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", login);
			session.setMaxInactiveInterval(600); //10분
//			request.getRequestDispatcher("index.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath());
		}else {
			//로그인 정보 없을 때ㅂ
			request.setAttribute("msg", "로그인을 실패했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
