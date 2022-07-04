package com.software.base.dao;

import org.springframework.data.repository.CrudRepository;

import com.software.base.entity.Order;

public interface OrderRepo extends CrudRepository<Order, Integer>{

}
