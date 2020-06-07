package com.starlabs.tradepoint.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class CustomerItem {
	
	@Id
	@GeneratedValue
	private int id;

	@OneToOne
	@JoinColumn(name = "CUSTOMER_ID")
	private Customer customer;
	
	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "ITEM_ID")
	private Item item;
	
	@Column
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
