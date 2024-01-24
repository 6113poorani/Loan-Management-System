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

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false", "root",
						"Pooraniv@213");
				PreparedStatement pst = con.prepareStatement("update users set pass = ? where email = ?  ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));
				String email=(String) session.getAttribute("email");
				String type=(String)find(request,response,email);
				
				int rowCount = pst.executeUpdate();
				if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
				if (rowCount > 0) {
					request.setAttribute("statu", "resetSuccess");
					if(type.equals("1"))
					dispatcher = request.getRequestDispatcher("login.jsp");
					else if(type.equals("2"))
						dispatcher = request.getRequestDispatcher("loginlen.jsp");
					else if(type.equals("3"))
						dispatcher = request.getRequestDispatcher("loginbor.jsp");
					
				} }else {
					request.setAttribute("statu", "resetFailed");
					if(type.equals("1"))
						dispatcher = request.getRequestDispatcher("login.jsp");
						else if(type.equals("2"))
							dispatcher = request.getRequestDispatcher("loginlen.jsp");
						else if(type.equals("3"))
							dispatcher = request.getRequestDispatcher("loginbor.jsp");
					
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}
	static String find(HttpServletRequest request, HttpServletResponse response,String email)
			throws ServletException, IOException {
		HttpSession se=request.getSession();
		RequestDispatcher dispatcher=null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users where email=?");
				pst.setString(1,email);
				
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
				      return rs.getString("utype");
				      
				}
				return "0";
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "0";

}
}
