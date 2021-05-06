package com.manhuaweb.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.manhuaweb.model.CategoryModel;
import com.manhuaweb.model.NewModel;
import com.manhuaweb.model.UserModel;
import com.manhuaweb.service.ICategoryService;
import com.manhuaweb.service.INewService;
import com.manhuaweb.service.IUserService;
import com.manhuaweb.utils.FormUtil;
import com.manhuaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/trang-chu", "/dang-nhap", "/dang-ky", "/thoat" })
public class HomeController extends HttpServlet {

	@Inject
	private ICategoryService categoryService;

	@Inject
	private IUserService userService;

	@Inject
	private INewService newService;

	private static final long serialVersionUID = 2686801510274002166L;

	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			String alert = request.getParameter("alert");
			String message = request.getParameter("message");
			if (message != null && alert != null) {
				request.setAttribute("message", resourceBundle.getString(message));
				request.setAttribute("alert", alert);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		} else if (action != null && action.equals("logout")) {
			request.getSession().setAttribute("admin", " ");
			SessionUtil.getInstance().removeValue(request, "USERMODEL");
			response.sendRedirect(request.getContextPath() + "/trang-chu");
		} else if (action != null && action.equals("signup")) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/signup.jsp");
			rd.forward(request, response);
		} else {
			String view = "";
			
			//hot
			NewModel model = FormUtil.toModel(NewModel.class, request);
			model.setListResult(newService.findAllBxh()); 
			request.setAttribute("hotmodel", model);
			
			//update
			CategoryModel modelCat = FormUtil.toModel(CategoryModel.class, request);
			NewModel update1 = new NewModel();
			update1.setListResult(newService.findAllNewAndCat());
			request.setAttribute("update", update1);

			//theloai
			modelCat.setListResult(categoryService.findAll());
			request.setAttribute("modelCat", modelCat);
			NewModel model1 = new NewModel();
			model1.setListResult(newService.findByCategoryId(1L));
			request.setAttribute("model1", model1);

			NewModel model2 = FormUtil.toModel(NewModel.class, request);
			model2.setListResult(newService.findByCategoryId(2L));
			request.setAttribute("model2", model2);

			NewModel model3 = FormUtil.toModel(NewModel.class, request);
			model3.setListResult(newService.findByCategoryId(3L));
			request.setAttribute("model3", model3);

			NewModel model4 = FormUtil.toModel(NewModel.class, request);
			model4.setListResult(newService.findByCategoryId(4L));
			request.setAttribute("model4", model4);

			NewModel model5 = FormUtil.toModel(NewModel.class, request);
			model5.setListResult(newService.findByCategoryId(5L));
			request.setAttribute("model5", model5);

			NewModel model6 = FormUtil.toModel(NewModel.class, request);
			model6.setListResult(newService.findByCategoryId(6L));
			request.setAttribute("model6", model6);

			NewModel model7 = FormUtil.toModel(NewModel.class, request);
			model7.setListResult(newService.findByCategoryId(7L));
			request.setAttribute("model7", model7);

			NewModel model8 = FormUtil.toModel(NewModel.class, request);
			model8.setListResult(newService.findByCategoryId(8L));
			request.setAttribute("model8", model8);

			view = "/views/web/home.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			UserModel model = FormUtil.toModel(UserModel.class, request);
			// model =
			// userService.findByUserNameAndPasswordAndStatus(model.getUserName(),
			// model.getPassword(), 1);
			UserModel modelDB = userService.findUsername(model.getUserName());
			HttpSession session = request.getSession();
			if (modelDB != null && BCrypt.checkpw(model.getPassword(), modelDB.getPassword())) {
				SessionUtil.getInstance().putValue(request, "USERMODEL", modelDB);
				if (modelDB.getRole().getCode().equals("USER")) {
					response.sendRedirect(request.getContextPath() + "/trang-chu");
				} else if (modelDB.getRole().getCode().equals("ADMIN")) {
					session.setAttribute("admin", "ADMIN");
					response.sendRedirect(request.getContextPath() + "/admin-home");
				}

			} else {
				response.sendRedirect(request.getContextPath()
						+ "/dang-nhap?action=login&message=username_password_invalid&alert=danger");
			}
		} /*else if(action != null && action.equals("signup")){
			response.sendRedirect(request.getContextPath()
					+ "/dang-nhap?action=login");
		}*/
	}
}
