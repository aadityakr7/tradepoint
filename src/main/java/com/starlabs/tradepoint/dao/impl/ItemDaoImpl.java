package com.starlabs.tradepoint.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.starlabs.tradepoint.dao.ItemDao;
import com.starlabs.tradepoint.model.Customer;
import com.starlabs.tradepoint.model.CustomerItem;
import com.starlabs.tradepoint.model.Item;
import com.starlabs.tradepoint.service.CustomerService;
import com.starlabs.tradepoint.utilities.AppConstants;

@Repository
@Transactional
public class ItemDaoImpl implements ItemDao, AppConstants {
	
	@Autowired
	private EntityManager entityManger;
	
	private Session getSession() {
		return entityManger.unwrap(Session.class);
	}
	
	@Autowired
	private CustomerService customerService;

	@Override
	public List<Item> findAllItem() {
		Session session = getSession();
		return session.createQuery("FROM Item", Item.class).list();
	}
	
	@Override
	public Item findItemById(int id) {
		Session session = getSession();
		Query<Item> query = session.createQuery("FROM Item I WHERE I.id = :id", Item.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}
	
	@Override
	public Item findItemByItemName(String itemName) {
		Session session = getSession();
		Query<Item> query = session.createQuery("FROM Item I WHERE I.itemName = :itemName", Item.class);
		query.setParameter("itemName", itemName);
		return query.getSingleResult();
	}

	@Override
	public List<CustomerItem> findCustomerItemsByUsername(String username) {
		Customer customer = customerService.findCustomerByUsername(username);
		List<CustomerItem> customerItems = new ArrayList<>();
		Session session = getSession();
		Query<CustomerItem> query = session.createQuery("FROM CustomerItem UI WHERE UI.customer.id = :customerId", CustomerItem.class);
		query.setParameter("customerId", customer.getId());
		customerItems = query.list();
		return customerItems;
	}

	@Override
	public int addItem(Item item, Integer customerId) {
		Session session = getSession();
		session.save(item);
		Customer customer = customerService.findCustomerById(customerId);
		CustomerItem customerItem = new CustomerItem();
		customerItem.setItem(item);
		customerItem.setCustomer(customer);
		customerItem.setStatus(ITEM_STATUS_INVENTORY);
		return (int) session.save(customerItem);
	}

	@Override
	public void sellItem(Integer cItemId) {
		Session session = getSession();
		CustomerItem customerItem = session.get(CustomerItem.class, cItemId);
		customerItem.setStatus(ITEM_STATUS_SELLING);
		session.update(customerItem);
	}

	@Override
	public void repairItem(Integer cItemId) {
		Session session = getSession();
		CustomerItem customerItem = session.get(CustomerItem.class, cItemId);
		customerItem.setStatus(ITEM_STATUS_REPAIR);
		session.update(customerItem);
	}

	@Override
	public void deleteItem(Integer cItemId) {
		Session session = getSession();
		CustomerItem customerItem = session.get(CustomerItem.class, cItemId);
		session.delete(customerItem);
	}

	@Override
	public List<CustomerItem> findAllItemToBuyByUsername(String username) {
		Customer customer = customerService.findCustomerByUsername(username);
		Session session = getSession();
		Query<CustomerItem> query = session.createQuery("FROM CustomerItem UI WHERE UI.customer.id != :customerId"
				+ " AND status = :status", CustomerItem.class);
		query.setParameter("customerId", customer.getId());
		query.setParameter("status", ITEM_STATUS_SELLING);
		List<CustomerItem> customerItems = query.list();
		return customerItems;
	}

	@Override
	public void buyItemByCItemIdAndUsername(Integer cItemId, String username) {
		Customer customer = customerService.findCustomerByUsername(username);
		Session session = getSession();
		Query<CustomerItem> query = session.createQuery("FROM CustomerItem UI WHERE UI.id = :cItemId", CustomerItem.class);
		query.setParameter("cItemId", cItemId);
		CustomerItem customerItem = query.getSingleResult();
		customerItem.setStatus(ITEM_STATUS_SOLD);
		session.update(customerItem);
		CustomerItem customerItemNew = new CustomerItem();
		customerItemNew.setCustomer(customer);
		customerItemNew.setItem(customerItem.getItem());
		customerItemNew.setStatus(ITEM_STATUS_INVENTORY);
		session.save(customerItemNew);
	}

}
