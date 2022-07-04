package com.software.base.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.software.base.dao.UserRepo;
import com.software.base.entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserRepo repo;
	
	public void addUser(User user) {
		repo.save(user);
	}
	
	public Optional<User> viewUser(int id) {
		return repo.findById(id);
	}
	
	public List<User> getUsers() {
		return (List<User>) repo.findAll();
	}
	
	public void deleteUser(int uid) {
		User user = repo.findById(uid).orElse(new User());
		repo.delete(user);
	}
	
	public List<User> checkLogin(String email, String password) {
		System.out.println(email);
		System.out.println(password);
		return repo.findByEmailAndPassword(email, password);
	}
}
