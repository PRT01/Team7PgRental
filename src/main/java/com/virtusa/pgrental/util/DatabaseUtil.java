package com.virtusa.pgrental.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DatabaseUtil {
    private static final ResourceBundle rb = ResourceBundle.getBundle("database");
    private static final String URL = rb.getString("database.url");
    private static final String USERNAME = rb.getString("database.username");
    private static final String PASSWORD = rb.getString("database.password");

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
