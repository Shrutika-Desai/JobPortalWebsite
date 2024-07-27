package com.demo;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Update")

public class UpdateJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");  
        PrintWriter out=resp.getWriter();  
          

		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("description");

			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			
			HttpSession session = req.getSession();
			
        
			int stat = JobDao. updatejob(j);
			if (stat > 0) {
				session.setAttribute("msg", "job update successfully");
				resp.sendRedirect("viewjob.jsp");
			} else {
				session.setAttribute("msg", "something went wrong");
				resp.sendRedirect("viewjob.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		out.close();
	}

}
