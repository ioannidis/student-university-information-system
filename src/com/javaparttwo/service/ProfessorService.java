package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.javaparttwo.model.User;

/**
 * Handles all professor database interactions.
 */
public class ProfessorService {

    /**
     * An instance of the database connection.
     */
    private DataSource ds;

    /**
     * Initializes professor service.
     * 
     * @param ds
     *            The data source instance.
     */
    public ProfessorService(DataSource ds) {
	this.ds = ds;
    }

    /**
     * Returns the list of registered professors.
     * 
     * @return The list of professors.
     */
    public List<User> getProfessors() {
	List<User> professors = new ArrayList<>();

	Connection con = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;

	try {
	    con = ds.getConnection();
	    stmt = con.prepareStatement("SELECT * FROM javapart2.users WHERE role_id='instructor'");
	    rs = stmt.executeQuery();

	    while (rs.next()) {
		professors.add(
			new User(rs.getString("username"), null, rs.getString("first_name"), rs.getString("last_name"),
				rs.getLong("phone_number"), rs.getString("email"), rs.getString("role_id")));
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    try {
		con.close();
		rs.close();
		stmt.close();
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return professors;
    }
}
