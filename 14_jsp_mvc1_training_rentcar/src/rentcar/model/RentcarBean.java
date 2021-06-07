package rentcar.model;

public class RentcarBean {
	
	private int no;				//차량 번호
	private String name;		//차량명
	private int category;		//차량 분류
	private int price;			//렌트 금액
	private int usePeople;		//예약
	private String company;		//제조사
	private String img;			//차량 사진
	private String info;		//차량 정보
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUsePeople() {
		return usePeople;
	}
	public void setUsePeople(int usePeople) {
		this.usePeople = usePeople;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}

}
