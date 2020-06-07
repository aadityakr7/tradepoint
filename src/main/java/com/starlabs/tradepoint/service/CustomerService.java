package com.starlabs.tradepoint.service;

import java.util.List;

import com.starlabs.tradepoint.model.Customer;

public interface CustomerService {

	public List<Customer> findAllCustomer();
	
	public Customer findCustomerById(int id);
	
	public Customer findCustomerByUsername(String username);
	
	public int addCustomer(Customer customer);
	
	public void updateCustomer(Customer customer);
	
}
