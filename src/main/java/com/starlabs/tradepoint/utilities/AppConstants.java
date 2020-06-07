package com.starlabs.tradepoint.utilities;

public interface AppConstants {
	
	public static final String GENDER_MALE = "Male";
	
	public static final String GENDER_FEMALE = "Female";
	
	public static final String GENDER_OTHERS = "Others";
	
	public static final String[] GENDER = { GENDER_MALE, GENDER_FEMALE, GENDER_OTHERS };
	
	public static final String ITEM_STATUS_INVENTORY = "Inventory";
	
	public static final String ITEM_STATUS_SELLING = "Selling";
	
	public static final String ITEM_STATUS_SOLD = "Sold";
	
	public static final String ITEM_STATUS_REPAIR = "Sent to Repair";

	public static final String[] ITEM_STATUS = { ITEM_STATUS_INVENTORY,
			ITEM_STATUS_SELLING, ITEM_STATUS_SOLD, ITEM_STATUS_REPAIR };
	
}
