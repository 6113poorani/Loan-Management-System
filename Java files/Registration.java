package com.loans;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Registration
 */
@MultipartConfig
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		
		
		String pass=request.getParameter("password");
		String occupation=request.getParameter("occupation");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String pincode=request.getParameter("pincode");
		String mob=request.getParameter("contact");
		
		
		
		
		RequestDispatcher dispatcher=null;
			Connection con=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				 PreparedStatement pst=con.prepareStatement("insert into users(uname,email,gender,pass,occupation,address,city,state,country,pin_code,mob,utype) values(?,?,?,?,?,?,?,?,?,?,?,1)");
				 pst.setString(1,uname);
					pst.setString(2,email);
					pst.setString(3,gender);
				
					pst.setString(4,pass);
					pst.setString(5,occupation);
					pst.setString(6,address);
					pst.setString(7,city);
					pst.setString(8,state);
					pst.setString(9,country);
					pst.setString(10,pincode);
					pst.setString(11,mob);
					
				int rowCount=pst.executeUpdate();
				dispatcher=request.getRequestDispatcher("registration.jsp");
				if(rowCount>0) {
					request.setAttribute("status", "success");
					
				}
				else {
					request.setAttribute("status", "failed");
					
				}
				dispatcher.forward(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			}

	
	

}
