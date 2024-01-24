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


@WebServlet("/Loginlen")
public class Loginlen extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String unemail=request.getParameter("username");
		String pass=request.getParameter("password");
		
		HttpSession se=request.getSession();
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users where email=? and pass=? and utype=2");
				pst.setString(1,unemail);
				pst.setString(2,pass);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
					se.setAttribute("name",rs.getString("uname"));
				      se.setAttribute("email",rs.getString("email"));
				      se.setAttribute("mob",rs.getString("mob"));
				      se.setAttribute("gen",rs.getString("gender"));
				      se.setAttribute("add",rs.getString("address"));
				      se.setAttribute("con",rs.getString("country"));
				      se.setAttribute("occ",rs.getString("occupation"));
				   
				      se.setAttribute("city",rs.getString("city"));
				      se.setAttribute("state",rs.getString("state"));
				     
				      se.setAttribute("pincode",rs.getString("pin_code"));
				      se.setAttribute("id",rs.getInt("id"));
				      String lid=String.valueOf(rs.getInt("id"));
				     
				      
			      dispatcher=request.getRequestDispatcher("lenders.jsp");
				}
				else {
					request.setAttribute("status", "failed");
				      dispatcher=request.getRequestDispatcher("loginlen.jsp");
				      }
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String bid=request.getParameter("bid");
		String amount=request.getParameter("amount");
		String f2=request.getParameter("f2");
		
		HttpSession se=request.getSession();
		String lid=String.valueOf(se.getAttribute("lid"));
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("update  lender  set feedback=? WHERE bid=? and lid=?");
				pst.setString(1,f2);
				pst.setString(2,bid);
				pst.setString(3,lid);
				 pst.executeUpdate();
				
					
				  	request.setAttribute("feed", "success");
			      dispatcher=request.getRequestDispatcher("lenders.jsp");
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
