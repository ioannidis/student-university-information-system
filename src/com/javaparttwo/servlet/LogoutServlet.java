package com.javaparttwo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaparttwo.service.AuthService;

/**
 * Handles logout requests and responses.
 */
@WebServlet({ "/LogoutServlet", "/logout" })
public class LogoutServlet extends HttpServlet {
    
    /**
     * Java related serial version UID.
     */
    private static final long serialVersionUID = 1L;

    /**
     * Handles all GET requests.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	AuthService auth = new AuthService(request, response);

	if (auth.isLoggedIn()) {
	    HttpSession session = request.getSession();
	    session.setAttribute("loggedIn", false);
	    session.setAttribute("user", null);
	}

	response.sendRedirect("login");
    }

    /**
     * Handles all POST requests.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	doGet(request, response);
    }
}
