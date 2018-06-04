package com.javaparttwo.model;

public class Grade extends Course{
	
	private int grade;

	public Grade(String courseId, String title, int ects, int teachingHours, String instructorUsername, int grade, int semester, String departmentId) {
		super(courseId, title, ects, teachingHours, instructorUsername, semester, departmentId);
		
		this.grade = grade;
	}
	
	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

}
