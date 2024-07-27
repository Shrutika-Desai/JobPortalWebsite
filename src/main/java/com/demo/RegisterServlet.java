package com.demo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adduser")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			String qualification=req.getParameter("qualification");
			
			
			
			
			UserDao.getConnection();
			
			User u=new User(name,email,password,qualification,"user");
			
            HttpSession session=req.getSession();
			
			
			int stat=UserDao.saveUser(u);
			if(stat >0)
			{
				session.setAttribute("msg", "Registration Successfully");
				resp.sendRedirect("signup.jsp");
			}
			else
			{
				session.setAttribute("msg", "something went wrong");
				resp.sendRedirect("signup.jsp");

				
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
