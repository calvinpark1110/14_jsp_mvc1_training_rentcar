package rentcar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import rentcar.model.CarReserveBean;
import rentcar.model.CarViewBean;
import rentcar.model.MemberBean;
import rentcar.model.RentcarBean;

public class RentcarDao {
	
	private RentcarDao() {}
	private static RentcarDao dao = new RentcarDao();
	public static RentcarDao getInstance() {
		return dao;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		
		String dbURL = "jdbc:mysql://localhost:3306/rentcar?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	
	
	// 회원가입 DAO
	public boolean joinMember(MemberBean bean) {

		boolean isJoinMember = false;
		
		conn = getConnection();
		
		try {
			
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID=? AND PW=?");

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			rs = pstmt.executeQuery();

			if (!rs.next()) {
				
				pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(? , ? , ? , ? , ? , ? , ? ,?)");
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getPw());
				pstmt.setString(3, bean.getEmail());
				pstmt.setString(4, bean.getTel());
				pstmt.setString(5, bean.getHobby());
				pstmt.setString(6, bean.getJob());
				pstmt.setString(7, bean.getAge());
				pstmt.setString(8, bean.getInfo());
				
				pstmt.executeUpdate();
				
				isJoinMember = true;
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
		}
		
		return isJoinMember;
	}
	
	
	
	// 로그인 DAO
	public boolean login(String id, String pw) {
		
		boolean isLogin = false;
		
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID=? AND PW=?");
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isLogin = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null)    {try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();} catch (SQLException e) {}}
			
		}
		
		return isLogin;
		
	}
	
	
	
	//선택한 1대의 차량 정보를 조회하는 DAO
	public RentcarBean getOneCar(int no) {
		
		RentcarBean bean = new RentcarBean();
		
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM RENTCAR WHERE NO=?");
			pstmt.setInt(1, no);		
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsePeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
								
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null)    {try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();} catch (SQLException e) {}}
			
		}
		
		return bean;
		
	}
	
	//예약 차량 정보 저장
	public void setReserveCar(CarReserveBean bean) {
		
		conn = getConnection();
		
		int num = 0;
		try {
			
			//DB에 저장된 예약된 차량의 마지막 순서
			pstmt = conn.prepareStatement("SELECT MAX(RESERVE_SEQ) FROM CARRESERVE");
			rs = pstmt.executeQuery();
			
			//num은 마지막 순서 + 1
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			String sql = "INSERT INTO CARRESERVE (RESERVE_SEQ, NO, ID, QTY, DDAY, RDAY, USEIN, USEWIFI, USENAVI, USESEAT) ";
				   sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, bean.getNo());
			pstmt.setString(3, bean.getId());
			pstmt.setInt(4, bean.getQty());
			pstmt.setInt(5, bean.getDday());
			pstmt.setString(6, bean.getRday());
			pstmt.setInt(7, bean.getUseIn());
			pstmt.setInt(8, bean.getUseWifi());
			pstmt.setInt(9, bean.getUseNavi());
			pstmt.setInt(10, bean.getUseSeat());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null)    {try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();} catch (SQLException e) {}}
			
		}
		
	}
	
	
	
	//모든 차량 정보를 조회하는 DAO
	public ArrayList<RentcarBean> getAllCar() {
		
		ArrayList<RentcarBean> rentcarList = new ArrayList<>();
		
		RentcarBean bean = null;
		
		conn = getConnection();
		
		try {
			
			pstmt = conn.prepareStatement("SELECT * FROM RENTCAR");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new RentcarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsePeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				rentcarList.add(bean);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null)    {try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();} catch (SQLException e) {}}
			
		}
		
		return rentcarList;
		
	}
	
	
	
	// 전체 예약 현황(관리자)
	public ArrayList<CarViewBean> getAllReserve() {
		
		ArrayList<CarViewBean> reserveList = new ArrayList<>();
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM RENTCAR A2, CARRESERVE A1 WHERE A1.NO = A2.NO");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CarViewBean bean = new CarViewBean();
				
				bean.setName(rs.getString("name"));
				bean.setId(rs.getString("id"));
				bean.setPrice(rs.getInt("price"));
				bean.setImg(rs.getString("img"));
				bean.setQty(rs.getInt("qty"));
				bean.setDday(rs.getInt("dday"));
				bean.setRday(rs.getString("rday"));
				bean.setUseIn(rs.getInt("usein"));
				bean.setUseWifi(rs.getInt("usewifi"));
				bean.setUseNavi(rs.getInt("usenavi"));
				bean.setUseSeat(rs.getInt("useseat"));
				
				reserveList.add(bean);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
			if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
			if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
		}
		
		return reserveList;
		
	}
	
	
	
	
		
	
	
	// 전체 예약 현황을 조회하는 DAO(회원)
	public ArrayList<CarViewBean> getAllReserve(String id) {
		
		ArrayList<CarViewBean> carviewList = new ArrayList<>();
		CarViewBean bean = null;
		
		conn = getConnection();
		
		try {
			
			String sql = "SELECT * FROM RENTCAR A2, CARRESERVE A1 "
						+ "WHERE A1.ID = ? AND A1.NO = A2.NO";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				bean = new CarViewBean();
				bean.setName(rs.getString("name"));
				bean.setPrice(rs.getInt("price"));
				bean.setImg(rs.getString("img"));
				bean.setQty(rs.getInt("qty"));
				bean.setDday(rs.getInt("dday"));
				bean.setRday(rs.getString("rday"));
				bean.setUseIn(rs.getInt("usein"));
				bean.setUseWifi(rs.getInt("usewifi"));
				bean.setUseNavi(rs.getInt("usenavi"));
				bean.setUseSeat(rs.getInt("useseat"));
				
				carviewList.add(bean);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null)    {try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();} catch (SQLException e) {}}
			
		}
		
		return carviewList;
		
	}
	
	
	
	// 예약내역을 삭제하는 DAO
	public void carRemoveReserve(String id, String rday) {
		
		conn = getConnection();
		try {
			
			pstmt = conn.prepareStatement("DELETE FROM CARRESERVE WHERE ID=? AND RDAY=?");
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (rs != null)    {try {rs.close();} catch (SQLException e) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null)  {try {conn.close();} catch (SQLException e) {}}
			
		}
		
	}

}
