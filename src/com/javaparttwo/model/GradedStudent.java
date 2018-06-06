package com.javaparttwo.model;

public final class GradedStudent {
    private String firstName, lastName;
    private int grade;

    public GradedStudent(String firstName, String lastName, int grade) {
	this.firstName = firstName;
	this.lastName = lastName;
	this.grade = grade;
    }

    public String getFullName() {
	return firstName + " " + lastName;
    }

    public int getGrade() {
	return grade;
    }
}
