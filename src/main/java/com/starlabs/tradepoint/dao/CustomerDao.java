package com.starlabs.tradepoint.dao;

import java.util.List;

import com.starlabs.tradepoint.model.Customer;

public interface CustomerDao {

	public List<Customer> findAllCustomer();
	
	public Customer findCustomerById(int id);
	
	public Customer findCustomerByUsername(String username);
	
	public int addCustomer(Customer customer);

	public void updateCustomer(Customer customer);
	
}
