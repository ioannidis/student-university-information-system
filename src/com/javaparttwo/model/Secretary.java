package com.javaparttwo.model;

/**
 * Represents all secretaries of our application.
 */
public class Secretary extends User {

    /**
     * The registration number of this secretary.
     */
    private int registrationNumber;

    /**
     * Initializes all secretary details.
     *
     * @param registrationNumber The registration number of this secretary.
     * @param username           The username representing this secretary.
     * @param name               The first name of this secretary.
     * @param surname            The last name of this secretary.
     * @param department         The department in which the secretary belongs to.
     */
    public Secretary(int registrationNumber, String username, String password, String name, String surname, int phoneNumber, String email, String department) {
        super(username, password, name, surname, phoneNumber, email, department);

        this.registrationNumber = registrationNumber;

        System.out.println(this + System.lineSeparator());
    }

    /**
     * Get the registration number of this secretary.
     *
     * @return The registration number of this secretary.
     */
    public int getRegistrationNumber() {
        return registrationNumber;
    }


    /**
     * Overrides toString() method.
     *
     * @return Returns a string containing all properties of this secretary.
     */
    public String toString() {
        return "[Secretary] username: " + getUsername() + ", name: " + getName() + ", surname: " + getSurname() + ", phone number: " + getPhoneNumber() + " , email: " + getEmail() + " department: " + getDepartment();
    }
}
