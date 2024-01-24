package com.loans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Loginbor")
public class Loginbor extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String unemail=request.getParameter("username");
		String pass=request.getParameter("password");
		
		HttpSession se=request.getSession();
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users where email=? and pass=? and utype=3");
				pst.setString(1,unemail);
				pst.setString(2,pass);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
					se.setAttribute("name",rs.getString("uname"));
				    se.setAttribute("email",rs.getString("email"));
				    se.setAttribute("gen",rs.getString("gender"));
				      se.setAttribute("mob",rs.getString("mob"));
				      se.setAttribute("id",rs.getInt("id"));
				      se.setAttribute("occ",rs.getString("occupation"));
				     se.setAttribute("income",rs.getString("approval"));

				      se.setAttribute("add",rs.getString("address"));
				      se.setAttribute("city",rs.getString("city"));
				      se.setAttribute("state",rs.getString("state"));
				      se.setAttribute("con",rs.getString("country"));
				      se.setAttribute("pincode",rs.getString("pin_code"));
			      dispatcher=request.getRequestDispatcher("borrowers.jsp");
				}
				else {
					request.setAttribute("status", "failed");
				      dispatcher=request.getRequestDispatcher("loginbor.jsp");
				      }
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adharid=request.getParameter("adharid");
		int id=Integer.parseInt(adharid);
		RequestDispatcher dispatcher=null;
		int adharId=0;
		String adharfile=null;
		String panfile=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				Statement pst;
				String query="select * from users";	
				pst=con.createStatement();
				ResultSet rs=pst.executeQuery(query);
				while(rs.next()) {
				if(rs.getInt("id")==id) {
					
					adharId=rs.getInt("id");
					adharfile=rs.getString("adharfile");
					panfile=rs.getString("panfile");
				}}
		      
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("adharid",	String.valueOf(adharId));
		request.setAttribute("adhar",	adharfile);
		request.setAttribute("pan",	panfile);
		dispatcher=request.getRequestDispatcher("Adhar.jsp");
		
		dispatcher.forward(request, response);
	
	}
}
