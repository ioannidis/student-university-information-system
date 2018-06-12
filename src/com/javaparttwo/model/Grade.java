package com.javaparttwo.model;

/**
 * Represents the grades of this application.
 */
public class Grade extends Course {

    /**
     * The grade of the student.
     */
    private int grade;

    /**
     * 
     * Initializes all details.
     *
     * @param courseId The id of this course.
     * @param title The title of this course.
     * @param semester The semester in which this course belongs to.
     * @param ects The ETCS of this course.
     * @param teachingHours The teaching hours of this course.
     * @param instructorUsername The instructor of this course.
     * @param departmentId The department in which the course belongs to.
     * @param grade The grade of the student.
     */
    public Grade(String courseId, String title, int ects, int teachingHours,
            String instructorUsername, int grade, int semester, String departmentId) {
        super(courseId, title, ects, teachingHours, instructorUsername, semester, departmentId);

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

    /**
     * Sets the grade of the student.
     * 
     * @param grade The new grade of the student.
     */
    public void setGrade(int grade) {
        this.grade = grade;
    }

}
