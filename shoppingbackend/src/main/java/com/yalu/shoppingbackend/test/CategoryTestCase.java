package com.yalu.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.yalu.shoppingbackend.dao.CategoryDAO;
import com.yalu.shoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.yalu.shoppingbackend");
		context.refresh();

		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

	@Test
	public void testCRUDOperations() {
		// ADD
		Category category = new Category();
		category.setName("Appliences");
		category.setDescription("13 inches multicolor");
		category.setImageURL("CAT_1.png");

		assertEquals("Succesfully Added", true, categoryDAO.add(category));

		// retrieve category with id 3
		category = categoryDAO.get(3);

		// update that category
		category.setName("TiViBuu");
		assertEquals("Succesfully updated a single category", true, categoryDAO.update(category));

		// delete the category
		assertEquals("Succesfully deleted a single category", true, categoryDAO.delete(category));

		// fetch all categories after deletion operation
		assertEquals("Succesfully retrieved all active categories", 4, categoryDAO.list().size());
	}
}
