package model;

import java.util.ArrayList;
import java.util.List;



public class Cart {
	private List<Product> items;//danh sách các sản phẩm trong giỏ
	
	public Cart() {
		items = new ArrayList<Product>();
	}
	
	//thêm một sản phầm vào giỏ
	public void add(Product pi) {
		for(Product p : items) {
			if(pi.getId() == p.getId()) {
				p.setNumber(p.getNumber() + 1);
				
				return;
			}
		}
		items.add(pi);
	}
	
	//xóa một sản phẩm khỏi giỏ
	public void remove(int id) {
		for(Product p: items) {
			if(p.getId() == id) {
				items.remove(p);
				return;
			}
		}
	}
	
	//update số lượng sản phẩm trong giỏ
	public void updateQuantity(Product pr, int quantity) {
		for(Product p : items) {
			if(pr.getId() == p.getId()) {
				p.setNumber(quantity);
				return;
			}
		}
	}
	
	//trả về tổng giá tiền của sản phẩm trong giỏ
	public double getAmount() {
		double sum = 0;
		for(Product p : items) {
			sum += p.getPrice() * p.getNumber();
		}
		
		return Math.round(sum * 100.0) / 100.0;
	}
	
	//trả về số lượng sản phẩm trong giỏ
	public int getQuantity() {
		int total = 0;
		for(Product p : items) {
			total += p.getNumber();
		}
		
		return total;
	}
	
	//trả về số lượng của từng sản phẩm trong giỏ
	public int getQuantity(int id) {
		int total = 0;
		for(Product p : items) {
			if(p.getId() == id) {
				total = p.getNumber();
				break;
			}
		}
		return total;
		
	}
	
	//trả về tất cả các sản phẩm trong giỏ
	public List<Product> getItems(){
		return items;
	}
}
