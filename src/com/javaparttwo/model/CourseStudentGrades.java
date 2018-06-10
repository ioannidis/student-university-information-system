package com.javaparttwo.model;

import java.util.List;

public class CourseStudentGrades extends Course {

    private List<GradedStudent> students;
    private String status;

    public CourseStudentGrades(String courseId, String title, int ects, int teachingHours, String instructorUsername,
	    int semester, String department, List<GradedStudent> students, String status) {
    	super(courseId, title, ects, teachingHours, instructorUsername, semester, department);

		this.students = students;
		this.status = status;
	
    }

    public List<GradedStudent> getStudents() {
    	return students;
    }
    
    public String getStatus() {
    	return status;
    }
}
