package com.starlabs.tradepoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starlabs.tradepoint.dao.ItemDao;
import com.starlabs.tradepoint.model.CustomerItem;
import com.starlabs.tradepoint.model.Item;
import com.starlabs.tradepoint.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDao itemDao;

	@Override
	public List<Item> findAllItem() {
		return itemDao.findAllItem();
	}

	@Override
	public Item findItemById(int id) {
		return itemDao.findItemById(id);
	}

	@Override
	public Item findItemByItemName(String itemName) {
		return itemDao.findItemByItemName(itemName);
	}

	@Override
	public List<CustomerItem> findCustomerItemsByUsername(String username) {
		return itemDao.findCustomerItemsByUsername(username);
	}

	@Override
	public int addItem(Item item, Integer customerId) {
		return itemDao.addItem(item, customerId);
	}

	@Override
	public void sellItem(Integer cItemId) {
		itemDao.sellItem(cItemId);
	}

	@Override
	public void repairItem(Integer cItemId) {
		itemDao.repairItem(cItemId);
	}

	@Override
	public void deleteItem(Integer cItemId) {
		itemDao.deleteItem(cItemId);
	}

	@Override
	public List<CustomerItem> findAllItemToBuyByUsername(String username) {
		return itemDao.findAllItemToBuyByUsername(username);
	}

	@Override
	public void buyItemByCItemIdAndUsername(Integer cItemId, String username) {
		itemDao.buyItemByCItemIdAndUsername(cItemId, username);
	}

}
