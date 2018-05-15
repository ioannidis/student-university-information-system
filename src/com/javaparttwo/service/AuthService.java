package com.javaparttwo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaparttwo.model.User;

public class AuthService {
	
	private HttpServletRequest request;
	
	private HttpServletResponse response;
	
	private HttpSession session;

	public AuthService(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();		
	}
	
	public boolean isLoggedIn() {
		if (session.getAttribute("loggedIn") != null)
			return (boolean) session.getAttribute("loggedIn");
		return false;
	}
	
	public boolean hasRole(String role) {
		if (session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			if (user.getRoleId().equals(role))
				return true;
		}
		return false;
	}

}
