package com.software.base.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.software.base.entity.User;

public interface UserRepo extends CrudRepository<User, Integer>{
	
	User findByEmail(String email);
	
//	@Query("from User where email=:e and password=:p")
//	User findByEmailAndPassword(@Param("e") String email,@Param("p") String password);


	List<User> findByEmailAndPassword(String email, String password);
}
