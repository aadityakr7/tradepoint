package com.starlabs.tradepoint.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.starlabs.tradepoint.model.Customer;
import com.starlabs.tradepoint.model.CustomerItem;
import com.starlabs.tradepoint.model.Item;
import com.starlabs.tradepoint.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@PostMapping("/addItem")
	public String addItem(@RequestParam String itemName, @RequestParam Integer cost, @RequestParam Integer customerId,
			ModelMap modelMap, HttpSession session) {
		itemService.addItem(new Item(itemName, cost), customerId);
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer != null) {
			modelMap.put("customer", customer);
		}
		List<CustomerItem> customerItems = itemService.findCustomerItemsByUsername(customer.getUsername());
		modelMap.put("customerItems", customerItems);
		return "my_items";
	}
	
	@RequestMapping("/sellItem")
	public String sellItem(@RequestParam Integer cItemId) {
		itemService.sellItem(cItemId);
		return "redirect:/myItems";
	}
	
	@RequestMapping("/repairItem")
	public String repairItem(@RequestParam Integer cItemId) {
		itemService.repairItem(cItemId);
		return "redirect:/myItems";
	}
	
	@RequestMapping("/deleteItem")
	public String deleteItem(@RequestParam Integer cItemId) {
		itemService.deleteItem(cItemId);
		return "redirect:/myItems";
	}
	
	@RequestMapping("/buyItem")
	public String buyItem(@RequestParam Integer cItemId, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		itemService.buyItemByCItemIdAndUsername(cItemId, customer.getUsername());
		return "redirect:/myItems";
	}
	
}
