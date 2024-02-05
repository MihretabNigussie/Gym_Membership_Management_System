package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	public static Connection getConnection() throws ClassNotFoundException {


	    try {
	    	String url = "jdbc:mysql://localhost:3306/gym";
		    String username = "root";
		    String password = "14232314";
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con = DriverManager.getConnection(url, username, password);
	    	return con;
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return null;
	}


}
