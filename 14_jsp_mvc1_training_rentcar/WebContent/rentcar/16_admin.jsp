<%@page import="rentcar.dao.RentcarDao"%>
<%@page import="rentcar.model.CarViewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자메뉴</title>
</head>
<body>

	<% 
	
		request.setCharacterEncoding("utf-8"); 
		
		ArrayList<CarViewBean> reserveList =  RentcarDao.getInstance().getAllReserve();
		
	%>
	
	<div align="center">
		<h1>전체 차량 예약 현황</h1>
		
		<table border="1">
			<tr height="40" align="center">
				<td width="150">이미지</td>
				<td width="150">이름</td>
				<td width="150">대여일</td>
				<td width="60">대여기간</td>
				<td width="100">금액</td>
				<td width="60">수량</td>
				<td width="60">보험</td>
				<td width="60">wifi</td>
				<td width="60">네비게이션</td>
				<td width="60">베이비시트</td>
				<td width="60">삭제</td>
			</tr>
	<%
			for(CarViewBean bean : reserveList) {
	%>
				<tr height="70" align="center">
					<td height="70">
						<img alt="" src="imgCar/<%=bean.getImg()%>" width="120" height="70">
					</td>
					<td width="100"><%=bean.getName()%></td>
					<td width="150"><%=bean.getRday()%></td>
					<td width="150"><%=bean.getDday()%></td>
					<td width="100"><%=bean.getPrice()%></td>
					<td width="60"><%=bean.getQty()%></td>
					<td width="100"><%=bean.getUseIn()%></td>
					<td width="60"><%=bean.getUseWifi()%></td>
					<td width="60"><%=bean.getUseNavi()%></td>
					<td width="60"><%=bean.getUseSeat()%></td>
					<td width="90">
						<button onclick="location.href='15_carReserveDel.jsp?id=<%=bean.getId()%>&rday=<%=bean.getRday()%>'">삭제</button>
					</td>				
				</tr>
	<%
			}
	%>
		</table>
	</div>

</body>
</html>