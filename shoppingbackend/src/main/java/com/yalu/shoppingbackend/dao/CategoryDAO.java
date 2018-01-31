package com.yalu.shoppingbackend.dao;

import java.util.List;

import com.yalu.shoppingbackend.dto.Category;

public interface CategoryDAO {
	
	boolean add(Category category);
	List<Category> list();
	Category get(int id);
}
