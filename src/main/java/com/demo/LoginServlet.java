package com.demo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			String email=req.getParameter("email");
			String pass=req.getParameter("password");
			User u=new User();
			HttpSession session =req.getSession();
			
			if("admin@gmail.com".equals(email) && "admin123".equals(pass))
			{
				
				session.setAttribute("userobj",u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}
			else
			{
				
				UserDao dao=new UserDao(UserDao.getConnection());
				 User user=dao.login(email, pass);
				
				
				if(user!=null)
				{
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				}
				else
				{
					session.setAttribute("msg", "Invalid Email and pass");
					resp.sendRedirect("login.jsp");
				}
				 
			}
		

			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
