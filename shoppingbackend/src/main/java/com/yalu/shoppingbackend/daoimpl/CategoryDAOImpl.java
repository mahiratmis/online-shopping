package com.yalu.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.yalu.shoppingbackend.dao.CategoryDAO;
import com.yalu.shoppingbackend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	private static List<Category> categories = new ArrayList<>();

	static {
		Category ct = new Category();
		ct.setId(1);
		ct.setName("TV");
		ct.setDescription("13 inches multicolor");
		ct.setImageURL("CAT_1.png");		
		categories.add(ct);
		
		ct = new Category();
		ct.setId(2);
		ct.setName("Tablet");
		ct.setDescription("Tablets with highest quality");
		ct.setImageURL("CAT_2.png");		
		categories.add(ct);
		
		ct = new Category();
		ct.setId(3);
		ct.setName("Furnitures");
		ct.setDescription("Furnitures with highest quality");
		ct.setImageURL("CAT_3.png");		
		categories.add(ct);				
		
	}
	
	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categories;
	}

	@Override
	public Category get(int id) {
		for (Category category : categories){
			if (category.getId() == id) {
				return category;
			}
		}
		return null;
	}

}
