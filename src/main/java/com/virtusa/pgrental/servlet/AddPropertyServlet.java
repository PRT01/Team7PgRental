package com.virtusa.pgrental.servlet;

import com.virtusa.pgrental.dao.PropertyDAO;
import com.virtusa.pgrental.model.Property;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet("/addproperty")
@MultipartConfig
public class AddPropertyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        // Retrieve user ID from session or wherever it's stored
        int uid = getUserIdFromSession(request);

        // Retrieve property details from the form
        String pgName = request.getParameter("pgName");
        String pgType = request.getParameter("pgType");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        // Retrieve uploaded property photos
        List<String> photoFileNames = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().startsWith("propertyPhotos") && part.getSize() > 0) {
                String fileName = generateUniqueFileName(part);
                String savedFileName = saveFile(part, fileName);
                if (savedFileName != null) {
                    photoFileNames.add(savedFileName);
                }
            }
        }

        Property property = new Property();
        property.setPgName(pgName);
        property.setPgType(pgType);
        property.setAddress(address);
        property.setPhoneNumber(phoneNumber);
        property.setPhotoFileNames(photoFileNames);

        // Add the property to the database
        PropertyDAO propertyDAO = new PropertyDAO();
        boolean success = propertyDAO.addProperty(uid, property);

        if (success) {
            // Property added successfully
            response.sendRedirect("index.jsp");
        } else {
            // Property addition failed
            response.sendRedirect("AddProperty.jsp");
        }
    }

    // Method to retrieve user ID from session (example)
    private int getUserIdFromSession(HttpServletRequest request) {
        // Retrieve the user's session
        HttpSession session = request.getSession(false); // Don't create a new session if it doesn't exist

        if (session != null) {
            // Retrieve the user ID attribute from the session
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId != null) {
                // User ID found in the session, return it
                return userId;
            } else {
                // User ID attribute not found in the session
                // Handle this case based on your application's requirements
                // For example, you could return a default value or throw an exception
                // Here, we're returning -1 as a default value
                return -1;
            }
        } else {
            // Session is null (possibly expired or not created yet)
            // Handle this case based on your application's requirements
            // For example, you could return a default value or throw an exception
            // Here, we're returning -1 as a default value
            return -1;
        }
    }


    // Method to generate a unique file name
    private String generateUniqueFileName(Part part) {
        String extension = getExtension(part);
        return UUID.randomUUID().toString() + extension;
    }

    // Method to get file extension from Part object
    private String getExtension(Part part) {
        String contentType = part.getContentType();
        if (contentType != null && contentType.startsWith("image/")) {
            return "." + contentType.substring(contentType.lastIndexOf("/") + 1);
        }
        return "";
    }

    // Method to save file to the server
    private String saveFile(Part part, String fileName) throws IOException {
        String uploadDir = getServletContext().getRealPath("/uploads");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        InputStream inputStream = part.getInputStream();
        FileOutputStream outputStream = new FileOutputStream(new File(dir, fileName));

        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }

        outputStream.close();
        inputStream.close();

        return fileName;
    }
}
