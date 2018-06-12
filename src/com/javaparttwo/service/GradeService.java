package com.javaparttwo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import com.javaparttwo.model.Grade;

public class GradeService {

    /**
     * An instance of the database connection.
     */
    private DataSource ds;

    /**
     * Initializes login service.
     * 
     * @param ds The data source instance.
     */
    public GradeService(DataSource ds) {
        this.ds = ds;
    }

    /**
     * Returns a grade object by student and course ID.
     * 
     * @param stdId The student ID (username).
     * @param courseId The course ID.
     * @return A new grade object.
     */
    public Grade getGrade(String stdId, String courseId) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        String str =
                "SELECT c.id, c.title, c.ects, c.teaching_hours, c.semester, c.department_id, u.first_name, u.last_name, g.grade "
                        + "FROM javapart2.grades AS g "
                        + "RIGHT JOIN javapart2.courses AS c ON g.course_id = c.id "
                        + "INNER JOIN javapart2.users AS u ON c.instructor_username = u.username "
                        + "WHERE g.student_id=? AND g.course_id=?";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, stdId);
            stmt.setString(2, courseId);

            rs = stmt.executeQuery();

            String fullname;
            if (rs.next()) {
                fullname = rs.getString("first_name") + " " + rs.getString("last_name");
                return new Grade(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getInt("ects"),
                        rs.getInt("teaching_hours"),
                        fullname,
                        rs.getInt("grade"),
                        rs.getInt("semester"),
                        rs.getString("department_id"));
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

        return null;
    }

    /**
     * Updates the grade of a student.
     * 
     * @param stdId The student ID (username).
     * @param courseId The course ID.
     * @param grade The new grade.
     */
    public void updateGrade(String stdId, String courseId, int grade) {
        String query1 = "delete from grades where student_id = ? and course_id = ?";
        String query2 = "insert into grades values (?, ?, ?)";

        try (   Connection con = ds.getConnection();
                PreparedStatement stmt1 = con.prepareStatement(query1);
                PreparedStatement stmt2 = con.prepareStatement(query2)) {

            stmt1.setString(1, stdId);
            stmt1.setString(2, courseId);

            stmt2.setString(1, stdId);
            stmt2.setString(2, courseId);
            stmt2.setInt(3, grade);

            stmt1.executeUpdate();
            stmt2.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns the average grade by the student ID.
     * 
     * @param stdId The student ID (username).
     * @return The average grade of the student.
     */
    public String getAverage(String stdId) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        String avg = null;

        String str =
                "SELECT AVG(javapart2.grades.grade) AS average FROM javapart2.grades WHERE student_id=? AND javapart2.grades.grade >= 5";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, stdId);

            rs = stmt.executeQuery();

            if (rs.next()) {
                avg = (String) rs.getString("average");
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

        return avg;
    }

    /**
     * Returns the list of grades for the average view.
     * 
     * @param stdId The student ID (username).
     * @param departmentId The department ID.
     * @return A list of grades for the average view.
     */
    public List<Grade> getGradesByAverage(String stdId, String departmentId) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        List<Grade> grades = new ArrayList<>();

        String str =
                "SELECT * FROM javapart2.grades RIGHT JOIN javapart2.courses ON javapart2.grades.course_id = javapart2.courses.id AND student_id=? WHERE javapart2.courses.department_id=? AND javapart2.grades.grade IS NOT NULL ORDER BY javapart2.courses.title ASC;";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, stdId);
            stmt.setString(2, departmentId);

            rs = stmt.executeQuery();

            while (rs.next()) {
                grades.add(new Grade(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getInt("ects"),
                        rs.getInt("teaching_hours"),
                        rs.getString("instructor_username"),
                        rs.getInt("grade"),
                        rs.getInt("semester"),
                        rs.getString("department_id")));
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

        return grades;
    }

    /**
     * Returns the list of grades for the list view.
     * 
     * @param stdId The student ID (username).
     * @param departmentId The department ID.
     * @return A list of grades for the list view.
     */
    public List<Grade> getGradesByList(String stdId, String departmentId) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        List<Grade> grades = new ArrayList<>();

        String str =
                "SELECT * FROM javapart2.grades RIGHT JOIN javapart2.courses ON javapart2.grades.course_id = javapart2.courses.id AND student_id=? WHERE javapart2.courses.department_id=? ORDER BY javapart2.courses.title";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, stdId);
            stmt.setString(2, departmentId);

            rs = stmt.executeQuery();

            int grade;
            while (rs.next()) {
                grade = (rs.getObject("grade") != null) ? rs.getInt("grade") : -1;
                
                grades.add(new Grade(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getInt("ects"),
                        rs.getInt("teaching_hours"),
                        rs.getString("instructor_username"),
                        grade,
                        rs.getInt("semester"),
                        rs.getString("department_id")));
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

        return grades;
    }

    /**
     * Returns the list grades for the semester view.
     * 
     * @param stdId The student ID (username).
     * @param departmentId The department ID.
     * @return A list of grades for the semester view.
     */
    public List<Grade> getGradesBySemester(String stdId, String departmentId) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;

        List<Grade> grades = new ArrayList<>();

        String str =
                "SELECT * FROM javapart2.grades RIGHT JOIN javapart2.courses ON javapart2.grades.course_id = javapart2.courses.id AND student_id=? WHERE javapart2.courses.department_id=? ORDER BY javapart2.courses.semester, javapart2.courses.title";

        try {
            con = ds.getConnection();

            stmt = con.prepareStatement(str);
            stmt.setString(1, stdId);
            stmt.setString(2, departmentId);

            rs = stmt.executeQuery();

            int grade;
            while (rs.next()) {
                grade = (rs.getObject("grade") != null) ? rs.getInt("grade") : -1;
                grades.add(new Grade(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getInt("ects"),
                        rs.getInt("teaching_hours"),
                        rs.getString("instructor_username"),
                        grade,
                        rs.getInt("semester"),
                        rs.getString("department_id")));
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

        return grades;
    }

}
