package com.starlabs.tradepoint.utilities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starlabs.tradepoint.dao.CustomerDao;
import com.starlabs.tradepoint.model.Customer;

@Service
public class UserValidationService {
	
	@Autowired
	private CustomerDao userDao;

	public boolean isUserValid(String username, String password) {
		Customer user = userDao.findCustomerByUsername(username);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				return true;
			}
		}
		return false;
	}
	
}
