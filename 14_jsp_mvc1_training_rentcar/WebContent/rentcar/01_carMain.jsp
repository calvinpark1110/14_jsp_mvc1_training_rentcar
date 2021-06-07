<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- 

	/* 1. 데이터 베이스 생성 */
	CREATE DATABASE RENTCAR;
	USE RENTCAR;
	
	/* 2. RENTCAR 테이블 생성 */
	CREATE TABLE RENTCAR(
		NO INT,
		NAME VARCHAR(20),
		CATEGORY INT,
		PRICE INT,
		USEPEOPLE INT,
		COMPANY VARCHAR(50),
		IMG VARCHAR(50),
		INFO VARCHAR(500)
	);

	/* 3. RENTCAR 테이블에 데이터 삽입 */
	INSERT INTO RENTCAR VALUES (1, '아반떼', 2,  20000, 4, '현대', 'avante.PNG' , '아반떼 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (2, '아이오닉', 2,  23000, 4,'현대', 'ioniq.PNG' , '아이오닉 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (3, '쏘나타', 2,  30000, 4, '현대', 'sonata.PNG' , '쏘나타 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (4, '그랜저', 3,  35000, 4, '현대', 'grandeur.PNG' , '그랜저 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (5, '스타렉스', 3,  30000, 4, '현대', 'starex.PNG' , '스타렉스 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (6, '제네시스', 2,  45000, 4, '현대', 'genesis.PNG' , '제네시스 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (8, '모닝', 1,  12000, 4, '현대', 'morning.PNG' , '모닝 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (7, 'k3', 2,  18000, 4, '기아', 'k3.PNG' , 'k3 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (9, 'k5', 2,  28000, 4, '기아', 'k5.PNG' , 'k5 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (10, 'k7', 2,  35000, 4, '기아', 'k7.PNG' , 'k7 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (11, 'k9', 3,  75000, 4,'기아', 'k9.PNG' , 'k9 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (12, '레이', 1,  14000, 4, '기아', 'ray.PNG' , '레이 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (13, '스포티지', 2,  28000, 4, '기아', 'sportage.PNG' , '스포티지 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (14, '카니발', 3,  38000, 4, '기아', 'carnival.PNG' , '카니발 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (15, 'SM5', 2,  21000, 4, '삼성', 'sm5.PNG' , 'SM5 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (16, 'SM6', 2,  28000, 4, '삼성', 'sm6.PNG' , 'SM6 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (17, 'QM6', 2,  30000, 4, '삼성', 'qm6.PNG' , 'QM6 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (18, '렉스턴', 3,  42000, 4, '쌍용', 'rexton.PNG' , '렉스턴 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (19, '티볼리', 1,  24000, 4, '쌍용', 'tivoli.PNG' , '티볼리 자동차 입니다.');
	INSERT INTO RENTCAR VALUES (20, '코란도', 2,  28000, 4, '쌍용', 'korando.PNG' , '코란도 자동차 입니다.');



	/* 4. MEMBER 테이블 생성 */
	CREATE TABLE MEMBER(
		ID VARCHAR(20),
		PW VARCHAR(20),
		EMAIL VARCHAR(50),
		TEL VARCHAR(20),
		HOBBY VARCHAR(60),
		JOB VARCHAR(15),
		AGE VARCHAR(10),
		INFO VARCHAR(500)
	);


	/* 5. 관리자 회원정보 삽입 */
	INSERT INTO member VALUES('admin', '1234', 'admin@rent.com', '02-1111-9999', '', '', 0, '관리자 아이디');
	SELECT * FROM MEMBER;


	/* 6. 예약정보 테이블 생성*/
	CREATE TABLE CARRESERVE(
		RESERVE_SEQ INT,	/*예약된 차량 순서*/
		NO INT,				/*예약된 차량 고유 넘버*/
		ID VARCHAR(50),
		QTY INT,
		DDAY INT,
		RDAY VARCHAR(50),
		USEIN INT,
		USEWIFI INT,
		USENAVI INT,
		USESEAT INT
	);

 -->

<body>

	<div align="center">
		<%
			String center = request.getParameter("center");
		
			//처음 실행 시, 다른 center값이 넘어오지않게 null처리
			if(center == null) {
				center = "04_center.jsp";	//default center값
			}
		%>
		
		<table>
			<%-- top(상단_고정) --%>
			<tr height="120" align="center">
				<td align="center" width="1000">
					<jsp:include page="02_top.jsp"></jsp:include>
				</td>
			</tr>
			
			<%-- center(각 페이지를 불러올 부분) --%>
			<tr align="center">
				<td align="center" width="1000">
					<jsp:include page="<%=center%>" />
				</td>
			</tr>
			
			<%-- bottom(하단_고정) --%>
			<tr align="center" height="100">
				<td align="center" width="10000">
					<jsp:include page="03_bottom.jsp"></jsp:include>
				</td>
			</tr>
		</table>
		
	</div>

</body>
</html>