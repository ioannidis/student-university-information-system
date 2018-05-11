package com.javaparttwo.model;

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
     * The department in which this course belongs to.
     */
    private String department;

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
     * @param courseID      The id of this course.
     * @param title         The title of this course.
     * @param department    The department in which this course belongs to.
     * @param teachingHours The teaching hours of this course.
     * @param ects          The ETCS of this course.
     */
    public Course(String courseId, String title, String department, int teachingHours, int ects) {
        this.courseId = courseId;
        this.title = title;
        this.department = department;
        this.teachingHours = teachingHours;
        this.ects = ects;

        // Creation message
        System.out.println("[Course] CourseID: " + courseId + ", Title: " + title + ", Department: " + department + ", Teaching Hours: "
                + teachingHours + " Ects: " + ects);
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
     * @param title The new title.
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Get the department in which this course belongs to.
     *
     * @return The department in which this course belongs to.
     */
    public String getDepartment() {
        return department;
    }

    /**
     * Set the department in which this course belongs to.
     *
     * @param department The new department.
     */
    public void setDepartment(String department) {
        this.department = department;
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
     * @param teachingHours The new teaching hours.
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
     * @param ects The new ETCS.
     */
    public void setEcts(int ects) {
        this.ects = ects;
    }
}
