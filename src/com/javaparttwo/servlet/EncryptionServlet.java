package com.javaparttwo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jasypt.util.password.StrongPasswordEncryptor;

/**
 * This is a test servlet to encrypt passwords.
 */
@WebServlet({"/EncryptionServlet", "/encryption"})
public class EncryptionServlet extends HttpServlet {
    
    /**
     * Java related serial version UID.
     */
    private static final long serialVersionUID = 1L;

    /**
     * An instance of the strong password encryptor class.
     */
    private StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();

    /**
     * Handles all GET requests.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String input = request.getParameter("password");
        String output = encryptor.encryptPassword(input);

        response.getWriter().append(output);
    }
}
