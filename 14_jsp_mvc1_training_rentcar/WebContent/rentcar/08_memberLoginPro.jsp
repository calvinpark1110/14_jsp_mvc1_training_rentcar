<%@page import="rentcar.dao.RentcarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		boolean isLogin = RentcarDao.getInstance().login(id, pw);
		
		if (isLogin) {
	
			session.setAttribute("id", id);
			response.sendRedirect("01_carMain.jsp");
	
		} 
		else {
		
	%>
			<script type="text/javascript">
				alert("아이디와 비밀번호를 확인하세요.");
				location.href="01_carMain.jsp?center=07_memberLogin.jsp";
			</script>
			
	<%
		}
	%>

</body>
</html>