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


@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String unemail=request.getParameter("username");
		String pass=request.getParameter("password");
		
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users where email=? and pass=? and utype=1");
				pst.setString(1,unemail);
				pst.setString(2,pass);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
					HttpSession session=request.getSession();

					session.setAttribute("name",rs.getString("uname"));
					session.setAttribute("email",rs.getString("email"));
					session.setAttribute("mob",rs.getString("mob"));
			      session.setAttribute("id",rs.getInt("id"));
			      session.setAttribute("gen",rs.getString("gender"));
			      session.setAttribute("add",rs.getString("address"));
			      session.setAttribute("city",rs.getString("city"));
			      session.setAttribute("state",rs.getString("state"));
			      session.setAttribute("con",rs.getString("country"));
			      session.setAttribute("pincode",rs.getString("pin_code"));

			      dispatcher=request.getRequestDispatcher("index.jsp");
				}
				else {
					request.setAttribute("status", "failed");
				      dispatcher=request.getRequestDispatcher("login.jsp");
				      }
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	HttpSession session=request.getSession();
	String leid=String.valueOf(session.getAttribute(("lid")));
		String ltype=request.getParameter("ltype");
		String amount=request.getParameter("amount");
		
		HttpSession se=request.getSession();
		RequestDispatcher dispatcher=null;
		System.out.print("delete");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("DELETE FROM lentwo WHERE lid=? and ltype=? and amount=?");
				pst.setString(1,leid);
				pst.setString(2,ltype);
				pst.setString(3,amount);
				pst.setString(2,ltype);
				int rowCount=pst.executeUpdate();
				      dispatcher=request.getRequestDispatcher("lenders.jsp");
				      if(rowCount>0) {
							request.setAttribute("deleted", "success");
							
						}
						else {
							request.setAttribute("deleted", "failed");
							
						}
				dispatcher.forward(request, response);
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
