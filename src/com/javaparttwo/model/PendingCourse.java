package com.javaparttwo.model;

import java.util.List;

public final class PendingCourse extends Course {

    private List<User> pendingStudents;

    public PendingCourse(String courseId, String title, int ects, int teachingHours, String instructorUsername,
	    int semester, String department, List<User> pendingStudents) {

	super(courseId, title, ects, teachingHours, instructorUsername, semester, department);

	this.pendingStudents = pendingStudents;
    }

    public List<User> getPendingStudents() {
	return pendingStudents;
    }
}
