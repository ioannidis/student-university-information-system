package com.javaparttwo.model;

import java.util.List;

public final class GradedCourse extends Course {

    private List<GradedStudent> gradedStudents;

    public GradedCourse(String courseId, String title, int ects, int teachingHours, String instructorUsername,
	    int semester, String department, List<GradedStudent> gradedStudents) {

	super(courseId, title, ects, teachingHours, instructorUsername, semester, department);

	this.gradedStudents = gradedStudents;
    }

    public List<GradedStudent> getGradedStudents() {
	return gradedStudents;
    }
}
