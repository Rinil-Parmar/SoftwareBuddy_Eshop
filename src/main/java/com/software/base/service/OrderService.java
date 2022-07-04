package com.software.base.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.software.base.dao.OrderRepo;
import com.software.base.entity.Order;

@Service
public class OrderService {

	@Autowired
	private OrderRepo repo;
	
	public void addOrder(Order ord) {
		repo.save(ord);
	}
	
	public Order getOrder(int oid) {
		return repo.findById(oid).get();
	}
	
	public void deleteOrder(int oid) {
		repo.deleteById(oid);
	}
	
//	@Query("select * from Order where user.userId :u")
//	public List<Order> getAllOrder(int uid)

}
