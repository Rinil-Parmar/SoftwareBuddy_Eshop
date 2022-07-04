package com.software.base.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.software.base.entity.Order;
import com.software.base.entity.Product;
import com.software.base.entity.User;
import com.software.base.helper.fileUploadHelper;
import com.software.base.service.OrderService;
import com.software.base.service.ProductService;
import com.software.base.service.UserService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private fileUploadHelper fuh;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/create_product")
	public String create_product(Model m) {
		Product p = new Product();
		m.addAttribute("product", p);
		return "createProduct";
	}
	
	@PostMapping("/addProduct")
	public String add_product(@ModelAttribute("product") Product product, Model m, @RequestParam("fileImage") MultipartFile file) {
		
		boolean f = fuh.uploadFile(file);
		if (f) {
			System.out.println("success");
		}
		
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		product.setProductPic(fileName);
		
		service.addProduct(product);
		
		return "redirect:/create_product";
	}
	
	@RequestMapping("/viewProduct")
	public String viewProduct(Model m) {
		List<Product> products = (List<Product>) service.showAllProducts();
		m.addAttribute("products", products);
		
		return "viewProducts";
	}
	
	@GetMapping("/addToCart/{uid}/{pid}")
	public String addToCart(@PathVariable("uid") int uid, @PathVariable("pid") int pid, HttpSession session) {
		//	check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		int loginUserId = loginUser.getUserId();
		
		if(loginUserId != uid) {
			return "notLoginError";
		}
		//	--------- /\ ----------		
		
		User usr = userService.viewUser(uid).get();
		Product prd = service.getProduct(pid).get();
		
		prd.addUserToCart(usr);
		service.addProduct(prd);
		
//		Not neccessary, it is already added by default
//		usr.addProductToCart(prd);
//		userService.addUser(usr);
		
		usr.printCartProducts();
		
		return "redirect:/viewProduct";
	}
	
	@RequestMapping("/cart/{uid}")
	public String viewCart(Model m, @PathVariable("uid") int uid, HttpSession session) {

		//	check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
		
		User u = userService.viewUser(uid).get();
		Set<Product> cartProducts = u.getProducts();
		
		if(cartProducts.size() == 0) {
			m.addAttribute("isCartNull", true);
		}
		m.addAttribute("products", cartProducts);
		m.addAttribute("user_id", uid);
		return "cart";
	}
	
	@RequestMapping("/{uid}/deleteItem/{product}") 
	public String deleteFromCart(@PathVariable("uid") int uid ,@PathVariable("product") int product, HttpSession session){
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
			
		User u = userService.viewUser(uid).get();
		Product p = service.getProduct(product).get();
//		u.getProducts().remove(p);
//		userService.addUser(u);
		p.getUserWithProductInCart().remove(u);
		service.addProduct(p);
		
		
		System.out.println("sdf");
		
		return "redirect:/cart/"+uid;
		
	}
	
//	for purchase a single product from viewProducts
	@RequestMapping("/{uid}/purchaseProduct/{product}")
	public String purchaseProduct(Model m, @PathVariable("uid") int uid, @PathVariable("product") int pid, HttpSession session) {
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
		
		m.addAttribute("user_id", uid);
		System.out.println(uid);
		Set<Product> productsToBy = new HashSet<>();
		Product p = service.getProduct(pid).get();
		productsToBy.add(p);
	
		session.setAttribute("productsToBy", productsToBy);
		
		return "confirmPurchase";
	}
	
	@RequestMapping("/{uid}/purchaseProducts")
	public String purchaseProducts(Model m, @PathVariable("uid") int uid, HttpSession session) {
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
		
		m.addAttribute("user_id", uid);
		User usr = userService.viewUser(uid).get();
		Set<Product> products = usr.getProducts();
		
		for(Product p : products) {
			System.out.println(p.getName());
		}
		session.setAttribute("productsToBy", products);
		
		return "confirmPurchase";
	}
	
	@PostMapping("/{uid}/confirmPurchase")
	public String confirmPurchase(@PathVariable("uid") int uid, HttpSession session, Model m) {
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
		
		// all products or product that user purchased		
		Set<Product> products = (Set<Product>) session.getAttribute("productsToBy");
		
		//getting user with user id = uid
		User usr = userService.viewUser(uid).get();		
		
		//	creating date object
		String  current_date = LocalDate.now().toString(); 
		
		//creating Order object
		Order ord = new Order();
		ord.setUser(usr);
		ord.setPurchased_date(current_date);
		int totalAmount = 0;
		for(Product p : products) {
			ord.getOrdered_products().add(p);
			totalAmount += p.getPrice();
		}
		
		m.addAttribute("totalAmount", totalAmount);
		m.addAttribute("tax", 00);
		
		orderService.addOrder(ord);
		System.out.println(ord.getOrder_id());
		m.addAttribute("order", ord);
		
		return "invoice";
		
	}
	
//	@RequestMapping("/invoice/{oid}")
//	public String viewInvoice(Model m, HttpSession session, @PathVariable("oid") int oid) {
//		//		check login
//		User loginUser = (User) session.getAttribute("userLogged");
//		if(loginUser == null) {	return "notLoginError";	}
//		//	--------- /\ ----------
//		
//		Order order = orderService.getOrder(oid);
//		m.addAttribute("order", order);
//		
//		return "invoice";
//	}

	@RequestMapping("/{uid}/orders")
	public String viewOrders(@PathVariable("uid") int uid, Model m, HttpSession session) {
		//		check url tempered activity	
		User loginUser = (User) session.getAttribute("userLogged");
		if(loginUser == null) {	return "notLoginError";	}
		int loginUserId = loginUser.getUserId();		
		if(loginUserId != uid) { return "notLoginError"; }		
		//	--------- /\ ----------
			
		User usr = userService.viewUser(uid).get();
		int count_ord = 0;
		List<Order> orders = new ArrayList<>();
		
		System.out.println(usr.getOrders());
		
		for(Order o : usr.getOrders()) {
			orders.add(o);
			count_ord += 1;
		}
		
		m.addAttribute("orders", orders);
		m.addAttribute("user_id", uid);
		
		if(count_ord == 0) {
			m.addAttribute("noOrder", true);
		}
		
		return "orders";
	}
	
	
}
