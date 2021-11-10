package java_files.user;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
public class UserBean {
	
	/* Variable Declaration */
	private int partyId;
	private String first_name;
	private String last_name;
	private String address;
	private String city;
	private String state;
	private String country;
	private Integer zip;
	private String phone;
	private int userLoginId;
	private String password;
	
//Constructor created	
	public UserBean()
	{
		
	}
	//All getter and setter methods
	
	//First Name
	public String getFirstName() {
		return first_name;
	}
	public void setFirstName(String first_name) {
		this.first_name = first_name;
	}
	
	//Last Name
	public String getLastName() {
		return last_name;
	}
	public void setLastName(String last_name) {
		this.last_name = last_name;
	}
	
	//Address
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	//City
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	//State
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	//Country
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	//Zip
	public Integer getZip() {
		return zip;
	}
	public boolean setZip(String zip) {
		
		try {
			this.zip=Integer.valueOf(zip);
		}
		catch(NumberFormatException e)
		{
			System.out.println("There is some error in taking zip of"
					+ " login page."+userLoginId);
			return false;
		}
		return true;
	}
	
	//Phone
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		
		this.phone=phone;
		
	}
	
	//UserLoginId
	public int getUserLoginId() {
		return userLoginId;
	}
	public boolean setUserLoginId(String userLoginId) {
		
		try {
			this.userLoginId=Integer.valueOf(userLoginId);
		}
		catch(NumberFormatException e)
		{
			System.out.println("There is some error in taking username"
					+ " of login page."+userLoginId);
			return false;
		}
		return true;
	}
	
	//Password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	//Party Id
	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	
}
