package com.javaparttwo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.StrongPasswordEncryptor;

@WebServlet({ "/EncryptionServlet", "/encryption" })
public class EncryptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	String input = request.getParameter("password");
	String output = encryptor.encryptPassword(input);
	
	response.getWriter().append(output);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	doGet(request, response);
    }

}
