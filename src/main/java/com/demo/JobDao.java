package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobDao {
	
	
	public JobDao(Connection connection) {
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
	    public static int saveJobs(Jobs j){  
	        int stat=0;  
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement(  
	                         "insert into Jobs(title,description,category,status,location) values (?,?,?,?,?)");  
	            ps.setString(1,j.getTitle());  
	            ps.setString(2,j.getDescription());  
	            ps.setString(3,j.getCategory());  
	            ps.setString(4,j.getStatus()); 
	            ps.setString(5,j.getLocation());  

	         

	              
	            stat=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return stat;  

}
	    
	    public static List<Jobs> getAllJobs(){  
	        List<Jobs> list=new ArrayList<Jobs>();  
	          
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from Jobs");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Jobs j=new Jobs(); 
	                j.setId(rs.getInt(1));
	                j.setTitle(rs.getString(2));
	                j.setDescription(rs.getString(3)); 
	                j.setCategory(rs.getString(4));
	                j.setStatus(rs.getString(5));
	                j.setLocation(rs.getString(6));
	                j.setPdate(rs.getTimestamp(7)+"");
	             
	               
	                
	                list.add(j);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }      
	    
	    public static Jobs getJobById(int id){  
	          
	    	Jobs j=new Jobs();
	          
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from Jobs where id=?");  
	            ps.setInt(1, id);
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                
	                j.setId(rs.getInt(1));
	                j.setTitle(rs.getString(2));
	                j.setDescription(rs.getString(3)); 
	                j.setCategory(rs.getString(4));
	                j.setStatus(rs.getString(5));
	                j.setLocation(rs.getString(6));
	                j.setPdate(rs.getTimestamp(7)+"");
	             
	               
	                
	                 
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return j;  
	    }    
	    
	    public static int updatejob(Jobs j){  
	        int stat=0;  
	        
	        
	        try {
	        	
	        	
	        	Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("update Jobs set title=?,description=?,category=?,status=?,location=? where id=?");
	            ps.setString(1,j.getTitle());  
	            ps.setString(2,j.getDescription());  
	            ps.setString(3,j.getCategory());  
	            ps.setString(4,j.getStatus()); 
	            ps.setString(5,j.getLocation()); 
	            ps.setInt(6, j.getId());
	            
	            stat=ps.executeUpdate();

				
			} catch (Exception e) {
				e.printStackTrace();
			}
	        
	        return stat;
	        
	        
	       
	        
	    }
	    
	    public static int deletejob(int id){  
	        int stat=0;  
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("delete from Jobs where id=?");  
	            ps.setInt(1,id);  
	            stat=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return stat;  
	        
	    }
	    
	    public static List<Jobs> getAllJobsForUser(){  
	        List<Jobs> list=new ArrayList<Jobs>();  
	          
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from Jobs where status=?");  
	            ps.setString(1, "Active");
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Jobs j=new Jobs(); 
	                j.setId(rs.getInt(1));
	                j.setTitle(rs.getString(2));
	                j.setDescription(rs.getString(3)); 
	                j.setCategory(rs.getString(4));
	                j.setStatus(rs.getString(5));
	                j.setLocation(rs.getString(6));
	                j.setPdate(rs.getTimestamp(7)+"");
	             
	               
	                
	                list.add(j);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }      
	    
	    
	    public static List<Jobs> getJob1(String category,String location){  
	        List<Jobs> list=new ArrayList<Jobs>();  
	          
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from jobs where category=? or location=? order by id DESC");  
	            ps.setString(1, "category");
	            ps.setString(2, "location");

	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Jobs j=new Jobs(); 
	                j.setId(rs.getInt(1));
	                j.setTitle(rs.getString(2));
	                j.setDescription(rs.getString(3)); 
	                j.setCategory(rs.getString(4));
	                j.setStatus(rs.getString(5));
	                j.setLocation(rs.getString(6));
	                j.setPdate(rs.getTimestamp(7)+"");
	             
	               
	                
	                list.add(j);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }      
	    
	    
	    public static List<Jobs> getJob2(String category,String location){  
	        List<Jobs> list=new ArrayList<Jobs>();  
	          
	        try{  
	            Connection con=JobDao.getConnection();  
	            PreparedStatement ps=con.prepareStatement("select * from jobs where category=? and location=? order by id DESC");  
	            ps.setString(1, "category");
	            ps.setString(2, "location");

	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	                Jobs j=new Jobs(); 
	                j.setId(rs.getInt(1));
	                j.setTitle(rs.getString(2));
	                j.setDescription(rs.getString(3)); 
	                j.setCategory(rs.getString(4));
	                j.setStatus(rs.getString(5));
	                j.setLocation(rs.getString(6));
	                j.setPdate(rs.getTimestamp(7)+"");
	             
	               
	                
	                list.add(j);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return list;  
	    }      
	    
	    
	  
	    
	   
}


	        

