package employee.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import employee.model.vo.Employee;

public class EmployeeDAO {

	public Employee login(Connection conn, Employee e) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Employee login = null;
			
		
		String query = "SELECT * FROM v_selectemp where empno = ? and pwd = ? and status = 'Y'";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, e.getEmpNo());
			pstmt.setString(2, e.getPwd());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				login = new Employee(rset.getInt("empno"),
									 rset.getString("pwd"),
									 rset.getString("ename"),
									 rset.getString("job"),
									 rset.getInt("mgr_no"),
									 rset.getString("mgr"),
									 rset.getDate("hiredate"),
									 rset.getInt("sal"),
									 rset.getInt("comm"),
									 rset.getInt("deptno"),
									 rset.getString("dname"),
									 rset.getString("is_admin"),
									 rset.getString("status"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return login;
	}

	public ArrayList<Employee> selectAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Employee> list = new ArrayList<Employee>();
		
		String query = "select * from v_selectemp"; 
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
				list.add(new Employee(rset.getInt("empno"),
										 rset.getString("pwd"),
										 rset.getString("ename"),
										 rset.getString("job"),
										 rset.getInt("mgr_no"),
										 rset.getString("mgr"),
										 rset.getDate("hiredate"),
										 rset.getInt("sal"),
										 rset.getInt("comm"),
										 rset.getInt("deptno"),
										 rset.getString("dname"),
										 rset.getString("is_admin"),
										 rset.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
				
	}

	public int insertEmployee(Connection conn, Employee e) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
//내가써본거..		String query = "insert into emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, IS_ADMIN, STATUS) values ( ?,?,?,?,?,?,?,?,?,?)";
		// mgr 이 null (mgr 없을 때 ) 위치홀더 7개
//		String query = "insert into emp values ( ?,?,?,null,sysdate,?,?,?,default,?,default)";
		
		//mgr 값이 있을 때 : 위치홀더 8
//		String query = "insert into emp values ( ?,?,?,?,sysdate,?,?,?,default,?,default)";
		
		String query = "insert into emp values(?, ?, ?, "+ e.getMgrNo() + ",sysdate, ?, ?, ?, default, ?, default)";
	
		try {
			pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, e.getEmpNo());
				pstmt.setString(2, e.getEmpName());
				pstmt.setString(3, e.getJob());
				pstmt.setInt(4, e.getSal());
				pstmt.setInt(5, e.getComm());
				pstmt.setInt(6, e.getDeptNo());
				pstmt.setString(7, e.getIsAdmin());

							
			result = pstmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}

	public int updateEmployee(Connection conn, Employee e) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query= "update emp set pwd=? name=? job=? sal=? comm=? deptNo=? where empNo=?";
		try {
			pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, e.getPwd());
				pstmt.setString(2, e.getEmpName());
				pstmt.setString(3, e.getJob());
				pstmt.setInt(4, e.getSal());
				pstmt.setInt(5, e.getComm());
				pstmt.setInt(6, e.getDeptNo());
				pstmt.setInt(7, e.getEmpNo());
				
				result = pstmt.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int checkEmpNo(Connection conn, int empNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) from emp where empno=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, empNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return result;
	}



	


}
