package com.javaparttwo.model;

/**
 * Represents all courses of our application.
 */
public class Course {

    /**
     * The id of this course.
     */
    private String courseId;

    /**
     * The title of this course.
     */
    private String title;

    /**
     * The instructor of this course.
     */
    private String instructorUsername;

    /**
     * The teaching hours of this course.
     */
    private int teachingHours;

    /**
     * The ETCS of this course.
     */
    private int ects;

    /**
     * Initializes all course details.
     *
     * @param courseID
     *            The id of this course.
     * @param title
     *            The title of this course.
     * @param ects
     *            The ETCS of this course.
     * @param teachingHours
     *            The teaching hours of this course.
     * @param instructorUsername
     *            The instructor of this course.
     */
    public Course(String courseId, String title, int ects, int teachingHours, String instructorUsername) {
	this.courseId = courseId;
	this.title = title;
	this.ects = ects;
	this.teachingHours = teachingHours;
	this.instructorUsername = instructorUsername;

	// Creation message
	System.out.println(this + System.lineSeparator());
    }

    /**
     * Get the id of this course.
     *
     * @return The id of this course.
     */
    public String getCourseId() {
	return courseId;
    }

    /**
     * Set the title of this course.
     *
     * @param title
     *            The new title.
     */
    public void setCourseId(String courseId) {
	this.courseId = courseId;
    }

    /**
     * Get the title of this course.
     *
     * @return The title of this course.
     */
    public String getTitle() {
	return title;
    }

    /**
     * Set the title of this course.
     *
     * @param title
     *            The new title.
     */
    public void setTitle(String title) {
	this.title = title;
    }

    /**
     * Get the instructor of this course.
     *
     * @return The instructor of this course.
     */
    public String getInstructorUsername() {
	return instructorUsername;
    }

    /**
     * Set the instructor of this course.
     *
     * @param department
     *            The new instructor.
     */
    public void setInstructorUsername(String instructorUsername) {
	this.instructorUsername = instructorUsername;
    }

    /**
     * Get the teaching hours of this course.
     *
     * @return The teaching hours of this course.
     */
    public int getTeachingHours() {
	return teachingHours;
    }

    /**
     * Set the teaching hours of this course.
     *
     * @param teachingHours
     *            The new teaching hours.
     */
    public void setTeachingHours(int teachingHours) {
	this.teachingHours = teachingHours;
    }

    /**
     * Get the ETCS of this course.
     *
     * @return The ETCS of this course.
     */
    public int getEcts() {
	return ects;
    }

    /**
     * Set the ETCS of this course.
     *
     * @param ects
     *            The new ETCS.
     */
    public void setEcts(int ects) {
	this.ects = ects;
    }

    /**
     * Overrides toString() method.
     *
     * @return Returns a string containing all properties of this course.
     */
    public String toString() {
	return "[Course] CourseID: " + courseId + ", Title: " + title + ", Teaching Hours: " + teachingHours + " Ects: "
		+ ects + ", Instructor: " + instructorUsername;
    }
}
