package com.packages;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class CheckUnsubscribePackagesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Get the referring page
        String referer = request.getHeader("referer");

        // Your existing code
        HttpSession session = request.getSession();
        int packageId = Integer.parseInt(request.getParameter("packageId"));
        session.setAttribute("packageId", packageId);

        // Redirect back to the referring page
        response.sendRedirect(referer);
        
    }
}
