package com.javaparttwo.model;

public final class GradedStudent extends User {

    private int grade;

    public GradedStudent(String username, String password, String name, String surname, long phoneNumber, String email,
	    String roleId, String department, int grade) {
	super(username, password, name, surname, phoneNumber, email, roleId, department);
	
	this.grade = grade;
    }
    
    public int getGrade() {
	return grade;
    }
}
