package com.yalu.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yalu.shoppingbackend.dao.CategoryDAO;
import com.yalu.shoppingbackend.dto.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
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
		String selectActiveCategories ="FROM Category WHERE active = :active";
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategories);
		query.setParameter("active", true);
		return query.getResultList();
	}

	@Override
	public Category get(int id) {
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}

	@Override
	public boolean add(Category category) {
		try {
			sessionFactory.getCurrentSession().persist(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Category category) {
		
		//don't delete just deactivate
		category.setActive(false);
		
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean update(Category category) {
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
