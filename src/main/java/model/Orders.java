package model;

import java.util.Date;
import java.util.List;

public class Orders {
	private int orderId;
	private double price;
	private int status;
	private Date orderDate;
	private String address;
	private String phone;
	private List<ProductOrders> lp;
	private String userMail;
	private Date receivedDate;
	private String discount;
	private String note;
	
	public Orders() {
		
	}
	
	public Orders(int orderId, double price, int status, Date orderDate, 
			String address, String phone, List<ProductOrders> lp, String userMail, Date receivedDate) {
		this.orderId = orderId;
		this.price = price;
		this.status = status;
		this.orderDate = orderDate;
		this.address = address;
		this.phone = phone;
		this.lp = lp;
		this.userMail = userMail;
		this.receivedDate = receivedDate;
	}
	
	public Orders(String userMail, int status, String discount, String address, 
			String phone, Date orderDate, String note) {
		this.userMail = userMail;
		this.status = status;
		this.discount = discount;
		this.address = address;
		this.phone = phone;
		this.orderDate = orderDate;
		this.note = note;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<ProductOrders> getLp() {
		return lp;
	}

	public void setLp(List<ProductOrders> lp) {
		this.lp = lp;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public Date getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
}
