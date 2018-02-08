package com.yalu.shoppingbackend.dao;

import java.util.List;

import com.yalu.shoppingbackend.dto.Address;
import com.yalu.shoppingbackend.dto.Cart;
import com.yalu.shoppingbackend.dto.User;

public interface UserDAO {
	// user related operation
	User getByEmail(String email);

	User get(int id);

	boolean addUser(User user);

	// adding and updating a new address
	Address getAddress(int addressId);

	boolean addAddress(Address address);

	boolean updateAddress(Address address);

	Address getBillingAddress(int userId);

	List<Address> listShippingAddresses(int userId);
	
	boolean addCart(Cart cart);	
}
