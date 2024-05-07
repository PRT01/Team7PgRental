// PropertyDAO.java
package com.virtusa.pgrental.dao;

import com.virtusa.pgrental.model.Property;
import com.virtusa.pgrental.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PropertyDAO {

    // Method to add a property to the database for a specific user
    public boolean addProperty(int uid, Property property) {
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(
                     "INSERT INTO Property (uid, pgName, pgType, address, phoneNumber, verified) VALUES (?, ?, ?, ?, ?, ?)",
                     PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, uid);
            statement.setString(2, property.getPgName());
            statement.setString(3, property.getPgType());
            statement.setString(4, property.getAddress());
            statement.setString(5, property.getPhoneNumber());
            statement.setBoolean(6, false);

            // Execute the statement
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                return false;
            }

            // Retrieve the generated pid
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int pid = generatedKeys.getInt(1);
                    property.setPid(pid);
                } else {
                    return false;
                }
            }

            // Insert property photos into PropertyPhotos table
            List<String> photoFileNames = property.getPhotoFileNames();
            for (String photoFileName : photoFileNames) {
                addPropertyPhoto(property.getPid(), photoFileName);
            }

            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Method to add a property photo to the database
    private void addPropertyPhoto(int pid, String photoFileName) {
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(
                     "INSERT INTO PropertyPhotos (pid, photoFileName) VALUES (?, ?)")) {
            statement.setInt(1, pid);
            statement.setString(2, photoFileName);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
