package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDao {
	/*lấy danh sách sản phẩm theo khoảng từ a đến b*/
	/*tạo phân trang*/
	public List<Product> listProduct(int a, int b){
		Connection connection = null;
		PreparedStatement stm = null;
		List<Product> listProduct = new ArrayList<Product>(); 
		
		try {
			connection = DBContext.getConnection();
			//String sqlString = "SELECT product_id, product_name, product_des, CAST(product_price AS DECIMAL(8,0)) as product_price, product_img_source, product_type, product_brand from products limit ?,?";
			String sqlString = "SELECT * from products limit ?,?";
			
			stm = connection.prepareStatement(sqlString);
			stm.setInt(1, a);
			stm.setInt(2, b);
			ResultSet result = stm.executeQuery();
			while(result.next()) {
				Product product = new Product();
				product.setId(result.getInt("product_id"));
				product.setName(result.getString("product_name"));
				product.setDescription(result.getString("product_des"));				
				product.setPrice(result.getDouble("product_price"));
				product.setSrc(result.getString("product_img_source"));
				product.setType(result.getString("product_type"));
				product.setBrand(result.getString("product_brand"));
				listProduct.add(product);
			}
			
			result.close();
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return listProduct;
	}
	
	/*lấy danh sách sản phẩm theo từ khóa*/
	public List<Product> listProduct(String key){
		Connection connection = null;
		PreparedStatement stm = null;
		List<Product> listProduct = new ArrayList<Product>(); 
		try {
			connection = DBContext.getConnection();
			String sqlString = "select * from products where product_name like ?";
			stm = connection.prepareStatement(sqlString);
			stm.setString(1, "%" + key + "%");
			
			ResultSet result = stm.executeQuery();
			while(result.next()) {
				System.out.println(result.getInt("product_id"));
				Product product = new Product();
				product.setId(result.getInt("product_id"));
				product.setName(result.getString("product_name"));
				product.setDescription(result.getString("product_des"));
				product.setPrice(result.getFloat("product_price"));
				product.setSrc(result.getString("product_img_source"));
				product.setType(result.getString("product_type"));
				product.setBrand(result.getString("product_brand"));
				listProduct.add(product);
			}
			
			result.close();
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return listProduct;
	}
	
	/*lấy tổng số sản phẩm có trong database*/
	public int getTotalProduct() {
		Connection connection = null;
		PreparedStatement stm = null;
		int count = 0;
		try {
			connection = DBContext.getConnection();
			String sqlString = "select count(*) as count from products";
			stm = connection.prepareStatement(sqlString);
			ResultSet result = stm.executeQuery();
			
			while(result.next()) {
				count = result.getInt("count");
			}
			
			result.close();
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return count;
	}
	
	/*lấy thông tin của một sản phẩm*/
	public Product getProduct(int id) {
		Connection connection = null;
		PreparedStatement stm = null; 
		Product product = null;
		try {
			connection = DBContext.getConnection();
			String sqlString = "select * from products where product_id = ?";
			stm = connection.prepareStatement(sqlString);
			stm.setInt(1, id);
			
			ResultSet result = stm.executeQuery();
			while(result.next()) {
				product = new Product();
				product.setId(result.getInt("product_id"));
				product.setName(result.getString("product_name"));
				product.setDescription(result.getString("product_des"));
				product.setPrice(result.getFloat("product_price"));
				product.setSrc(result.getString("product_img_source"));
				product.setType(result.getString("product_type"));
				product.setBrand(result.getString("product_brand"));
			}
			
			result.close();
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return product;
	}
}
