package com.starlabs.tradepoint.service;

import java.util.List;

import com.starlabs.tradepoint.model.CustomerItem;
import com.starlabs.tradepoint.model.Item;

public interface ItemService {

	public List<Item> findAllItem();
	
	public Item findItemById(int id);
	
	public Item findItemByItemName(String itemName);
	
	public List<CustomerItem> findCustomerItemsByUsername(String username);
	
	public int addItem(Item item, Integer customerId);
	
	public void sellItem(Integer cItemId);
	
	public void repairItem(Integer cItemId);
	
	public void deleteItem(Integer cItemId);

	public List<CustomerItem> findAllItemToBuyByUsername(String username);

	public void buyItemByCItemIdAndUsername(Integer cItemId, String username);
	
}
