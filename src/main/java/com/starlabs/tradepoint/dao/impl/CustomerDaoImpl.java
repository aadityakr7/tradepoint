package com.starlabs.tradepoint.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.starlabs.tradepoint.dao.CustomerDao;
import com.starlabs.tradepoint.model.Customer;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
	
	@Autowired
	private EntityManager entityManger;
	
	private Session getSession() {
		return entityManger.unwrap(Session.class);
	}

	@Override
	public List<Customer> findAllCustomer() {
		Session session = getSession();
		return session.createQuery("FROM Customer", Customer.class).list();
	}
	
	@Override
	public Customer findCustomerById(int id) {
		Session session = getSession();
		Query<Customer> query = session.createQuery("FROM Customer C WHERE C.id = :id", Customer.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	@Override
	public Customer findCustomerByUsername(String username) {
		Session session = getSession();
		Query<Customer> query = session.createQuery("FROM Customer C WHERE C.username = :username", Customer.class);
		query.setParameter("username", username);
		return query.getSingleResult();
	}
	
	@Override
	public int addCustomer(Customer customer) {
		Session session = getSession();
		return (int) session.save(customer);
	}

	@Override
	public void updateCustomer(Customer customer) {
		Session session = getSession();
		session.update(customer);
	}

}
