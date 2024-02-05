package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

import jakarta.servlet.http.Part;

public class Users {

	private int id;
	private String name;
	private String email;
	private String password;
	private String role;
	private String profilePicture;
	
	public static String convertToBase64(byte[] bytes) {
	    if (bytes != null && bytes.length > 0) {
	        return Base64.getEncoder().encodeToString(bytes);
	    } 
	    return null;
	}

	
	public Users(int id, String name, String email, String password, String role, byte[] profilePicture) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.profilePicture = convertToBase64(profilePicture);
    }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }
	
	
	
	
	
}
