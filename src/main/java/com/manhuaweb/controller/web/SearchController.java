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

@WebServlet(urlPatterns = {"/search"})
public class SearchController extends HttpServlet {
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	@Inject
	private INewService newService;

	@Inject
	private ICategoryService categoryService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		
		NewModel model = FormUtil.toModel(NewModel.class, request);
		model.setListResult(newService.findByName(model.getName()));
		request.setAttribute("model", model);
		
		CategoryModel modelCat = FormUtil.toModel(CategoryModel.class, request);
		modelCat.setListResult(categoryService.findAll());
		request.setAttribute("modelCat", modelCat);
		
		view = "/views/web/new/search.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
