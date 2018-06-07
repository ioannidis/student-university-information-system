package com.javaparttwo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/ProfessorGradeStudentsServlet", "/instructor/grade", "/professor/grade" })
public class ProfessorGradeStudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProfessorGradeStudentsServlet() {
	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    }
}
