package com.manhuaweb.controller.web.api;

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

@WebServlet(urlPatterns = {"/api-signup"})
public class SignUpAPI extends HttpServlet {
	@Inject
	private IUserService userService;

	private static final long serialVersionUID = -915987021506484384L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		UserModel userModel =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
		if(userService.checkUsername(userModel)==true){
			userModel = userService.save(userModel);
			mapper.writeValue(response.getOutputStream(), userModel);
		}
//			response.sendRedirect(request.getContextPath()
//					+ "/dang-nhap?action=login&message=signup_successful&alert=success");
//		} else {
//				response.sendRedirect(request.getContextPath()
//						+ "/dang-nhap?action=login&message=signup_successful&alert=success");
//		}
//		userService.save(userModel);
	}
}
