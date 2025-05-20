package com.vendor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.client.DBConnection;

public class VendorDBUtil {
	
	
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
			
				
				String sql="select * from vendordata where username='"+userName+"'and password='"+password+"'";
				
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
	
	
public static List<vendor> getVendor (String username){
		
		ArrayList <vendor> ven = new ArrayList<>();
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
		
			
			String sql="select * from vendordata where username='"+username+"'";
			
			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				int vid=rs.getInt(1);
				String name=rs.getString(2);
				String email=rs.getString(3);;
				String phone=rs.getString(4);
				String address=rs.getString(5);
				String services=rs.getString(6);
				String userU=rs.getString(7);
				String passU=rs.getString(8);
				
				vendor v=new vendor(vid,name,email,phone,address,services,userU,passU);
				ven.add(v);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
		
		return ven;
	}
	
	
public static List<vendor> getvendorDetails (String id){
	
	ArrayList <vendor> ven = new ArrayList<>();
	
	
	try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
	
		
		String sql="select * from vendordata where id='"+id+"'";
		
		rs= stmt.executeQuery(sql);
		
		if(rs.next()) {
			int vid=rs.getInt(1);
			String name=rs.getString(2);
			String email=rs.getString(3);;
			String phone=rs.getString(4);
			String address=rs.getString(5);
			String services=rs.getString(6);
			String userU=rs.getString(7);
			String passU=rs.getString(8);
			
			vendor v=new vendor(vid,name,email,phone,address,services,userU,passU);
			ven.add(v);
			
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	

	
	
	return ven;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static boolean registervendor (String name,String email,String phone,String address,String services,String username,String password) {
		
		 isSuccess=false;
	
		
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			
			String sql="insert into vendordata values(0,'"+name+"','"+email+"','"+phone+"','"+address+"','"+services+"','"+username+"','"+password+"');";
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
	



public static boolean deletevendor(String id) {
	isSuccess=false;
		int convId=Integer.parseInt(id);
	
	
	try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		String sql="delete from vendordata where vid='"+convId+"'";
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



public static boolean updatevendor(String id,String name,String email,String phone,String address,String services,String username,String password) {

	 isSuccess=false;
	 
	 try {
		con=DBConnection.getConnection();
		stmt=con.createStatement();
		
		
		String sql = "UPDATE vendordata SET name='"+name+"',email='"+email+"', phone='"+phone+"', "
		           + "address='"+address+"',services='"+services+"', username='"+username+"', password='"+password+"' WHERE vid='"+id+"'";

		 
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


}
