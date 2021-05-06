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
import com.manhuaweb.model.CommentModel;
import com.manhuaweb.model.NewModel;
import com.manhuaweb.service.ICategoryService;
import com.manhuaweb.service.ICommentService;
import com.manhuaweb.service.INewService;
import com.manhuaweb.utils.FormUtil;

@WebServlet(urlPatterns = {"/story"})
public class NewController extends HttpServlet {
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	@Inject
	private INewService newService;

	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private ICommentService commentService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "";
		CategoryModel modelCat = FormUtil.toModel(CategoryModel.class, request);
		modelCat.setListResult(categoryService.findAll());
		request.setAttribute("modelCat", modelCat);
		
		NewModel model = FormUtil.toModel(NewModel.class, request);
		CommentModel comment = FormUtil.toModel(CommentModel.class, request);
		comment.setListResult(commentService.findByNewId(model.getId()));
		request.setAttribute("comment", comment);
		
		model = newService.findOne(model.getId());
		model.setRating(model.getRating()+1L);
		newService.updateRating(model);
		request.setAttribute("model", model);
		view = "/views/web/new/story.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
