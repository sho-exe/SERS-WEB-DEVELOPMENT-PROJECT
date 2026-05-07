package com.lab.dao;

import com.lab.model.User;
import java.sql.*;

public class UserDAO {
    // Database configuration - Ensure "sers" is your actual database name
    private String jdbcURL = "jdbc:mysql://localhost:3306/sers";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    // SQL Queries - Updated to match the SQL table columns
    private static final String SELECT_USER_FOR_LOGIN = "SELECT * FROM users WHERE username = ? AND password = ?";
    private static final String INSERT_USER_SQL = "INSERT INTO users (username, password, email, full_name, role) VALUES (?, ?, ?, ?, ?)";

    // Connection helper method
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    // 1. Authenticate User (For Login)
    public User authenticate(String username, String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_FOR_LOGIN)) {
            
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));       // Matches user_id in SQL
                user.setUsername(rs.getString("username")); // Matches username in SQL
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setRole(rs.getString("role"));         // Matches role in SQL
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // 2. Register User (For Signup)
    public boolean registerUser(User user) {
        boolean rowInserted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getFullName());
            preparedStatement.setString(5, user.getRole());

            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    // --- Main Method for Testing ---
    public static void main(String[] args) {
        UserDAO testDao = new UserDAO();

        System.out.println("--- Starting Database Connection Test ---");

        // Test Case: Using the sample data we inserted earlier
        // User: ahmad, Pass: ahmad123
        System.out.println("\nTest 1: Testing valid login for 'ahmad'...");
        User validUser = testDao.authenticate("ahmad", "ahmad123");

        if (validUser != null) {
            System.out.println("[SUCCESS] User found: " + validUser.getFullName() + " | Role: " + validUser.getRole());
        } else {
            System.out.println("[FAILED] User not found. Did you run the SQL INSERT commands?");
        }
    }
}