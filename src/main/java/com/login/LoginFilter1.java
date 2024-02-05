package com.login;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.database.DatabaseConnection;

/**
 * Servlet Filter implementation class LoginFilter1
 */
public class LoginFilter1 extends HttpFilter implements Filter {
       
	private final String sql = "SELECT * FROM user WHERE email=? AND password=?";
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		
		
		try {
			Connection con = DatabaseConnection.getConnection();

			PreparedStatement prepared = con.prepareStatement(sql);


			prepared.setString(1, email);
			prepared.setString(2, password);


			ResultSet resultSet = prepared.executeQuery();
			

			if (resultSet.next() ) {
				
				
				chain.doFilter(request, response);

			} else {
				
			    session.setAttribute("isError", "true");
			    res.sendRedirect("login.jsp");
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}
