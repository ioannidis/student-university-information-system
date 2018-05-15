package com.javaparttwo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.javaparttwo.model.Course;
import com.javaparttwo.service.AuthService;
import com.javaparttwo.service.CourseService;

/**
 * Servlet implementation class SecretaryServlet
 */
@WebServlet({"/secretary" })
public class SecretaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/javapart2")
	private DataSource ds;
	
    /**
     * Default constructor. 
     */
    public SecretaryServlet() {
    	//
    }

	/**
	 * @see HttpServlet#doGet(HttpSeSrvletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AuthService auth = new AuthService(request, response);
		HttpSession session = request.getSession();
		
		if (!auth.isLoggedIn()) {
			response.sendRedirect("login");
			return;
		}
		
		if (!auth.hasRole("secretary")) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
				
		CourseService courseService = new CourseService(ds);
		
		List<Course> courses = new ArrayList<>();
		courses = courseService.getCourses();
		
		request.setAttribute("courses", courses);
		request.getRequestDispatcher("WEB-INF/views/secretary/secretary.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
