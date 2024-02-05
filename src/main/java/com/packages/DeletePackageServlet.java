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
import java.sql.SQLException;


public class DeletePackageServlet extends HttpServlet {
	private final String deleteSql = "DELETE FROM package WHERE id = ?";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		int packageId = Integer.parseInt(request.getParameter("packageId"));
        
        try {        	
        	
        	
            Connection con = com.database.DatabaseConnection.getConnection();
            PreparedStatement deleteStatement = con.prepareStatement(deleteSql);
            
            deleteStatement.setInt(1, packageId);

            int rowsAffected = deleteStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Rows deleted successfully
            	session.setAttribute("successMessage", "true");
                response.sendRedirect("memebership.jsp");
        
				} else {
					// Rows not deleted, handle accordingly (e.g., show an error message)
					String error = "Error while deleting package, please try again";
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
