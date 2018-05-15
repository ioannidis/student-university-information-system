package com.javaparttwo.servlet;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.javaparttwo.model.Course;
import com.javaparttwo.service.CourseService;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet({ "/CourseServlet", "/courses" })
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/javapart2")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseServlet() {
    	//
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CourseService courseService  = new CourseService(ds);
		
		String id = (request.getParameter("id") == null) ? "" : request.getParameter("id");
		String action = (request.getParameter("action") == null) ? "all" : request.getParameter("action");
		
		switch(action) {
			case "show": {
				Course course = courseService.getCourse(id);
				System.out.println(course);
				request.setAttribute("course", course);
				request.getRequestDispatcher("WEB-INF/views/course/course.jsp").forward(request, response);
				break;
			}
			case "edit": {
				Course course = courseService.getCourse(id);
				System.out.println(course);
				break;
			}
			case "delete": {
				courseService.deleteCourse(id);
				response.sendRedirect("courses");
				break;
			}
			case "all":
			default: {
				List<Course> courses = courseService.getCourses();
				System.out.println(courses);
				request.setAttribute("courses", courses);
				request.getRequestDispatcher("WEB-INF/views/course/courses.jsp").forward(request, response);
				break;
			}
		}
	
		
		System.out.println(id + " " + action);
		
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
