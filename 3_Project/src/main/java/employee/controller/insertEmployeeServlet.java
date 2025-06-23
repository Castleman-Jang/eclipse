package employee.controller;

import java.io.IOException;

import employee.model.service.EmployeeService;
import employee.model.vo.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insertEmployeeServlet
 */
@WebServlet("/insertEmp.me")
public class insertEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8"); //인코딩, 글 깨지는거 ? 방지 ? 톰캣 버전에 따라 다름
		
		int id = Integer.parseInt(request.getParameter("id")); //id라는 이름의 파라미터를 가져와서 integer.parseIntfh int로 바꾸고 id에 담기 
		String name = request.getParameter("name");
		String job = request.getParameter("job");
		Integer mgr = request.getParameter("mgr").indexOf("-") == 0 ? null : Integer.parseInt(request.getParameter("mgr")); // 받아온 값이 -면 Integer에 null을 넘기고, 아니면 해당 사번의 숫자를 넘기겠다. 
		//int 로 안하는 이유, int는 null을 가질 수 없어서 . 
//		0으로 헀을때 나중에 사번이 0인 사람이 왔을때
// 		매니저가 null인 사람이 있는데, 그 null을 int가 받을 수 없어서 Integer
		int sal = Integer.parseInt(request.getParameter("sal"));
		int comm = Integer.parseInt(request.getParameter("comm"));
		int deptNo = Integer.parseInt(request.getParameter("dept"));
		String isAdmin = request.getParameter("isAdmin") == null ? "N" : "Y";
		
		Employee e = new Employee(id, null, name, job, mgr, null, null, sal, comm, deptNo, null, isAdmin, null);
		
		int result = new EmployeeService().insertEmployee(e);
		if(result > 0) {
		response.sendRedirect(request.getContextPath() + "/admin.me?afterEnroll=Y");
//															쿼리스트링? 						
			
		} else {
			request.setAttribute("msg", "사원 등록 실패했습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.JSP").forward(request, response);
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
