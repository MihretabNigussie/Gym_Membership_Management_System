package com.users;

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


public class DeleteUsersServlet extends HttpServlet {
	private final String deleteSql = "DELETE FROM user WHERE id = ?";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		int userID = Integer.parseInt(request.getParameter("userId"));
        
        try {        	
        	
        	
            Connection con = com.database.DatabaseConnection.getConnection();
            PreparedStatement deleteStatement = con.prepareStatement(deleteSql);
            
            deleteStatement.setInt(1, userID);
            

            int rowsAffected = deleteStatement.executeUpdate();
            Integer sessionId = (Integer) session.getAttribute("id");
            
            
            if (rowsAffected > 0) {
                // Rows deleted successfully
            
            	session.setAttribute("successMessage", "true");
            	
            	if (sessionId == userID) {
            	    response.sendRedirect("index.jsp");
            	} else {
            		response.sendRedirect("usersList.jsp");
            	}

            	
                
        
				} else {
					// Rows not deleted, handle accordingly (e.g., show an error message)
					String error = "Error while deleting user, please try again";
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
