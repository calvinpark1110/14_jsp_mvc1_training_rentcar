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
		request.setCharacterEncoding("utf-8");
	%>
		<jsp:useBean id="bean" class="rentcar.model.MemberBean">
			<jsp:setProperty name="bean" property="*" />
		</jsp:useBean>
	<% 
		boolean isJoinMember = RentcarDao.getInstance().joinMember(bean);
	
		if (isJoinMember) {
	%>
			<script>
				alert("회원가입 되었습니다.");
				location.href="01_carMain.jsp";
			</script>
	%>
	<% 
		} 
		else {
	%>
			<script>
				alert("중복된 아이디 입니다.");
				history.go(-1);
			</script>
	<% 
		}
	%>

</body>
</html>