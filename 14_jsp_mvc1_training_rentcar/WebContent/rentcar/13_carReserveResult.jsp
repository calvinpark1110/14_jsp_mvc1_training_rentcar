<%@page import="rentcar.model.RentcarBean"%>
<%@page import="rentcar.dao.RentcarDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="rbean" class="rentcar.model.CarReserveBean">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>
	
	<%
		String id = (String)session.getAttribute("id");
	
		if (id == null) {
	%>
		<script type="text/javascript">
			alert("로그인 후, 예약이 가능합니다.");
			location.href='01_carMain.jsp?center=07_memberLogin.jsp';
		</script>
	<%
		}
		

		Date d1 = new Date();
		Date d2 = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		d1 = sdf.parse(rbean.getRday());
		d2 = sdf.parse(sdf.format(d2));		
	
		
		int compare = d1.compareTo(d2);
		
		
		if(compare < 0) {		
	%>
		<script type="text/javascript">
			alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없습니다.");
			history.go(-1);
		</script>
	<%
		}
	
		
		String id1 = (String)session.getAttribute("id");
		rbean.setId(id1);
		
		RentcarDao rdao = RentcarDao.getInstance();
		rdao.setReserveCar(rbean);
		
		RentcarBean cbean = rdao.getOneCar(rbean.getNo());
		
		int totCar = cbean.getPrice() * rbean.getQty() * rbean.getDday();
		
		int usein = 0;
		if(rbean.getUseIn() == 1) { usein = 10000; }
		
		int usewifi = 0;
		if(rbean.getUseWifi() == 1) { usewifi = 10000; }
		
		int useseat = 0;
		if(rbean.getUseSeat() == 1) { useseat = 10000; }
		
		int totOption = (rbean.getQty() * rbean.getDday() * (usein + usewifi + useseat));
		
	%>
	
	<div align="center">
		<table>
			<tr align="center" height="100">
				<td>
					<font size="6" color="gray">차량 예약 완료</font>
				</td>
			</tr>
			<tr align="center" height="100">
				<td>
					<img alt="" src="imgCar/<%=cbean.getImg()%>" width="470">
				</td>
			</tr>
			<tr align="center" height="50">
				<td>
					<font size="5" color="red">차량 총 예약금액 <%=totCar%> 원</font>
				</td>
			</tr>
			<tr align="center" height="50">
				<td>
					<font size="5" color="red">차량 총 옵션금액 <%=totOption%> 원</font>
				</td>
			</tr>
			<tr align="center" height="50">
				<td>
					<font size="5" color="red">차량 총 금액 <%=totCar + totOption%> 원</font>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>