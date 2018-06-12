package com.javaparttwo.service;

import javax.servlet.http.HttpSession;
import com.javaparttwo.model.User;

/**
 * Handles user authentication.
 */
public class AuthService {

    /**
     * The HTTP session for a request.
     */
    private HttpSession session;

    /**
     * Initializes auth service.
     * 
     * @param session The session for a request.
     */
    public AuthService(HttpSession session) {
        this.session = session;
    }

    /**
     * Checks if the user is logged in.
     * 
     * @return Whether the user is logged in.
     */
    public boolean isLoggedIn() {
        if (session.getAttribute("loggedIn") != null)
            return (boolean) session.getAttribute("loggedIn");
        return false;
    }

    /**
     * Checks if the user has a specific role.
     * 
     * @param role A specific role that the user should have.
     * @return If the user has the specific role.
     */
    public boolean hasRole(String role) {
        if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getRoleId().equals(role))
                return true;
        }
        return false;
    }

    public User getUser() {
        return (session.getAttribute("user") != null) ? (User) session.getAttribute("user") : null;
    }

}
