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


@WebServlet("/Lenloan")
public class Lenloan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String lid=request.getParameter("lid");
		String ltype=request.getParameter("ltype");
		String amount=request.getParameter("amount");
		String interest=request.getParameter("interest");
		
		System.out.print(lid);
		
		RequestDispatcher dispatcher=null;
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			
			PreparedStatement pst=con.prepareStatement("insert into lentwo(lid,ltype,amount,interest) values(?,?,?,?)");
			pst.setString(1,lid);
			pst.setString(2,ltype);
			pst.setString(3,amount);
			pst.setString(4,interest);
			
			int rowCount=pst.executeUpdate();
			dispatcher=request.getRequestDispatcher("lenders.jsp");
			if(rowCount>0) {
				request.setAttribute("add", "success");
				
			}
			else {
				request.setAttribute("add", "failed");
				
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String leid=String.valueOf(session.getAttribute(("lid")));
			String old_ltype=request.getParameter("old_ltype");
			String old_amount=request.getParameter("old_amount");
			String old_rate=request.getParameter("old_rate");

			String ltype=request.getParameter("ltype");

				String amount=request.getParameter("amount");
				String interest=request.getParameter("interest");
			
		System.out.print("update");
		System.out.println(leid);
		System.out.println(old_ltype);

		System.out.println(old_amount);
		//System.out.print(interest);
		
				Connection  cond=null;
				PreparedStatement pstd=null;
				RequestDispatcher dispatcher=null;
				
				try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					cond=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
					 pstd=cond.prepareStatement("update lentwo set  amount=?,interest=? where lid=? and ltype=? and amount=? and interest=?");
					 
					 pstd.setString(1,amount);
					 pstd.setString(2,interest);
					 pstd.setString(3,leid);
					 pstd.setString(4,old_ltype);
					 pstd.setString(5,old_amount);
					 pstd.setString(6,old_rate);

					 int rowCount= pstd.executeUpdate();
					
					 dispatcher=request.getRequestDispatcher("lenders.jsp");
					 if(rowCount>0) {
							request.setAttribute("edit", "success");
							
						}
						else {
							request.setAttribute("edit", "failed");
							
						}
					 dispatcher.forward(request, response);
				}
				catch(Exception e){
					  e.printStackTrace();
				}
		}
		
		
	

}
