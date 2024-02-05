package com.dao;


import java.util.Base64;

public class Packages {
	private int id;
	private String name;
	private String description;
	private float price;
	private String packagePicture;
	
	
	public static String convertToBase64(byte[] bytes) {
	    if (bytes != null && bytes.length > 0) {
	        return Base64.getEncoder().encodeToString(bytes);
	    } 
	    return null;
	}
	
	
	public Packages(int id, String name, String description, float price, byte[] packagePicture) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.packagePicture = convertToBase64(packagePicture);
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}

	public String getPackagePicture() {
        return packagePicture;
    }

    public void setPackagePicture(String packagePicture) {
        this.packagePicture = packagePicture;
    }
	


}
