package com.javaparttwo.model;

/**
 * Represents a student that has been graded.
 */
public final class GradedStudent extends User {

    /**
     * The grade of the student.
     */
    private int grade;

    /**
     * Creates a new GradedStudent.
     * 
     * @param username The username of the user.
     * @param password The password of the user.
     * @param name The name of the user.
     * @param surname The surname of the user.
     * @param phoneNumber The phone number of the user.
     * @param email The email of the user.
     * @param roleId The role of the user.
     * @param department The department in which the user belongs to.
     * @param grade The grade of the student.
     */
    public GradedStudent(String username, String password, String name, String surname,
            long phoneNumber, String email, String roleId, String department, int grade) {
        super(username, password, name, surname, phoneNumber, email, roleId, department);

        this.grade = grade;
    }

    /**
     * Returns the grade of the student.
     * 
     * @return The grade of the student.
     */
    public int getGrade() {
        return grade;
    }
}
