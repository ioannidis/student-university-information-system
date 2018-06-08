package com.javaparttwo.model;

import java.util.List;

public class CourseStudentGrades extends Course {

    private List<User> pendingStudents;
    private List<GradedStudent> gradedStudents;

    public CourseStudentGrades(String courseId, String title, int ects, int teachingHours, String instructorUsername,
	    int semester, String department, List<User> pendingStudents, List<GradedStudent> gradedStudents) {
	super(courseId, title, ects, teachingHours, instructorUsername, semester, department);

	this.pendingStudents = pendingStudents;
	this.gradedStudents = gradedStudents;
    }

    public List<User> getPendingStudents() {
	return pendingStudents;
    }

    public List<GradedStudent> getGradedStudents() {
	return gradedStudents;
    }
}
