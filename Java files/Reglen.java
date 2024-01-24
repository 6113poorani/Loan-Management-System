package com.loans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Reglen")
public class Reglen extends HttpServlet {
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
		String pin_code=request.getParameter("pincode");
		String mob=request.getParameter("contact");
		
	
		String approval=request.getParameter("app");
		
		HttpSession se=request.getSession();

			RequestDispatcher dispatcher=null;
			Connection con=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/LOAN?useSSL=false","root","Pooraniv@213");
				 PreparedStatement pst=con.prepareStatement("insert into users(uname,email,gender,pass,occupation,address,city,state,country,pin_code,mob,approval,utype) values(?,?,?,?,?,?,?,?,?,?,?,?,2)");
				 pst.setString(1,uname);
					pst.setString(2,email);
					pst.setString(3,gender);
					pst.setString(4,pass);
					pst.setString(5,occupation);
					pst.setString(6,address);
					pst.setString(7,city);
					pst.setString(8,state);
					pst.setString(9,country);
					pst.setString(10,pin_code);
					pst.setString(11,mob);
					pst.setString(12,approval);
					
					
					

				int rowCount=pst.executeUpdate();
			
				
				
				if(rowCount>0) {
					request.setAttribute("status", "success");
					
				}
				else {
					request.setAttribute("status", "failed");
					
				}
				dispatcher=request.getRequestDispatcher("reglen.jsp");
				dispatcher.forward(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					con.close();
				} catch (SQLException e) {
				
					e.printStackTrace();
				}
			}
			
			}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher=null;

					
					
					
		HttpSession session=request.getSession();

		session.setAttribute("name","null");
				
					
				
				dispatcher=request.getRequestDispatcher("firstpage.jsp");
				dispatcher.forward(request, response);
			
			
			}
	
	
	

}
