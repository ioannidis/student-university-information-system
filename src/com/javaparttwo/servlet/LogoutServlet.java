package com.javaparttwo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaparttwo.service.AuthService;

@WebServlet({ "/LogoutServlet", "/logout" })
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthService auth = new AuthService(request, response);
		
		if (auth.isLoggedIn()) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedIn", false);
			session.setAttribute("user", null);
		}
		
		response.sendRedirect("login");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
