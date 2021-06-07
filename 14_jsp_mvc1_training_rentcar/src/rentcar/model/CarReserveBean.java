package rentcar.model;

public class CarReserveBean {
	
	private int reserveSeq;		//예약 순서
	private int no;				//예약 번호
	private String id;			//예약자
	private int qty;			//예약 수량
	private int dday;			//예약기간
	private String rday;		//예약 시작일
	private int useIn;			//옵션1 : 보험
	private int useWifi;		//옵션2 : 와이파이
	private int useNavi;		//옵션3 : 내비게이션
	private int useSeat;		//옵션4 : 베이비시트
	
	public int getReserveSeq() {
		return reserveSeq;
	}
	public void setReserveSeq(int reserveSeq) {
		this.reserveSeq = reserveSeq;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public int getUseIn() {
		return useIn;
	}
	public void setUseIn(int useIn) {
		this.useIn = useIn;
	}
	public int getUseWifi() {
		return useWifi;
	}
	public void setUseWifi(int useWifi) {
		this.useWifi = useWifi;
	}
	public int getUseNavi() {
		return useNavi;
	}
	public void setUseNavi(int useNavi) {
		this.useNavi = useNavi;
	}
	public int getUseSeat() {
		return useSeat;
	}
	public void setUseSeat(int useSeat) {
		this.useSeat = useSeat;
	}
	
	
}
