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

import com.database.DatabaseConnection;

public class UpdateProfileServlet extends HttpServlet {

    String sql = "update user set name = ?, password = ? where id = ?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newUsername = request.getParameter("username");
        String newPassword = request.getParameter("password");

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("id");

        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement prepared = con.prepareStatement(sql);

            
            String currentUsername = (String) session.getAttribute("username");
            String currentPassword = (String) session.getAttribute("password");

            // Use the newUsername if not null, otherwise use the currentUsername
            prepared.setString(1, (newUsername != null) ? newUsername : currentUsername);
            prepared.setString(2, (newPassword != null) ? newPassword : currentPassword);
            prepared.setInt(3, userId);
            

            prepared.executeUpdate();
            
        
            session.setAttribute("username", (newUsername != null) ? newUsername : currentUsername);
            session.setAttribute("password", (newPassword != null) ? newPassword : currentPassword);

            response.sendRedirect("profile.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
