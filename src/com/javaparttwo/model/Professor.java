package com.javaparttwo.model;

/**
 * Represents all professors of our application.
 */
public class Professor extends User {

    /**
     * The registration number of this professor.
     */
    private int registrationNumber;

    /**
     * Initializes all professor details.
     *
     * @param registrationNumber The registration number of this professor.
     * @param username           The username representing this professor.
     * @param name               The first name of this professor.
     * @param surname            The last name of this professor.
     * @param department         The department in which the professor belongs to.
     */
    public Professor(int registrationNumber, String username, String password, String name, String surname, int phoneNumber, String email, String department) {
        super(username, password, name, surname, phoneNumber, email, department);

        this.registrationNumber = registrationNumber;

        System.out.println(this + System.lineSeparator());
    }

    /**
     * Get the registration number of this professor.
     *
     * @return The registration number of this professor.
     */
    public int getRegistrationNumber() {
        return registrationNumber;
    }

    /**
     * Overrides toString() method.
     *
     * @return Returns a string containing all properties of this professor.
     */
    public String toString() {
        return "[Professor] registration number: " + registrationNumber + ", username: " + getUsername() + ", name: " + getName()
                + ", surname: " + getSurname() + ", phone number: " + getPhoneNumber() + " , email: " + getEmail() + " department: " + getDepartment();
    }
}
