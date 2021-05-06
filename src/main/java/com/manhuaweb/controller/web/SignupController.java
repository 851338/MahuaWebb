package com.manhuaweb.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manhuaweb.constant.SystemConstant;
import com.manhuaweb.model.UserModel;
import com.manhuaweb.utils.HttpUtil;
import com.manhuaweb.utils.MessageUtil;

@WebServlet(urlPatterns = { "/fafldajflad" })
public class SignupController extends HttpServlet {

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserModel model = HttpUtil.of(request.getReader()).toModel(UserModel.class);
		String view = "";
		
		view = "/views/signup.jsp";
		MessageUtil.showMessage(request);
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
