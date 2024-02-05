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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Packages;
import com.dao.Users;
import com.database.DatabaseConnection;


public class UsersSearchServlet extends HttpServlet {
	private final String sql = "SELECT * FROM user WHERE name LIKE ?";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userName = request.getParameter("name");

		HttpSession session = request.getSession();

		List<Users> usersList = new ArrayList<>();
		
		
		if (userName == null || userName.isEmpty()) {
			session.setAttribute("isSearching", "false");
			response.sendRedirect("usersList.jsp");
			return;
		}

		try {
			   Connection con = DatabaseConnection.getConnection();
			   PreparedStatement prepared = con.prepareStatement(sql);


			   prepared.setString(1, "%" + userName + "%");


				ResultSet rs = prepared.executeQuery();


			   while(rs.next()) {

				   int id = rs.getInt("id");
		            String name = rs.getString("name");
		            String email = rs.getString("email");
		            String password = rs.getString("password");
		            String role = rs.getString("role");
		            byte[] profilePicture = rs.getBytes("profile_picture");

		            Users newPackage = new Users(id, name, email, password, role,profilePicture);
		            usersList.add(newPackage);

			   }
			   
			   int searchResultsLength = usersList.size();
			   
			   session.setAttribute("usersSearchResult", usersList);
			   session.setAttribute("isSearching", "true");
			   session.setAttribute("searchResultLength", searchResultsLength);
			   
			   response.sendRedirect("usersList.jsp");


			  } catch(SQLException e) {
			   e.printStackTrace();
			  } catch (ClassNotFoundException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			  }

	}

}
