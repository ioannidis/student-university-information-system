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
import com.javaparttwo.service.ProfessorService;

@WebServlet({ "/CourseServlet", "/courses" })
public class CourseServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/javapart2")
	private DataSource ds;
	
    public CourseServlet() {
    	//
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		CourseService courseService = new CourseService(ds);
		String id = getParameterOrDefault(request, "id", "");
		String action = getParameterOrDefault(request, "action", "all");
		
		switch(action) {
			case "show": {
				Course course = courseService.getCourse(id);
				request.setAttribute("course", course);
				request.getRequestDispatcher("WEB-INF/views/course/course.jsp").forward(request, response);
				break;
			}
			case "edit": {
				ProfessorService professorService = new ProfessorService(ds);
				Course course = courseService.getCourse(id);
				
				request.setAttribute("course", course);
				request.setAttribute("instructors", professorService.getProfessors());
				request.getRequestDispatcher("WEB-INF/views/course/edit.jsp").forward(request, response);
				break;
			}
			case "delete": {
				courseService.deleteCourse(id);
				response.sendRedirect("courses");
				break;
			}
			default: {
				List<Course> courses = courseService.getCourses();
				request.setAttribute("courses", courses);
				request.getRequestDispatcher("WEB-INF/views/course/courses.jsp").forward(request, response);
				break;
			}
		}
	}

	private String getParameterOrDefault(HttpServletRequest request, String name, String def) {
		return request.getParameter(name) == null ? def : request.getParameter(name);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService courseService = new CourseService(ds);
		String id = getParameterOrDefault(request, "id", "");
		String action = getParameterOrDefault(request, "action", "");

		switch (action) {
			case "edit": {
				Course course = courseService.getCourse(id);
				courseService.editCourse(
						id,
						getParameterOrDefault(request, "title", course.getTitle()),
						getParameterOrDefault(request, "ects", Integer.toString(course.getEcts())),
						getParameterOrDefault(request, "teachingHours", Integer.toString(course.getTeachingHours())),
						getParameterOrDefault(request, "teachingInstructor", course.getInstructorUsername()));
				response.sendRedirect("courses");
				break;
			}
			default: {
				doGet(request, response);
				break;
			}
		}
	}
}
