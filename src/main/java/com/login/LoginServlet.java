package com.login;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import com.database.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


public class LoginServlet extends HttpServlet {

	private final String sql = "SELECT * FROM user WHERE email=? AND password=?";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");


		try {
			Connection con = DatabaseConnection.getConnection();

			PreparedStatement prepared = con.prepareStatement(sql);


			prepared.setString(1, email);
			prepared.setString(2, password);


			ResultSet resultSet = prepared.executeQuery();
			HttpSession session = request.getSession();

			if (resultSet.next() ) {

				int userId = resultSet.getInt("id");
				String username = resultSet.getString("name");
				String role = resultSet.getString("role");
				byte[] profilePicture = resultSet.getBytes("profile_picture");
				

				session.setAttribute("id", userId);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				session.setAttribute("role", role);
			    
			    if (profilePicture != null) {
                    String base64Encoded = Base64.getEncoder().encodeToString(profilePicture);
                    session.setAttribute("profilePicture", base64Encoded);
                    
                } else {
                    // Handle the case where profilePicture is null
                    session.setAttribute("profilePicture", null); // or some default value
                }
				
			    
				if ("admin".equals(role)) {
			    response.sendRedirect("adminPanel.jsp");
			    } else {
				  response.sendRedirect("welcome.jsp");
			    }

			   
			} 



		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
