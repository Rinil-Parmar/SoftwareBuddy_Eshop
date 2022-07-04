package com.software.base.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int productId; 
	
	String name;
	String productPic;
	String description;
	int price;
	
	@ManyToMany
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinTable(
			name="user_product",
			joinColumns = @JoinColumn(name="product_id"),
			inverseJoinColumns = @JoinColumn(name="user_id")
	)
	Set<User> userWithProductInCart = new HashSet<>();
	
//	@ManyToMany(mappedBy = "purchasedProducts")
//	List<User> userWithPurchasedItem = new ArrayList<>();
//	
//	@ManyToOne
//	Order product_order;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productId, String name, String productPic, String description, int price) {
		super();
		this.productId = productId;
		this.name = name;
		this.productPic = productPic;
		this.description = description;
		this.price = price;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProductPic() {
		return productPic;
	}

	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	

	public Set<User> getUserWithProductInCart() {
		return userWithProductInCart;
	}

	public void setUserWithProductInCart(Set<User> userWithProductInCart) {
		this.userWithProductInCart = userWithProductInCart;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", productPic=" + productPic + ", price=" + price + "]";
	}

	public void addUserToCart(User usr) {
		userWithProductInCart.add(usr);
		
	}	
	
	
	
}
