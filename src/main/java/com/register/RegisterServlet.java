package com.register;
import java.util.Base64;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import org.mindrot.jbcrypt.BCrypt;
import java.sql.Blob;


@MultipartConfig
public class RegisterServlet extends HttpServlet {

    private final String sql = "INSERT INTO user (name, password, email, profile_picture ) VALUES (?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        

        Part profilePicturePart = request.getPart("profilePicture");
        
        

        try {
            Connection con = com.database.DatabaseConnection.getConnection();
            PreparedStatement prepared = con.prepareStatement(sql);

            prepared.setString(1, username);
            prepared.setString(2, password);
            prepared.setString(3, email);
            

            if (profilePicturePart != null && profilePicturePart.getSize() > 0) {
                InputStream imageInputStream = profilePicturePart.getInputStream();
                prepared.setBlob(4, imageInputStream);  // Use index 5 for profile_picture
            } else {
                String absolutePath = "C:\\Users\\HP\\eclipse-workspace\\GymMembershipManagementSystem\\src\\main\\webapp\\images\\proPic.jpg";
                File defaultImageFile = new File(absolutePath);

                InputStream defaultImageInputStream = new FileInputStream(defaultImageFile);
                prepared.setBlob(4, defaultImageInputStream);  // Use index 5 for profile_picture
            }



            prepared.executeUpdate();

            response.sendRedirect("login.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
   
} 