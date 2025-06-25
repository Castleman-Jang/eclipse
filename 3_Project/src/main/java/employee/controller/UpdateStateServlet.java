package employee.controller;

import java.io.IOException;

import employee.model.service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateStateServlet
 */
@WebServlet("/updateState.me")
public class UpdateStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("empNo"));
		String col = request.getParameter("column");
		String value = request.getParameter("value");
//
//		System.out.println(id);
//		System.out.println(col);
//		System.out.println(value);
		EmployeeService eService = new EmployeeService();
		int result = eService.updateState(id, col, value); // 받아온 id,col,value를 물려서 Service로 보낸다 
		//서비스, DAO에서 리턴받아온걸 result 에 담는다. 이제 그거 가지고 if문 작성
		
		//view에서 전달 받은 값으로 화면 변경해주기
		response.getWriter().print(result == 1 ? "success" : "fail"); //넘어온 result가 1이면 success출력, 1이 아니면 fail출력 println조심 줄바꿈까지 감
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
