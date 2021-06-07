package rentcar.model;

public class CarViewBean {
	
	private String name;	//차량명
	private int price;		//렌트 금액
	private String img;		//차량 사진
	private String id;		//예약자 id
	private int qty;		//예약가능 수량
	private int dday;		//예약 기간
	private String rday;	//예약 시작일
	private int useIn;		//옵션1 : 보험
	private int useWifi;	//옵션2 : 와이파이
	private int useNavi;	//옵션3 : 내비게이션
	private int useSeat;	//옵션4 : 베이비시트

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
