package com.software.base.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.software.base.entity.Product;

public interface ProductRepo extends CrudRepository<Product, Integer>{
	
}
