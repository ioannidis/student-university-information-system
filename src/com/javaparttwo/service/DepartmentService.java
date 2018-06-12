package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

/**
 * Handles all department related queries.
 */
public class DepartmentService {

    /**
     * An instance of the database connection.
     */
    private DataSource ds;

    /**
     * Initializes the department service.
     * 
     * @param ds The data source instance.
     */
    public DepartmentService(DataSource ds) {
        this.ds = ds;
    }

    /**
     * Gets the department name by it's ID.
     * 
     * @param departmentId The department id.
     * @return The department name.
     */
    public String getDepartment(String departmentId) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        String department = null;

        String str = "SELECT * FROM javapart2.departments WHERE id=?";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, departmentId);


            rs = stmt.executeQuery();

            while (rs.next()) {
                department = rs.getString("title");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        return department;
    }

}
