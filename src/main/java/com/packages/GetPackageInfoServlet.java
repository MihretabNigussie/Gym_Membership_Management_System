package com.packages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.database.DatabaseConnection;

public class GetPackageInfoServlet extends HttpServlet {
	String sql = "SELECT name, description, price FROM package WHERE id = ?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get packageId from request parameter
        int packageId = Integer.parseInt(request.getParameter("packageId"));

        try {
            // Fetch package data from the database
            Connection con = DatabaseConnection.getConnection(); 
            PreparedStatement prepared = con.prepareStatement(sql);
            
            HttpSession session = request.getSession();
            
            prepared.setInt(1, packageId);
            ResultSet resultSet = prepared.executeQuery();

            if (resultSet.next()) {
                // Save package information in the session
                
                session.setAttribute("packageName", resultSet.getString("name"));
                session.setAttribute("packageDescription", resultSet.getString("description"));
                session.setAttribute("packagePrice", resultSet.getString("price"));
                
                session.setAttribute("packageId", packageId);
                
                // You might need to handle packagePicture differently, depending on its data type

                // Forward the request to EditPackageServlet
                response.sendRedirect("editPackage.jsp");
            } else {
                // Handle the case where no package with the given packageId was found
            	String error = "No package found with ID: " + packageId;
            	session.setAttribute("error", error);
            	response.sendRedirect("error.jsp");
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
