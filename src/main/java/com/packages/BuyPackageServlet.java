package com.packages;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuyPackageServlet extends HttpServlet {
	
	private final String sql = "insert into user_package (user_id, package_id) values (?, ?)";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		int packageId = Integer.parseInt(request.getParameter("packageId"));
		int userId = (int) session.getAttribute("id");
		
		
		try {
		    Connection con = com.database.DatabaseConnection.getConnection();
		    PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM user_package WHERE user_id = ? AND package_id = ?");
		    preparedStatement.setInt(1, userId);
		    preparedStatement.setInt(2, packageId);

		    ResultSet resultSet = preparedStatement.executeQuery();

		    if (!resultSet.next()) {
		        // Entry does not exist, proceed with the insert
		        PreparedStatement prepared = con.prepareStatement("INSERT INTO user_package (user_id, package_id) VALUES (?, ?)");
		        prepared.setInt(1, userId);
		        prepared.setInt(2, packageId);

		        prepared.executeUpdate();
		        
		        session.setAttribute("successMessage", "true");

		        
		        response.sendRedirect("memebership.jsp");
		    } else {
		        // Entry already exists, handle accordingly (e.g., show an error message)
		    	String error =  "You already have this package, Go back and try with another package";
		        session.setAttribute("errorMessage", error);
			    response.sendRedirect("error.jsp");
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}

		
		
		
		
	}
}
