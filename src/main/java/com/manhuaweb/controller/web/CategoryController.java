package com.manhuaweb.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manhuaweb.model.CategoryModel;
import com.manhuaweb.model.NewModel;
import com.manhuaweb.service.ICategoryService;
import com.manhuaweb.service.INewService;
import com.manhuaweb.utils.FormUtil;

@WebServlet(urlPatterns = {"/category-story"})
public class CategoryController extends HttpServlet {
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	@Inject
	private INewService newService;

	@Inject
	private ICategoryService categoryService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		CategoryModel modelCatList = FormUtil.toModel(CategoryModel.class, request);
		modelCatList.setListResult(categoryService.findAll());
		request.setAttribute("modelCat", modelCatList);
		NewModel model = FormUtil.toModel(NewModel.class, request);
		model.setListResult(newService.findByCategoryId(model.getId()));
		request.setAttribute("model", model);
		CategoryModel modelCatOne = FormUtil.toModel(CategoryModel.class, request);
		modelCatOne = categoryService.findOne(model.getId());
		request.setAttribute("modelCatOne", modelCatOne);
		view = "/views/web/new/storybycategory.jsp";
	RequestDispatcher rd = request.getRequestDispatcher(view);
	rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
