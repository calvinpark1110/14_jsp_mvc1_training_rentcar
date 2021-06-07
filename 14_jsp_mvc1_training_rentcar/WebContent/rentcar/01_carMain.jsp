<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<div align="center">
		<%
			String center = request.getParameter("center");
		
		
			if(center == null) {
				center = "04_center.jsp";	//default center값
			}
		%>
		
		<table>
		
			<tr height="120" align="center">
				<td align="center" width="1000">
					<jsp:include page="02_top.jsp"></jsp:include>
				</td>
			</tr>
			
		
			<tr align="center">
				<td align="center" width="1000">
					<jsp:include page="<%=center%>" />
				</td>
			</tr>
			
		
			<tr align="center" height="100">
				<td align="center" width="10000">
					<jsp:include page="03_bottom.jsp"></jsp:include>
				</td>
			</tr>
		</table>
		
	</div>

</body>
</html>