package com.demo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")

public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			int stat = JobDao.deletejob(id);

			HttpSession session = req.getSession();

			if (stat > 0) {
				session.setAttribute("msg", "JOB DELETED SUCCESFULLY");
				resp.sendRedirect("viewjob.jsp");
			} else {
				session.setAttribute("msg", "something went wrong");
				resp.sendRedirect("viewjob.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
