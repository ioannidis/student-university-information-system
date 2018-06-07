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
import com.javaparttwo.model.User;
import com.javaparttwo.service.CourseService;
import com.javaparttwo.service.UserService;

@WebServlet({ "/ProfessorAssignGradeServlet", "/assigngrade" })
public class ProfessorAssignGradeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/javapart2")
    private DataSource ds;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	String username = request.getParameter("username");
	String course_id = request.getParameter("course_id");

	if (username == null || course_id == null) {
	    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	}

	UserService userService = new UserService(ds);
	CourseService courseService = new CourseService(ds);

	User student = userService.getFromUsername(username);
	Course course = courseService.getCourse(course_id);

	request.setAttribute("student", student);
	request.setAttribute("course", course);
	request.getRequestDispatcher("WEB-INF/views/professor/assign-grade.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

    }

}
