package com.javaparttwo.servlet;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.jasypt.util.password.StrongPasswordEncryptor;
import com.javaparttwo.model.User;
import com.javaparttwo.service.AuthService;
import com.javaparttwo.service.LoginService;

/**
 * Handles login requests and responses.
 */
@WebServlet({"/LoginServlet", "/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Java related serial version UID.
     */
    private static final long serialVersionUID = 1L;

    private StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();

    /**
     * An instance of the database connection.
     */
    @Resource(name = "jdbc/javapart3")
    private DataSource ds;

    /**
     * Handles all GET requests.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AuthService auth = new AuthService(request.getSession());
        HttpSession session = request.getSession();

        if (auth.isLoggedIn()) {
            User user = (User) session.getAttribute("user");
            response.sendRedirect(user.getRoleId());
        } else {
            request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request, response);
        }

    }

    /**
     * Handles all POST requests.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LoginService login = new LoginService(ds);
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = login.auth(username);

        if (user != null && encryptor.checkPassword(password, user.getPassword())) {
            session = request.getSession();
            session.setAttribute("loggedIn", true);
            session.setAttribute("user", user);

            response.sendRedirect(user.getRoleId());
        } else {
            response.sendRedirect("login");
        }
    }
}
