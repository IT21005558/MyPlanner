package com.client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClientDBUtil {
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	

	
	public static boolean validate (String userName,String password){
		
	
		isSuccess=false;
		
		
		
		//Validation
			try {
				con=DBConnection.getConnection();
				stmt=con.createStatement();
			
				
				String sql="select * from clientdata where username='"+userName+"'and password='"+password+"'";
				
				 rs= stmt.executeQuery(sql);
				
				
				
				if(rs.next()) {
					isSuccess=true;
				}
				else {
					isSuccess=false;
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
			
			return isSuccess;
			
		}
	
	
	
public static List<Client> getClient (String username){
		
		ArrayList <Client> client = new ArrayList<>();
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
		
			
			String sql="select * from clientdata where username='"+username+"'";
			
			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				int cid=rs.getInt(1);
				String name=rs.getString(2);
				String gender=rs.getString(3);
				String dob=rs.getString(4)	;
				String email=rs.getString(5);;
				String phone=rs.getString(6);
				String address=rs.getString(7);
				String userU=rs.getString(8);
				String passU=rs.getString(9);
				
				Client c=new Client(cid,name,gender,dob,email,phone,address,userU,passU);
				client.add(c);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
		
		return client;
	}
	
	
	
	
	

	public static boolean registerclient (String name,String gender,String dob,String email,String phone,String address,String username,String password) {
		
		 isSuccess=false;
	
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			
			String sql="insert into clientdata values(0,'"+name+"','"+gender+"','"+dob+"','"+email+"','"+phone+"','"+address+"','"+username+"','"+password+"');";
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
		
		
	}
	
	
	public static boolean updateclient(String id,String name,String gender,String dob,String email,String phone,String address,String username,String password) {
	
		 isSuccess=false;
		 
		 try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			String sql = "UPDATE clientdata SET name='"+name+"', gender='"+gender+"', dob='"+dob+"', email='"+email+"', phone='"+phone+"', "
			           + "address='"+address+"', username='"+username+"', password='"+password+"' WHERE id='"+id+"'";

			 
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	
	return  isSuccess;
	}
	
	
	public static List<Client> getClientDetails (String id){
		
		ArrayList <Client> client = new ArrayList<>();
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
		
			
			String sql="select * from clientdata where cid='"+id+"'";
			
			rs= stmt.executeQuery(sql);
			
			if(rs.next()) {
				int cid=rs.getInt(1);
				String name=rs.getString(2);
				String gender=rs.getString(3);
				String dob=rs.getString(4)	;
				String email=rs.getString(5);;
				String phone=rs.getString(6);
				String address=rs.getString(7);
				String userU=rs.getString(8);
				String passU=rs.getString(9);
				
				Client c=new Client(cid,name,gender,dob,email,phone,address,userU,passU);
				client.add(c);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
		
		return client;
	}
	
	
	
	public static boolean deleteclient(String id) {
		isSuccess=false;
			int convId=Integer.parseInt(id);
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			String sql="delete from clientdata where cid='"+convId+"'";
			int rs=stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			
		
		
		return isSuccess;
	}
	
	
	
	
	
}




	
