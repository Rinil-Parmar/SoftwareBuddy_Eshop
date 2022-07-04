package com.software.base.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.software.base.entity.User;
import com.software.base.helper.fileUploadHelper;
import com.software.base.service.UserService;


@Controller
public class AppController {

	@Autowired
	private UserService servise;
	
	@RequestMapping("/")
	public String home() {
		return "home";	// render to home.jsp page
	}
	
	@GetMapping("/user/{uid}")
	@ResponseBody
	public Optional<User> viewUser(@PathVariable("uid") int uid) {
		return servise.viewUser(uid);
	}
	
	@GetMapping("/users")
	public String getuser(Model m) {
		List<User> users = (List<User>) servise.getUsers();
		System.out.println(users);
		m.addAttribute("allUsers", users);
		
		return "admin";
	}
	
	@RequestMapping("/{uid}/delete")
	public String deleteUser(@PathVariable("uid") int uid, HttpSession session) {
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid && loginUser.getType().equals("customer")) { return "notLoginError"; }		
		//	--------- /\ ----------
		
		servise.deleteUser(uid);
		session.removeAttribute("isLogin");
		session.removeAttribute("isAdmin");
		session.removeAttribute("userLogged");
		if(loginUser.getType().equals("admin")) {
			return "redirect:/users";
		}
		
		return "redirect:/";
	}
	
	//	render to register user page
	@RequestMapping("/register")
	public String registerUser(Model m) {
		User u = new User();
		m.addAttribute("user", u);
		return "register";
	}
	
	@RequestMapping("/login")
	public String login(Model m) {
		User u = new User();
		m.addAttribute("user", u);
		return "login";
	}
	
	@PostMapping("loginUser")
	public String loginUser(@ModelAttribute("user") User user ,HttpSession session) {
		String email = user.getEmail();
		String password = user.getPassword();
		
		List<User> u = servise.checkLogin(email, password);
		
		if (u.size() != 0) {
			session.setAttribute("isLogin", true);
			
			System.out.println(u);
			User singleU = u.get(0);
			session.setAttribute("userLogged", singleU);
			
			if(singleU.getType().equals("admin")) {
				session.setAttribute("isAdmin", true);
			}
		}
		else {
			System.out.println(12333);
			return "redirect:/login";
		}
		return "home";		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("isLogin");
		session.removeAttribute("isAdmin");
		session.removeAttribute("userLogged");
		return "redirect:/";
	}
	
	@PostMapping("/updateUser/{uid}")
	public String updateUserUI(@PathVariable("uid") int uid, Model m, HttpSession session) {
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
		
		User u = servise.viewUser(uid).orElse(new User());
		System.out.println(u);
		m.addAttribute("userToUpdate", u);
		return "updateUser";
	}
	
	@PostMapping("/updateUser/updateUser")
	public String updateUser(@ModelAttribute("userToUpdate") User user, @RequestParam("fileImage") MultipartFile file, HttpSession session) {
		boolean f = fuh.uploadFile(file);
		if (f) {
			System.out.println("success");
		}
		
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		user.setPhotos(fileName);
		
		servise.addUser(user);	
		session.removeAttribute("userLogged");
		session.setAttribute("userLogged", user);
		System.out.println(user.getType());
		
		if(user.getType().equals("customer") ) {
			return "redirect:/";
		}
		
		return "redirect:/users";	
	}
	
	
//	----------------------add User With file upload --------------------------
	@Autowired
	private fileUploadHelper fuh;
	
	@PostMapping("/addUser")
	public String addUser(@ModelAttribute("user") User user, Model m, @RequestParam("fileImage") MultipartFile file){
		
		boolean f = fuh.uploadFile(file);
		if (f) {
			System.out.println("success");
		}
		
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		user.setPhotos(fileName);
		
		
		Boolean isCreated = false;
		servise.addUser(user);
		isCreated = true;
		m.addAttribute("registration", isCreated);
		return "redirect:/login";
	}
		
//	--------------------- end -----------------	
	
	
	@RequestMapping("/temp")
	public String temp(Model m) {
		User u = new User();
		m.addAttribute("user", u);
		return "temp";
	}
		
}
