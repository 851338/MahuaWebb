package com.manhuaweb.controller.web.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.manhuaweb.model.CommentModel;
import com.manhuaweb.model.UserModel;
import com.manhuaweb.service.ICommentService;
import com.manhuaweb.utils.HttpUtil;
import com.manhuaweb.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-story"})
public class CommentAPI extends HttpServlet {
	
	@Inject
	private ICommentService commentService;

	private static final long serialVersionUID = -915988021506484384L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CommentModel commentModel =  HttpUtil.of(request.getReader()).toModel(CommentModel.class);
		commentModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		commentModel.setUserId(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getId());
		//Postman 
//		commentModel.setCreatedBy("");
//		commentModel.setUserId(9L);
//		commentModel.setNewId(9L);
		commentService.save(commentModel);
		mapper.writeValue(response.getOutputStream(), commentModel);
	}
}
