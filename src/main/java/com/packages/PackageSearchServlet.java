package com.packages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.*;


public class PackageSearchServlet extends HttpServlet {

	private final String sql = "SELECT * FROM package WHERE name LIKE ?";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String packageName = request.getParameter("name");

		HttpSession session = request.getSession();

		List<Packages> searchResults = new ArrayList<>();
		
		if (packageName == null || packageName.isEmpty()) {
			session.setAttribute("isSearching", "false");
			response.sendRedirect("memebership.jsp");
			return;
		}

		try {
			   Connection con = DatabaseConnection.getConnection();
			   PreparedStatement prepared = con.prepareStatement(sql);


			   prepared.setString(1, "%" + packageName + "%");



				ResultSet rs = prepared.executeQuery();


			   while(rs.next()) {

				int id = rs.getInt("id");
				String name = rs.getString("name");
				String description = rs.getString("description");
				float price = rs.getFloat("price");
				byte[] packagePicture = rs.getBytes("packagePicture");

				Packages newePackage = new Packages(id, name, description, price, packagePicture);
				searchResults.add(newePackage);

			   }
			   
			   int searchResultsLength = searchResults.size();
			   
			   session.setAttribute("searchResult", searchResults);
			   session.setAttribute("isSearching", "true");
			   session.setAttribute("searchResultLength", searchResultsLength);
			   
			   response.sendRedirect("memebership.jsp");


			  } catch(SQLException e) {
			   e.printStackTrace();
			  } catch (ClassNotFoundException e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
			  }

	}

}
