package com.starlabs.tradepoint.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.starlabs.tradepoint.model.Customer;
import com.starlabs.tradepoint.model.CustomerItem;
import com.starlabs.tradepoint.model.Item;
import com.starlabs.tradepoint.service.ItemService;

@Controller
public class HomeController {
	
	@Autowired
	private ItemService itemService;

	@RequestMapping(value = "/")
	public String index(HttpSession session) {
		if(session.getAttribute("customer") != null) {
			return "redirect:/userDashboard";
		}
		return "index";
	}
	
	@RequestMapping(value = "/tradepoint")
	public String loadHomePage(HttpSession session) {
		if(session.getAttribute("customer") != null) {
			return "redirect:/userDashboard";
		}
		return "index";
	}
	
	@RequestMapping(value = "/userDashboard")
	public String userDashboard(ModelMap modelMap, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer != null) {
			modelMap.put("customer", customer);
		}
		List<Item> items = itemService.findAllItem();
		modelMap.put("items", items);
		return "user_dashboard";
	}
	
	@RequestMapping(value = "/buyItems")
	public String buyItems(ModelMap modelMap, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer != null) {
			modelMap.put("customer", customer);
		}
		List<CustomerItem> cItems = itemService.findAllItemToBuyByUsername(customer.getUsername());
		if(cItems != null && cItems.size()>0) {
			modelMap.put("cItems", cItems);
		} else {
			modelMap.put("message", "No items available to buy right now!");
		}
		return "items_list_page";
	}
	
	@RequestMapping(value = "/myItems")
	public String myItems(ModelMap modelMap, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer != null) {
			modelMap.put("customer", customer);
		}
		//List<Item> items = itemDao.findAllItem();
		List<CustomerItem> customerItems = itemService.findCustomerItemsByUsername(customer.getUsername());
		modelMap.put("customerItems", customerItems);
		return "my_items";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
