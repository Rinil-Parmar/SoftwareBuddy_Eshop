package com.software.base.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="order_details")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int order_id;
	
	String purchased_date; 
	
	@ManyToOne
	User user ;
	
	@OneToMany
	List<Product> ordered_products = new ArrayList<>();

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int order_id, String purchased_date, User user, List<Product> ordered_products) {
		super();
		this.order_id = order_id;
		this.purchased_date = purchased_date;
		this.user = user;
		this.ordered_products = ordered_products;
	}

	public String getPurchased_date() {
		return purchased_date;
	}

	public void setPurchased_date(String purchased_date) {
		this.purchased_date = purchased_date;
	}

	public List<Product> getOrdered_products() {
		return ordered_products;
	}

	public void setOrdered_products(List<Product> ordered_products) {
		this.ordered_products = ordered_products;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
