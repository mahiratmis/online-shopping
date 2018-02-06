package com.yalu.onlineshopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yalu.onlineshopping.util.FileUtil;
import com.yalu.onlineshopping.validator.ProductValidator;
import com.yalu.shoppingbackend.dao.CategoryDAO;
import com.yalu.shoppingbackend.dao.ProductDAO;
import com.yalu.shoppingbackend.dto.Category;
import com.yalu.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping("/products")
	public ModelAndView manageProducts(@RequestParam(name = "success", required = false) String success) {

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProducts", true);

		Product nProduct = new Product();
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		nProduct.setSupplierId(1);
		nProduct.setActive(true);

		mv.addObject("product", nProduct);

		if (success != null) {
			if (success.equals("product")) {
				mv.addObject("message", "Product submitted successfully!");
			} else if (success.equals("category")) {
				mv.addObject("message", "Category submitted successfully!");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results,
			Model model, HttpServletRequest request) {
		
		//check file type and existance
		new ProductValidator().validate(mProduct, results);		
		
		if(results.hasErrors()) {
			model.addAttribute("message", "Validation fails for adding the product!");
			model.addAttribute("title", "Manage Products");
			model.addAttribute("userClickManageProducts", true);
			return "page";
		}		

		logger.info(mProduct.toString());
		
		// edit check only when the file has been selected
		if(!mProduct.getFile().getOriginalFilename().equals("")) {
			FileUtil.uploadFile(request, mProduct.getFile(), mProduct.getCode());
		}
		
		
		if (mProduct.getId() == 0) {
			productDAO.add(mProduct);
		} else {
			productDAO.update(mProduct);
		}

		return "redirect:/manage/products?success=product";
	}

	@ModelAttribute("categories")
	public List<Category> modelCategories() {
		return categoryDAO.list();
	}

	@ModelAttribute("category")
	public Category modelCategory() {
		return new Category();
	}

}
