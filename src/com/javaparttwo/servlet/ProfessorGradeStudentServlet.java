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
import com.javaparttwo.service.CourseService;
import com.javaparttwo.service.GradeService;
import com.javaparttwo.service.UserService;

@WebServlet({ "/ProfessorAssignGradeServlet", "/gradestudent" })
public class ProfessorGradeStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/javapart2")
    private DataSource ds;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	String username = request.getParameter("username");
	String courseId = request.getParameter("course_id");

	if (username == null || courseId == null) {
	    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	    return;
	}

	UserService userService = new UserService(ds);
	CourseService courseService = new CourseService(ds);
	GradeService gradeService = new GradeService(ds);

	User student = userService.getFromUsername(username);
	Course course = courseService.getCourse(courseId);

	request.setAttribute("student", student);
	request.setAttribute("course", course);
	request.setAttribute("username", username);
	request.setAttribute("courseId", courseId);

	Grade grade = gradeService.getGrade(username, courseId);

	if (grade != null) {
	    request.setAttribute("grade", gradeService.getGrade(username, courseId).getGrade());
	} else {
	    request.setAttribute("grade", "");
	}

	request.getRequestDispatcher("WEB-INF/views/professor/grade-student.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	String username = request.getParameter("username");
	String courseId = request.getParameter("course_id");
	int grade = Integer.parseInt(request.getParameter("grade"));

	GradeService gradeService = new GradeService(ds);
	gradeService.updateGrade(username, courseId, grade);

	response.sendRedirect("gradestudents?course_id=" + courseId);
    }

}
