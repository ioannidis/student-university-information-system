package com.javaparttwo.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.javaparttwo.model.Course;
import com.javaparttwo.service.AuthService;
import com.javaparttwo.service.CourseService;

/**
 * Handles secretary requests and responses.
 */
@WebServlet({ "/secretary" })
public class SecretaryServlet extends HttpServlet {

    /**
     * Java related serial version UID.
     */
    private static final long serialVersionUID = 1L;

    /**
     * An instance of the database connection.
     */
    @Resource(name = "jdbc/javapart2")
    private DataSource ds;

    /**
     * Handles all GET requests.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	AuthService auth = new AuthService(request.getSession());

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
     * Handles all POST requests.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	doGet(request, response);
    }

}
