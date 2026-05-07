package com.lab.dao;

import com.lab.model.User;
import java.sql.*;

public class UserDAO {
    // Database config is now centrally managed by DBConnection

    // SQL Queries - Updated to match the SQL table columns
    private static final String SELECT_USER_FOR_LOGIN = "SELECT * FROM users WHERE username = ? AND password = ?";
    private static final String INSERT_USER_SQL = "INSERT INTO users (username, password, email, full_name, role) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users ORDER BY role, full_name";
    private static final String UPDATE_USER_ROLE_SQL = "UPDATE users SET role = ? WHERE user_id = ?";

    // Connection helper method
    protected Connection getConnection() {
        return DBConnection.getConnection();
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

    // 3. Select All Users (For HEPA Manage Users Module)
    public java.util.List<User> selectAllUsers() {
        java.util.List<User> users = new java.util.ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    // 4. Update User Role (For HEPA)
    public boolean updateUserRole(int userId, String newRole) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_ROLE_SQL)) {
            
            preparedStatement.setString(1, newRole);
            preparedStatement.setInt(2, userId);

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}