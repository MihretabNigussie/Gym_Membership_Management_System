package com.packages;

import jakarta.servlet.ServletException;
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

import com.database.DatabaseConnection;
import com.dao.Packages; // Make sure to import the correct Packages class

public class SubscribedPackagesServlet extends HttpServlet {

    private final String sql1 = "SELECT * FROM user_package WHERE user_id = ?";
    private final String sql2 = "SELECT * FROM package WHERE id = ?";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Packages> subscribedPackages = new ArrayList<>();
        HttpSession session = request.getSession();

        try {
            // Ensure you are getting the correct userId from the session
            int userId = (int) session.getAttribute("id");

            try (Connection con = DatabaseConnection.getConnection();
                    PreparedStatement prepared = con.prepareStatement(sql1)) {

                prepared.setInt(1, userId);
                ResultSet rs = prepared.executeQuery();

                while (rs.next()) {
                    int package_id = rs.getInt("package_id");

                    try (PreparedStatement prepared2 = con.prepareStatement(sql2)) {
                        prepared2.setInt(1, package_id);
                        ResultSet rs2 = prepared2.executeQuery();

                        while (rs2.next()) {
                            int id = rs2.getInt("id");
                            String name = rs2.getString("name");
                            String description = rs2.getString("description");
                            float price = rs2.getFloat("price");
                            byte[] packagePicture = rs2.getBytes("packagePicture");

                            Packages newPackage = new Packages(id, name, description, price, packagePicture);
                            subscribedPackages.add(newPackage);
                        }
                    }
                }

               
                int subscribedPackagesLength = subscribedPackages.size();
                session.setAttribute("subscribedPackages", subscribedPackages);
                session.setAttribute("subscribedPackagesLength", subscribedPackagesLength);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
