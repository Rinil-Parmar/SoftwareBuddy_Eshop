package com.software.base.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.software.base.dao.ProductRepo;
import com.software.base.entity.Product;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepo repo;
	
	public void addProduct(Product p) {
		repo.save(p);
	}
	
	public List<Product> showAllProducts() {
		return (List<Product>) repo.findAll();
	}
	
	public Optional<Product> getProduct(int id) {
		return repo.findById(id);
	}
	
	public void deleteProduct(int pid) {
		repo.deleteById(pid);
	}

	
	/*
	 * public List<Product> allCartItems() { return repo.cartProducts(); }
	 */
	
}
