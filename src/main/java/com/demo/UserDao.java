package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	
	public UserDao(Connection connection) {
		// TODO Auto-generated constructor stub
	}


	public static Connection getConnection(){  
        Connection con=null;  
        try{  
        	Class.forName("com.mysql.cj.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "12345");

        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
	
	
	public static int saveUser(User u)
	{
		int stat=0;

		try {
			
			
			Connection con=UserDao.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
                         "insert into user(name,email,password,qualification,role) values (?,?,?,?,?)");  
            ps.setString(1,u.getName());  
            ps.setString(2,u.getEmail()); 
            ps.setString(3,u.getPassword()); 
            ps.setString(4,u.getQualification());  
            ps.setString(5, "user");
            
              
            stat=ps.executeUpdate();  
              
            con.close();  
						
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return stat;
		
	}
	
	
	public  User login(String email,String pass)
	{
		
		User u=null;
		try {
			
			Connection con=UserDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from User where email=? and password=?");  
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                u=new User(); 
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setQualification(rs.getString(3));
                u.setEmail(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setRole(rs.getString(6));
                
            }
                
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return u;
	}

}
