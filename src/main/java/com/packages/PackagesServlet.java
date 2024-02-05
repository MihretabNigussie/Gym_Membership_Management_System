package com.packages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

public class PackagesServlet extends HttpServlet {

	private static final String sql = "select * from package";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<Packages> packages = new ArrayList<>();
	    HttpSession session = request.getSession();

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        Statement statement = con.createStatement();

	        ResultSet rs = statement.executeQuery(sql);

	        while (rs.next()) {
	            int id = rs.getInt("id");
	            String name = rs.getString("name");
	            String description = rs.getString("description");
	            float price = rs.getFloat("price");
	            byte[] packagePicture = rs.getBytes("packagePicture");

	            Packages newPackage = new Packages(id, name, description, price, packagePicture);
	            packages.add(newPackage);
	           
	            
	        }
	        
	        session.setAttribute("packagesList", packages);
	        session.setAttribute("isSearching", "false");

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	}



}
