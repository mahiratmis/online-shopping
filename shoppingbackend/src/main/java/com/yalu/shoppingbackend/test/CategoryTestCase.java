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
	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.yalu.shoppingbackend");
		context.refresh();
		
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	}
	
	@Test
	public void testAddCategory() {
		Category ct = new Category();
		ct.setName("TV");
		ct.setDescription("13 inches multicolor");
		ct.setImageURL("CAT_1.png");
		
		assertEquals("Succesfully Added", true, categoryDAO.add(ct));		
	}
}
