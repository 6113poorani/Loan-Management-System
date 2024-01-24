package com.loans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Admin")
public class Admin extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;






	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("userid");
		String email=request.getParameter("email");
		
		HttpSession se=request.getSession();
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users where email=? and id=? and utype=3");
				pst.setString(1,email);
				pst.setString(2,uid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
			      se.setAttribute("name",rs.getString("uname"));
			      se.setAttribute("email",rs.getString("email"));
			      se.setAttribute("mob",rs.getString("mob"));
			      se.setAttribute("id",rs.getInt("id"));
			      se.setAttribute("gen",rs.getString("gender"));
			      se.setAttribute("occ",rs.getString("occupation"));
			      se.setAttribute("add",rs.getString("address"));
			      se.setAttribute("city",rs.getString("city"));
			      se.setAttribute("state",rs.getString("state"));
			      se.setAttribute("pincode",rs.getString("pin_code"));
			      se.setAttribute("con",rs.getString("country"));
			      dispatcher=request.getRequestDispatcher("adminsub.jsp");
				}
				else {
					request.setAttribute("status", "failed");
				      dispatcher=request.getRequestDispatcher("index.jsp");
				      }
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("userid");
		String email=request.getParameter("email");
		
		HttpSession se=request.getSession();
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users where email=? and id=? and utype=2");
				pst.setString(1,email);
				pst.setString(2,uid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
			      se.setAttribute("name",rs.getString("uname"));
			      se.setAttribute("email",rs.getString("email"));
			      se.setAttribute("mob",rs.getString("mob"));
			      se.setAttribute("id",rs.getInt("id"));
			      se.setAttribute("gen",rs.getString("gender"));
			      se.setAttribute("occ",rs.getString("occupation"));
			      se.setAttribute("add",rs.getString("address"));
			      se.setAttribute("city",rs.getString("city"));
			      se.setAttribute("state",rs.getString("state"));
			      se.setAttribute("pincode",rs.getString("pin_code"));
			      se.setAttribute("con",rs.getString("country"));
			      dispatcher=request.getRequestDispatcher("adminlen.jsp");
				}
				else {
					request.setAttribute("status", "failed");
				      dispatcher=request.getRequestDispatcher("index.jsp");
				      }
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
