package com.manhuaweb.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.manhuaweb.model.UserModel;
import com.manhuaweb.service.IUserService;
import com.manhuaweb.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-admin-user"})
public class UserAPI extends HttpServlet {
	
	@Inject
	private IUserService userService;

	private static final long serialVersionUID = -915988021506484384L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		ObjectMapper mapper = new ObjectMapper();
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		UserModel newModel =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
//		newModel = newService.save(newModel);
//		mapper.writeValue(response.getOutputStream(), newModel);
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		ObjectMapper mapper = new ObjectMapper();
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		NewModel updateNew =  HttpUtil.of(request.getReader()).toModel(NewModel.class);
//		updateNew.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
//		updateNew = newService.update(updateNew);
//		mapper.writeValue(response.getOutputStream(), updateNew);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
		userService.delete(userModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
