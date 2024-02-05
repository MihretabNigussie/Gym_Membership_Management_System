package com.packages;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DatabaseConnection;


public class EditPackageServlet extends HttpServlet {
	String sql = "update package set name = ?, description = ?, price = ? where id = ?";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPackageName = request.getParameter("packageName");
        String newPackageDescription = request.getParameter("packageDescription");
        String newPackagePrice = request.getParameter("packagePrice");
        
        HttpSession session = request.getSession();
        int packageId = (int) session.getAttribute("packageId");
        
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement prepared = con.prepareStatement(sql);
            
            String currentPackageName = (String) session.getAttribute("packageName");
            String currentPackageDescription = (String) session.getAttribute("packageDescription");
            String currentPackagePrice = (String) session.getAttribute("packagePrice");
            
            // Use the newPackageName if not null, otherwise use the currentPackageName
            prepared.setString(1, (newPackageName != null) ? newPackageName : currentPackageName);
            
            // Use the newPackageDescription if not null, otherwise use the currentPackageDescription
            prepared.setString(2, (newPackageDescription != null) ? newPackageDescription : currentPackageDescription);
            
            // Use the newPackagePrice if not null, otherwise use the currentPackagePrice
            prepared.setString(3, (newPackagePrice != null) ? newPackagePrice : currentPackagePrice);
            
            prepared.setInt(4, packageId);
            
            prepared.executeUpdate();
            
            // Update the packageName in the session
            session.setAttribute("packageName", (newPackageName != null) ? newPackageName : currentPackageName);
            
            // Update the packageDescription in the session
            session.setAttribute("packageDescription", (newPackageDescription != null) ? newPackageDescription : currentPackageDescription);
            
            // Update the packagePrice in the session
            session.setAttribute("packagePrice", (newPackagePrice != null) ? newPackagePrice : currentPackagePrice);
            
            response.sendRedirect("memebership.jsp");
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
	}

}
	
	}
