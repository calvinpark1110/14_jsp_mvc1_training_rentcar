<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="06_memberJoinPro.jsp" method="post">
		<table border="1">
			<tr height="100">
				<td align="center" colspan="2">
					<font size="6" color="gray">회원가입</font>
				</td>
			</tr>
			<tr height="40">
				<td width="120" align="center">아이디</td>
				<td width="180"><input type="text" name="id" size="30"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">비밀번호</td>
				<td width="180"><input type="password" name="pw" size="30"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">이메일</td>
				<td width="180"><input type="email" name="email" size="30"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">관련취미</td>
				<td width="180"><input type="text" name="hobby" size="30"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">직업</td>
				<td width="180"><input type="text" name="job" size="30"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">나이</td>
				<td width="180"><input type="text" name="age" size="30"></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">전달사항</td>
				<td width="180"><textarea rows="15" cols="30" name="info"></textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>