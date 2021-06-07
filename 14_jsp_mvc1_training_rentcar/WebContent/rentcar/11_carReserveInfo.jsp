<%@page import="rentcar.dao.RentcarDao"%>
<%@page import="rentcar.model.RentcarBean"%>
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
		int no = Integer.parseInt(request.getParameter("no"));
		
		//DB에 연결하여, 한대의 차량 정보를 호출
		RentcarBean bean = RentcarDao.getInstance().getOneCar(no);
		
		int category = bean.getCategory();
		String temp = "";
		
		if      (category == 1)  temp = "소형";
		else if (category == 2)  temp = "중형"; 
		else if (category == 3)  temp = "대형"; 
	%>
	
	<div align="center">
		<form action="01_carMain.jsp?center=12_carOptionSelect.jsp" method="post">
			<table>
				<tr height="100">
					<td align="center" colspan="3">
						<font size="6" color="gray"><%=bean.getName()%> 차량 선택</font>
					</td>
				</tr>
				<tr align="center">
					<td rowspan="6" width="500">
						<img alt="차량이미지" src="imgCar/<%=bean.getImg()%>" width="450">
					</td>
					<td width="250">차량이름</td>
					<td width="250"><%=bean.getName()%></td>
				</tr>
				<tr align="center">
					<td width="250">차량수량</td>
					<td width="250">
						<select name="qty">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</td>
				</tr>
				<tr align="center">
					<td width="250">차량분류</td>
					<td width="250"><%=temp%></td>
				</tr>
				<tr align="center">
					<td width="250">대여가격</td>
					<td width="250"><%=bean.getPrice()%>원</td>
				</tr>
				
				<tr align="center">
					<td width="250">제조회사</td>
					<td width="250"><%=bean.getCompany()%></td>
				</tr>
				<tr align="center">
					<td width="250">
						<input type="hidden" name="no" value="<%=bean.getNo()%>">
						<input type="hidden" name="img" value="<%=bean.getImg()%>">
						<input type="submit" value="옵션선택후 구매하기">
					</td>
				</tr>
			</table>
			<br><br><br>
			<font size="5" color="gray">차량 정보 보기</font>
			<p><%=bean.getInfo()%></p>
		</form>
	</div>
</body>
</html>