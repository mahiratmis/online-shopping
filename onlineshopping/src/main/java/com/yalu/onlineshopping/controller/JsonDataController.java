package com.yalu.onlineshopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yalu.shoppingbackend.dao.ProductDAO;
import com.yalu.shoppingbackend.dto.Product;

@Controller
@RequestMapping(value = "/json/data")
public class JsonDataController {
	
	@Autowired 
	private ProductDAO produtDAO;

	@RequestMapping(value = "/all/products")
	@ResponseBody //look for an object to json convertor
	public List<Product> getAllProducts() {
		return produtDAO.listActiveProducts();
	}
	
	@RequestMapping(value = "/category/{categoryId}/products")
	@ResponseBody //look for an object to json convertor
	public List<Product> listProductsByCategory(
			@PathVariable int categoryId) {
		return produtDAO.listActiveProductsByCategory(categoryId);
	}	

}
