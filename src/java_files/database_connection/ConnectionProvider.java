package java_files.database_connection;
import java.sql.*;
import java.io.*;
import javax.servlet.*;

import java_files.user.UserBean;
public class ConnectionProvider {
	
	
    //Private Variable Declaration
	private static final String url="jdbc:mysql://localhost:3306/mydb";
	private static final String user="root";
	private static final String password="ivan@2002";
	private static Connection conn=null;
	
    //Constructor
	private  ConnectionProvider() {
		// TODO Auto-generated constructor stub
	}
    private static Connection DatabaseConnection() {
    
        //Create Connection only once
        //Error1: Driver class not found error
        //Error2: Server error
        //Return connection
		if(conn==null)
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,user,password);
			}
			catch (ClassNotFoundException e) {
				
				System.out.println("MYSQL class not found error.");
				e.printStackTrace();
			}
			catch (SQLException e) {
					
				System.out.println("MySQL SERVER NOT CONNECTED.");
				e.printStackTrace();
			}

            //Confirming database connection
			System.out.println("Connecting to database...");
			if(conn!=null)
			{
				System.out.println("Connection is established with Database server.");
			}
			else
			{	
				System.out.println("Alert!!! Error in connecting with databse server.");
			}
			
		}

		return conn;
    }
    public static Connection getConnection()
    {
    	return conn;
    }
    
	public static boolean checkIfUserExists(int userLoginId, String password){
		
		try {
			String sql;
			sql = "SELECT userloginid,password FROM userlogin";
			Statement stmt=conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				//Retrieve by column name
				int userid = rs.getInt("userloginid");
				String pwd = rs.getString("password");
				System.out.println(userLoginId +" "+userid+" "+password+" "+pwd);
	            //User exists in database
				if(userLoginId==userid && (password==null ||password.equals(pwd)))
				{	
					return true;
				}
			}	
		}
	    //Error in Query execution
		catch(Exception e)
		{
			System.out.println("There is a exception in SQL Squery");
			e.printStackTrace();
		}
		return false;
	}
	public static boolean deleteUser(Integer id){
		
		try {
			
			String q;
			PreparedStatement psmt;
			
			//Deleting from user Table
			q="Delete from userlogin where userloginid="+id;
			conn=DatabaseConnection();
			psmt=conn.prepareStatement(q);
			psmt.executeUpdate();	
			return true;
		
		}
		catch(Exception e)
		{
			System.out.println("ERROR in Deleting Data From The Table");
			e.printStackTrace();
			return false;
		}
		
	}
	public static boolean insertIntoPartyValues(UserBean user){
		
		try {
			
			String q;
			
			//Inserting data into the userLogin table
			q="Insert into userLogin values (?,?,?)";
			PreparedStatement psmt=conn.prepareStatement(q);
			
			//set the value of parameter
			psmt.setInt(1,user.getUserLoginId());
			psmt.setString(2,user.getPassword());
			psmt.setInt(3,user.getPartyId());
			psmt.executeUpdate();	
			
			//Inserting data into the party Table
			q="Insert into party values (?,?,?,?,?,?,?,?,?)";
			psmt=conn.prepareStatement(q);
			
			psmt.setInt(1,user.getPartyId());
			psmt.setString(2,user.getFirstName());
			psmt.setString(3,user.getLastName());
			psmt.setString(4,user.getAddress());
			psmt.setString(5,user.getCity());
			psmt.setInt(6,user.getZip());
			psmt.setString(7,user.getState());
			psmt.setString(8,user.getCountry());
			psmt.setString(9,user.getPhone());
			
			psmt.executeUpdate();
				
			return true;
		
		}
		catch(Exception e)
		{
			System.out.println("ERROR in Inserting Data Into The Table");
			e.printStackTrace();
			return false;
		}
		
	}
	static int generatePartyId(){
		try {
			
			String q="";
			System.out.println("Adding Party Id");
			//Searching query in the database
			q="select max(partyid) as save from party";
			Statement stmt=conn.createStatement();
			ResultSet rs = stmt.executeQuery(q);
			while(rs.next()){
				
				System.out.println("Maximum party id is"+rs.getInt("save"));
				//Set partyId=max(partyId's)+1
				System.out.println("Completed adding partyId");
				return rs.getInt("save")+1;
			}	
			System.out.println("Completed adding partyId");
			//If no element is present in the party
			return 1;
		}
		catch(SQLException e)
		{
			e.getStackTrace();
			System.out.println("Error in Sql Queries in login page.");
		}
		return -1;
	}
	public static UserBean fetchUserByUserId(UserBean user) throws IOException,ServletException {
		
		try {
			conn=DatabaseConnection();
			String sql;
			sql = "SELECT * FROM party as p"
				 +" join userlogin as u on p.partyid=u.partyid";
			Statement stmt=conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("Fetching User By Id");
			while(rs.next()){
				System.out.println(rs.getInt("userloginid")+" "+user.getUserLoginId());
				if(rs.getInt("userloginid")==user.getUserLoginId())
				{
					user.setFirstName(rs.getString("firstname"));
					user.setLastName(rs.getString("lastname"));
					user.setAddress(rs.getString("address"));
					user.setCity(rs.getString("city"));
					user.setState(rs.getString("state"));
					user.setCountry(rs.getString("country"));
					user.setZip(rs.getString("zip"));
					user.setPhone(rs.getString("phone"));
					System.out.println("Returning user");
					return user;
				}
				
			}	
			return null;
		}
		catch(SQLException e)
		{
			
			System.out.println("ERROR in Searching User.");
			e.printStackTrace();
			return null;
		}
	}
	public static boolean	searchUser(UserBean user) throws IOException,ServletException {
		
		try {
			String sql;
			sql = "SELECT firstname,lastname FROM party";
			Statement stmt=conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("firstname").equalsIgnoreCase(user.getFirstName())
				  &&rs.getString("lastname").equalsIgnoreCase(user.getLastName()))
				return true;
				
			}	
			return false;
		}
		catch(SQLException e)
		{
		
			System.out.println("ERROR in Searching User.");
			e.printStackTrace();
			return false;
		}
	}
	//Return database connection if the user exists
	public static Connection loginConnection(UserBean user) {

		DatabaseConnection();
		if(checkIfUserExists(user.getUserLoginId(),user.getPassword()))
		{
			return conn;
		}
		else {
			return null;
		}
	}
	public static Connection registerConnection(UserBean user) {

		DatabaseConnection();
		if(checkIfUserExists(user.getUserLoginId(),null))
		{
			return null;
		}
		else {
			user.setPartyId(generatePartyId());
			insertIntoPartyValues(user);
			return conn;
		}
	}
	

}
