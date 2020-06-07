package com.starlabs.tradepoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starlabs.tradepoint.dao.CustomerDao;
import com.starlabs.tradepoint.model.Customer;
import com.starlabs.tradepoint.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDao userDao;

	@Override
	public List<Customer> findAllCustomer() {
		return userDao.findAllCustomer();
	}

	@Override
	public Customer findCustomerById(int id) {
		return userDao.findCustomerById(id);
	}

	@Override
	public Customer findCustomerByUsername(String username) {
		return userDao.findCustomerByUsername(username);
	}

	@Override
	public int addCustomer(Customer customer) {
		return userDao.addCustomer(customer);
	}

	@Override
	public void updateCustomer(Customer customer) {
		userDao.updateCustomer(customer);
		
	}

}
