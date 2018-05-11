package com.javaparttwo.model;

/**
 * Represents all users of our application.
 */
public class User {

    /**
     * The username representing this user.
     */
    private String username;
    
    /**
     * The password of the user.
     */
    private String password;

    /**
     * The first name of this user.
     */
    private String name;

    /**
     * The last name of this user.
     */
    private String surname;
    
    /**
     * The phone_number of this user.
     */
    private int phoneNumber;
    
    /**
     * The email of this user.
     */
    private String email;

    /**
     * The department in which the user belongs to.
     */
    private String department;

    /**
     * The total number of user objects created during the runtime of this application.
     */
    private static int usersCounter = 0;

    /**
     * Initializes all user details.
     *
     * @param username   The username representing this user.
     * @param name       The first name of this user.
     * @param surname    The last name of this user.
     * @param department The department in which the user belongs to.
     */
    public User(String username, String password, String name, String surname, int phoneNumber, String email, String department) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.department = department;

        System.out.println("Creating new user. Total: " + ++usersCounter);

        // Display creation message on.
        if (usersCounter == 1)
            System.out.println(this + System.lineSeparator());
    }

    /**
     * Get the username of this user.
     *
     * @return The username representing this user.
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the username of this user.
     *
     * @param username The new username.
     */
    public void setUsername(String username) {
        this.username = username;
    }
    
    /**
     * Get the password of the user.
     *
     * @return The password of the user.
     */
    public String getPassword() {
        return password;
    }
    
    /**
     * Set the password of this user.
     *
     * @param password The new password.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Get the first name of this user.
     *
     * @return The first name of this user.
     */
    public String getName() {
        return name;
    }

    /**
     * Set the first name of this user.
     *
     * @param name The new first name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Get the last name of this user.
     *
     * @return The last name of this user.
     */
    public String getSurname() {
        return surname;
    }

    /**
     * Set the last name of this user.
     *
     * @param surname The new last name.
     */
    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    /**
     * Get the last name of this user.
     *
     * @return The last name of this user.
     */
    public int getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Set the last name of this user.
     *
     * @param surname The new last name.
     */
    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    /**
     * Get the last name of this user.
     *
     * @return The last name of this user.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Set the last name of this user.
     *
     * @param surname The new last name.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Get the department in which the user belongs to.
     *
     * @return The department in which the user belongs to.
     */
    public String getDepartment() {
        return department;
    }

    /**
     * Set the department in which the user belongs to.
     *
     * @param department The new department.
     */
    public void setDepartment(String department) {
        this.department = department;
    }

    /**
     * Get the total number of user objects created during the runtime of this application.
     *
     * @return The total number of user objects created during the runtime of this application.
     */
    public static int getUsersCounter() {
        return usersCounter;
    }

    /**
     * Overrides toString() method.
     *
     * @return Returns a string containing all properties of this user.
     */
    public String toString() {
        return "[User] username: " + username + ", password: ****, name: " + name + ", surname: " + surname + ", phone number: " + phoneNumber + " email: " + email + "  department: " + department;
    }
}
