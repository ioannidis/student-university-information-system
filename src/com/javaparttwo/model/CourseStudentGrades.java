package com.javaparttwo.model;

import java.util.List;

/**
 * Represents a course with the list of graded students.
 */
public class CourseStudentGrades extends Course {

    /**
     * The list of graded students on this course.
     */
    private List<GradedStudent> students;

    /**
     * The status of the student list, can be "pending" or "graded".
     */
    private String status;

    /**
     * Initializes all course details.
     *
     * @param courseId The id of this course.
     * @param title The title of this course.
     * @param semester The semester in which this course belongs to.
     * @param ects The ETCS of this course.
     * @param teachingHours The teaching hours of this course.
     * @param instructorUsername The instructor of this course.
     * @param department The department in which the course belongs to.
     * @param students The list of graded students.
     * @param status The status of the student list.
     */
    public CourseStudentGrades(String courseId, String title, int ects, int teachingHours,
            String instructorUsername, int semester, String department,
            List<GradedStudent> students, String status) {
        super(courseId, title, ects, teachingHours, instructorUsername, semester, department);

        this.students = students;
        this.status = status;

    }

    /**
     * Returns the list of graded students.
     * 
     * @return The list of graded students.
     */
    public List<GradedStudent> getStudents() {
        return students;
    }

    /**
     * Returns the status of the student list.
     * 
     * @return Can be "pending" or "graded".
     */
    public String getStatus() {
        return status;
    }
}
