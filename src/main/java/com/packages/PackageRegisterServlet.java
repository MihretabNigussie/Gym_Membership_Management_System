package com.packages;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig
public class PackageRegisterServlet extends HttpServlet {
	private final String sql = "insert into package (name, description, price, packagePicture) values (?, ?, ?, ?)";
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String packageName = request.getParameter("packageName");
		String packageDescription = request.getParameter("packageDescription");
		String packagePrice = request.getParameter("packagePrice");
		
		Part packagePicturePart = request.getPart("packagePicture");

		try {
			Connection con = com.database.DatabaseConnection.getConnection();
			PreparedStatement prepared = con.prepareStatement(sql);
			
			prepared.setString(1, packageName);
			prepared.setString(2, packageDescription);
			prepared.setString(3, packagePrice);
			
			if (packagePicturePart != null && packagePicturePart.getSize() > 0) {
                InputStream imageInputStream = packagePicturePart.getInputStream();
                prepared.setBlob(4, imageInputStream);  
            } else {
                String absolutePath = "C:\\Users\\HP\\eclipse-workspace\\GymMembershipManagementSystem\\src\\main\\webapp\\images\\gym3.jpg";
                File defaultImageFile = new File(absolutePath);

                InputStream defaultImageInputStream = new FileInputStream(defaultImageFile);
                prepared.setBlob(4, defaultImageInputStream);  
            }

			prepared.executeUpdate();
			
			session.setAttribute("packageName", packageName);
			session.setAttribute("packageDescription", packageDescription);
			session.setAttribute("packagePrice", packagePrice);
			session.setAttribute("packagePicture", packagePicturePart);

			session.setAttribute("successMessage", "true");
			response.sendRedirect("memebership.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
