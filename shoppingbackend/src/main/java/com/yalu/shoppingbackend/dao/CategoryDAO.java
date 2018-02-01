package com.yalu.shoppingbackend.dao;

import java.util.List;

import com.yalu.shoppingbackend.dto.Category;

public interface CategoryDAO {
		
	List<Category> list();
	Category get(int id);
	boolean add(Category category);
	boolean delete(Category category);
	boolean update(Category category);
	
}
