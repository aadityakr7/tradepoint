package com.starlabs.tradepoint.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.starlabs.tradepoint.model.Customer;
import com.starlabs.tradepoint.model.Item;
import com.starlabs.tradepoint.service.CustomerService;
import com.starlabs.tradepoint.service.ItemService;
import com.starlabs.tradepoint.utilities.UserValidationService;

@Controller
public class UACController {
	
	@Autowired
	private UserValidationService validationService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/registration")
	public String registration() {
		return "registration";
	}
	
	@PostMapping(value = "/processLogin")
	public String processLogin(@RequestParam String username, @RequestParam String password, ModelMap modelMap,
			HttpServletRequest request) {
		boolean validUser = validationService.isUserValid(username, password);
		if(validUser) {
			modelMap.put("username", username);
			Customer customer = customerService.findCustomerByUsername(username);
			request.getSession().setAttribute("customer", customer);
			return "redirect:/userDashboard";
		} else {
			modelMap.put("errorMessage", "Invalid Credentials!");
			return "redirect:/login";
		}
	}

	@PostMapping(value = "/processRegistration")
	public String processRegistration(@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String username, @RequestParam String email,
			@RequestParam String password, ModelMap modelMap,
			HttpServletRequest request) {
		Customer customerObj = new Customer();
		customerObj.setUsername(username);
		customerObj.setFirstName(firstName);
		customerObj.setLastName(lastName);
		customerObj.setEmail(email);
		customerObj.setPassword(password);
		customerService.addCustomer(customerObj);
		Customer customer = customerService.findCustomerByUsername(username);
		request.getSession().setAttribute("customer", customer);
		List<Item> items = itemService.findAllItem();
		modelMap.put("items", items);
		return "redirect:/userDashboard";
	}
	
	@PostMapping(value = "/updateUserDetails")
	public String updateUserDetails(@ModelAttribute("customer") Customer customer,
			HttpServletRequest request) {
		Customer existingCustomerObj = customerService.findCustomerByUsername(customer.getUsername());
		existingCustomerObj.setFirstName(customer.getFirstName());
		existingCustomerObj.setLastName(customer.getLastName());
		existingCustomerObj.setEmail(customer.getEmail());
		existingCustomerObj.setGender(customer.getGender());
		existingCustomerObj.setDob(customer.getDob());
		existingCustomerObj.setMotherName(customer.getMotherName());
		existingCustomerObj.setFatherName(customer.getFatherName());
		existingCustomerObj.setAddress(customer.getAddress());
		existingCustomerObj.setContactNo(customer.getContactNo());
		customerService.updateCustomer(existingCustomerObj);
		request.getSession().setAttribute("customer", existingCustomerObj);
		return "redirect:/userDashboard";
	}
	
}
