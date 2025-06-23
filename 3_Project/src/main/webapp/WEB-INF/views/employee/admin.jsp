<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{width: 99%; height: 98%;}
	#container{width: 99%; height: 75%; display: flex;}
 	#adminDiv{height: 100%; width: 15%; background: #111; display: inline-block;}
	.adminMenu{
		width: 95%; height: 60px; background: #888; text-align: center; margin: auto; 
		line-height: 60px; font-size: 20px; color: #eee;
	}
	.adminMenu:hover{font-weight: bold; cursor: pointer;}
	
	.menuContent{margin-left: 10px; width: 85%; height: 100%; display:none;}
	
	#enrollDiv{margin: auto; padding: 130px;}
	#enrollDiv td{text-align: right;}
	.enrollInput{height: 30px; width: 200px;}
	.enrollInput.select{width: 208px;}
	#enrollButton{border: 1px solid black; width: 300px; padding: 15px; border-radius: 15px; background: white;}
	#enrollButton:hover{background: black; color: white; cursor: pointer;}

	#adminDiv+div{height: 92%; width: 80%; padding: 30px; overflow: scroll;}
	#adminDiv+div>table{width: 100%; text-align: center;}
	th{border-bottom: 1px solid black;}
	#adminDiv+div>table td{height: 35px;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<jsp:include page="../common/loginbar.jsp"/>

	<hr>
	
	<div id="container">
		<div id="adminDiv">
			<h2 style="margin-left: 5px;">
				<a href="${ contextPath }" style="color: white;">
					JSP&amp;Servlet<br>
					JDBC Project
				</a>
			</h2>
			<div class="adminMenu">사원 전체 보기</div>
			<br>
			<div class="adminMenu">사원 등록 하기</div>
		</div>
		<!-- needs : 사원 리스트 뽑기 -->
		<!-- 사원 리스트를 뽑으려면 : 조회한 결과를 tr로 반복( foreach 사용) 해서 출력 -->
		<!-- AdminViewServlet에서 관리자 계정이면 DB에 가서 사원 정보 추출해오고 admin.jsp로 전달 -->
		
		
		<div class="menuContent">
			<table id="empList">
				<tr>
					<th width="6%">사번</th>
					<th width="10%">이름</th>
					<th width="10%">직업</th>
					<th width="10%">매니저</th>
					<th width="10%">입사일</th>
					<th width="10%">급여</th>
					<th width="10%">커미션</th>
					<th width="10%">부서</th>
					<th width="12%">관리자</th>
					<th width="12%">활동여부</th>
				</tr>
				<c:if test="${ empty empList }">
					<tr>
						<td colspan="10">조회된 리스트가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ !empty empList }">
					<c:forEach items="${ empList }" var="e">
						<tr>
							<td>${ e.empNo }</td>
							<td>${ e.empName }</td>
							<td>${ e.job }</td>
							<td>${ empty e.mgr ? '-' : e.mgr }</td> <!-- e.mgr이 empty비어있냐? 비었으면 -로 안비었으면 e.mgr로 보여줘 -->
							<td>${ e.hireDate }</td>
							<td>${ e.sal }</td>
							<td>${ e.comm }</td>
							<td>${ e.dept }</td>
							<td>${ e.isAdmin }</td>
							<td>${ e.status }</td>
						</tr>
					</c:forEach>
				</c:if>

			</table>
		
		</div>
		<div class="menuContent">
			<form action="${ contextPath }/insertEmp.me" method="post" id="enrollForm" name="enrollFrm">
				<div align="center" id="enrollDiv">
					<table>
						<tr>
							<td><label for="id">사원번호</label></td>
							<td><input type="text" name="id" id="id" class="enrollInput" required autofocus></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td><label for="name">이름</label></td>
							<td><input type="text" name="name" id="name" class="enrollInput" size="25" required></td>
						</tr>
						<tr>
							<td><label for="job">직업</label></td>
							<td><input type="text" name="job" id="job" class="enrollInput" size="25" required></td>
						</tr>
						<tr>
							<td><label for="mgr">매니저</label></td>
							<td>
								<select name="mgr" class="enrollInput select">
									<option>---------------------------------------</option>
									<c:forEach items="${ empList }" var="e">
										<option value="${ e.empNo }">${ e.empName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="sal">급여</label></td>
							<td><input type="number" name="sal" class="enrollInput" id="sal" size="25" value="0"></td>
						</tr>
						<tr>
							<td><label for="comm">커미션</label></td>
							<td><input type="number" name="comm" class="enrollInput" id="comm" size="25" value="0"></td>
						</tr>
						<tr>
							<td><label for="dept">부서</label></td> 
							<td>
								<select name="dept" class="enrollInput select">
									<option>---------------------------------------</option>
									<option value="10">ACCOUNTING</option>
									<option value="30">SALES</option>
									<option value="20">RESEARCH</option>
									<option value="40">OPERATIONS</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label for="isAdmin">관리자 여부</label></td>
							<td>
								<input type="checkbox" name='isAdmin' id="isAdmin" value="Y">
							</td>
						</tr>
					</table>
					<br>
					<button id="enrollButton">사원등록</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		window.onload = () => {
			const adminMenus = document.getElementsByClassName('adminMenu');
			const menuContents = document.getElementsByClassName('menuContent');
			
			let validate = false; //유효성 검사 해주는 거 ?
					
			adminMenus[0].addEventListener('click', () => {
				menuContents[0].style.display = 'block';
				menuContents[1].style.display = 'none';
			});
			adminMenus[1].addEventListener('click', () => {
				menuContents[1].style.display = 'block';
				menuContents[0].style.display = 'none';
			});
			
			document.getElementById('enrollButton').onclick = (e) => {
				const dept = document.getElementsByName('dept')[0];
				if (dept.value.indexOf('-') == 0){
					alert('부서는 필수 선택 항목입니다.');
					e.preventDefault(); // onclick 에 e , 이거 쓰면 form태그 안에 있는 버튼 submit을 막아 주곘다 .
				}
				
				
				if(!validate){
					alert('사원번호를 확인하세요');
					document.getElementById('id').focus();
					e.preventDefault();
				}
			}
			
			const afterEnroll = '${ param.afterEnroll }';
			if(afterEnroll == 'Y'){
				menuContents[0].style.display = 'block';
				menuContents[1].style.display = 'none';
			}
			
			document.getElementById('id').addEventListener('focusout', e => {
				
				//const value = this.value; function(){} 펑션함수 버전
				const value = e.target.value.trim(); // trim을 넣어 공백을 메움
				//console.log(value);
				const targetTd = e.target.parentElement.parentElement.nextElementSibling.children[0];
				
				if(value != ''){ //만약에 value가 비어있지 않다면
					$.ajax({// ajax함수를 불러온거임
						url:'${contextPath}/checkEmpNo.me',
						data:{inputEmpNo:value},
						success: data => {
							console.log(data, typeof data);
							if(data == 0){
								targetTd.innerText = '사용 가능한 사원번호입니다.'
									targetTd.style.color ='green';
									validate = true;																	
							}else{
								targetTd.innerText = '중복된 사원번호입니다.'
									targetTd.style.color ='red';
									validate = false;
							}
							targetTd.style.fontSize= '12px';
						},
						error: (data) =>{
							console.log(data)
						}
					});
				}else{
					targetTd.innerText = '';
				}
			});
			
			
			
		}

	</script>
</body>
</html>