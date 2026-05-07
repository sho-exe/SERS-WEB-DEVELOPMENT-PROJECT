package com.lab.model;

public class User {

    private int userId;        // Matches user_id
    private String username;   // Matches username
    private String password;   // Matches password
    private String email;      // Matches email
    private String fullName;   // Matches full_name
    private String role;       // Matches role (singular)

    // 1. Default Constructor (JavaBean standard)
    public User() {
    }

    // 2. Full Constructor (Used when fetching from ResultSet)
    public User(int userId, String username, String password, String email, String fullName, String role) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
    }

    // 3. Constructor for Registration (Without ID)
    public User(String username, String password, String email, String fullName, String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
    }

    // --- Getters and Setters ---

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}