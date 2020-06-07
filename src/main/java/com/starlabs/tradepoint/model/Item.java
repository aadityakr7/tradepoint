package com.starlabs.tradepoint.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Item implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4500286247997585041L;

	public Item() {
		super();
	}

	public Item(String itemName, Integer cost) {
		super();
		this.itemName = itemName;
		this.cost = cost;
	}

	@Id
	@GeneratedValue
	private int id;
	
	@Column
	private String itemName;
	
	@Column
	private Integer cost;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	@Override
	public String toString() {
		return "Item [itemName=" + itemName + ", cost=" + cost + "]";
	}

}
