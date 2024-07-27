package com.demo;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/AddJob")
public class AddJobServlet extends HttpServlet {

	  protected void doPost(HttpServletRequest req, HttpServletResponse resp)   
		         throws ServletException, IOException {  
		        resp.setContentType("text/html");  
		        PrintWriter out=resp.getWriter();  
		
		
		try {
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("description");
			
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			
			
			
			HttpSession session=req.getSession();
			
			
			int stat=JobDao.saveJobs(j);
			if(stat >0)
			{
				session.setAttribute("msg", "JOB POST SUCCESSFULLY");
				resp.sendRedirect("addjob.jsp");
			}
			else
			{
				session.setAttribute("msg", "something went wrong");
				resp.sendRedirect("addjob.jsp");

				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
