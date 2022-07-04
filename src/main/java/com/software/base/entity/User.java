package com.software.base.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;


@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int userId;
	String password;

	String name;
	String email;
	Long mobileNo;
	String type;
	
	 @Column(nullable = true, length = 64)
	 private String photos;
	 
	 @ManyToMany(mappedBy = "userWithProductInCart")
	 Set<Product> products = new HashSet<>();
	 
	@OneToMany(mappedBy = "user")
	List<Order> orders = new ArrayList<>();
	 
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public User(int userId, String password, String name, String email, Long mobileNo) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.mobileNo = mobileNo;
	}

	public List<Order> getOrders() {
		return orders;
	}


	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}


	public Set<Product> getProducts() {
		return products;
	}
	
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	

	//	getters and setters
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(Long mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", mobileNo=" + mobileNo + "]";
	}
	
	public void addProductToCart(Product p) {
		products.add(p);
	}
	
	public void printCartProducts() {
		for(Product p: products) {
			System.out.println(p.getName());
		}
	}
	
}
