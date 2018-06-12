package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import com.javaparttwo.model.User;

/**
 * Handles user related queries.
 */
public class UserService {

    /**
     * An instance of the database connection.
     */
    private DataSource ds;

    /**
     * Initializes user service.
     * 
     * @param ds The data source instance.
     */
    public UserService(DataSource ds) {
        this.ds = ds;
    }

    /**
     * Returns a new user object by their username.
     * 
     * @param username The username of the user.
     * @return A new user object.
     */
    public User getFromUsername(String username) {

        String query = "select * from users where username = ?";

        try (   Connection con = ds.getConnection();
                PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    return new User(
                            rs.getString("username"),
                            null,
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getLong("phone_number"),
                            rs.getString("email"),
                            rs.getString("role_id"),
                            rs.getString("department_id"));

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
