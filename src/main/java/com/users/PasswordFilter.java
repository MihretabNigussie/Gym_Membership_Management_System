package com.users;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/UpdateProfileServlet")
public class PasswordFilter extends HttpFilter implements Filter {
    
	private static final String PASSWORD_PATTERN = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

    public static boolean isStrongPassword(String password) {
        return password.matches(PASSWORD_PATTERN);
    }
   
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		String password = request.getParameter("password").trim();

		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		
		if (isStrongPassword(password)) {
			chain.doFilter(request, response);
        } else {
        	HttpSession session = req.getSession();
            session.setAttribute("weak", "true");
        	res.sendRedirect("editProfile.jsp");
        }
		
		
	}

}
