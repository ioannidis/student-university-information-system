package com.javaparttwo.servlet;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.javaparttwo.service.AuthService;
import com.javaparttwo.service.CourseService;
import com.javaparttwo.service.ProfessorService;

@WebServlet({ "/ProfessorGradeStudentsServlet", "/gradestudents" })
public class ProfessorGradeStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/javapart2")
    private DataSource ds;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	AuthService auth = new AuthService(request.getSession());

	if (!auth.isLoggedIn()) {
	    response.sendRedirect("login");
	    return;
	}

	if (!auth.hasRole("instructor")) {
	    response.sendError(HttpServletResponse.SC_FORBIDDEN);
	    return;
	}

	String courseId = request.getParameter("course_id");

	CourseService courseService = new CourseService(ds);
	ProfessorService service = new ProfessorService(ds);

	if (courseId == null) {
	    request.setAttribute("courses", service.getCoursesWithStudentAndGrades(courseService, auth.getUser().getUsername()));
	    request.getRequestDispatcher("WEB-INF/views/professor/grade-students.jsp").forward(request, response);
	} else {
	    request.setAttribute("pendingCourse", service.getCourseWithStudentsAndGrades(courseService, courseId, "pending"));
	    request.setAttribute("gradedCourse", service.getCourseWithStudentsAndGrades(courseService, courseId, "graded"));
	    request.getRequestDispatcher("WEB-INF/views/professor/grade-course-students.jsp").forward(request, response);
	}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    }
}
