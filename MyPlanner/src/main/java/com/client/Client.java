package com.client;



public class Client {
	private int id;
	private String name;
	private String gender;
	private String dob;
	private String email;
	private String phone;
	private String address;
	private String username;
	private String password;
	
	
	
	
	public Client(int id, String name, String gender, String dob, String email, String phone, String address,
			String username, String password) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.username = username;
		this.password = password;
	}




	public int getId() {
		return id;
	}




	public String getName() {
		return name;
	}




	public String getGender() {
		return gender;
	}




	public String getDob() {
		return dob;
	}




	public String getEmail() {
		return email;
	}




	public String getPhone() {
		return phone;
	}




	public String getAddress() {
		return address;
	}




	public String getUsername() {
		return username;
	}




	public String getPassword() {
		return password;
	}
	
	
	
}
