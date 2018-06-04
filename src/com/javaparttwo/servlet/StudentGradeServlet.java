package com.javaparttwo.servlet;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.javaparttwo.model.Course;
import com.javaparttwo.model.Grade;
import com.javaparttwo.model.User;
import com.javaparttwo.service.AuthService;
import com.javaparttwo.service.CourseService;
import com.javaparttwo.service.GradeService;
import com.javaparttwo.service.ProfessorService;

/**
 * Servlet implementation class GradeServlet
 */
@WebServlet({ "/StudentGradeServlet", "/studentgrades"})
public class StudentGradeServlet extends HttpServlet {
	/**
     * An instance of the database connection.
     */
	private static final long serialVersionUID = 1L;
	
	 /**
     * An instance of the database connection.
     */
    @Resource(name = "jdbc/javapart2")
    private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthService authService = new AuthService(request.getSession());

    	if (!authService.isLoggedIn()) {
    	    response.sendRedirect("login");
    	    return;
    	}

    	if (!authService.hasRole("student")) {
    	    response.sendError(HttpServletResponse.SC_FORBIDDEN);
    	    return;
    	}
    	
    	User user = authService.getUser();
    	
    	GradeService gradeService = new GradeService(ds);
    	String sortBy = getParameterOrDefault(request, "sortBy", "lesson");
    	String courseId = getParameterOrDefault(request, "courseId", null);
    	
    	if (courseId != null) {
    		CourseService courseService = new CourseService(ds);
    		Course course = courseService.getCourse(courseId);
    		
    		if (course == null) {
    			response.sendError(HttpServletResponse.SC_FORBIDDEN);
    			return;
    		}
    		
    		if (!course.getDepartmentId().equals(user.getDepartmentId())) {
    			response.sendError(HttpServletResponse.SC_FORBIDDEN);
    			return;
    		}
    		
    		Grade grade = gradeService.getGrade(user.getUsername(), courseId);
    	    request.setAttribute("grade", grade);
    	    request.getRequestDispatcher("WEB-INF/views/grade/index.jsp").forward(request, response);
    	    return;
    	}
    	
    	switch (sortBy) {
	    	case "semester": {
	    	   
	    	    //request.setAttribute("course", course);
	    	    request.getRequestDispatcher("WEB-INF/views/grade/index.jsp").forward(request, response);
	    	    break;
	    	}
	    	case "average": {
	    	   	
	    	    ProfessorService professorService = new ProfessorService(ds);
	
	    	    //request.setAttribute("course", course);
	    	    request.setAttribute("instructors", professorService.getProfessors());
	    	    request.getRequestDispatcher("WEB-INF/views/grade/index.jsp").forward(request, response);
	    	    break;
	    	}
	    	case "course":
	    	default: {
	    	    
	    	    break;
	    	}
    	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
     * Returns a default value if the parameter on the request is null.
     * 
     * @param request
     *            The current request.
     * @param name
     *            The name of the parameter to fetch.
     * @param def
     *            The default value to return if the parameter is null.
     * @return A default value or the parameter.
     */
    private String getParameterOrDefault(HttpServletRequest request, String name, String def) {
    	return request.getParameter(name) == null ? def : request.getParameter(name);
    }

}
