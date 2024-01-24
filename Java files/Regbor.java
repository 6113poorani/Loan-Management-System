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
import javax.servlet.http.Part;

/**
 * Servlet implementation class Registration
 */
@MultipartConfig
@WebServlet("/Regbor")
public class Regbor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String income=request.getParameter("income");

		String pass=request.getParameter("password");
		String occupation=request.getParameter("occupation");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String pincode=request.getParameter("pincode");
		String mob=request.getParameter("contact");
		
		Part adhar=request.getPart("adhar");
		Part pan=request.getPart("pan");
		String adharname=adhar.getSubmittedFileName();//get selected adhar  file
		String panname=pan.getSubmittedFileName();
		String uploadadhar="C:/Users/Poorani/eclipse-workspace/server/UTUBE/src/main/webapp/images/"+adharname;
		String uploadpan="C:/Users/Poorani/eclipse-workspace/server/UTUBE/src/main/webapp/images/"+panname;
		System.out.print(uploadadhar);
		try {
		FileOutputStream adharfos=new FileOutputStream(uploadadhar);
		FileOutputStream panfos=new FileOutputStream(uploadpan);
		InputStream adharis=adhar.getInputStream();
		InputStream panis=pan.getInputStream();
		byte[] adhardata=new byte[adharis.available()];
		byte[] pandata=new byte[panis.available()];
		adharis.read(adhardata);
		panis.read(pandata);
		adharfos.write(adhardata);
		panfos.write(pandata);
		adharfos.close();
		panfos.close();}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher=null;
			Connection con=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				 PreparedStatement pst=con.prepareStatement("insert into users(uname,email,gender,dob,pass,occupation,address,city,state,country,pin_code,mob,adharfile,PANfile,utype,approval) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,3,?)");
				 pst.setString(1,uname);
					pst.setString(2,email);
					pst.setString(3,gender);
					pst.setString(4,dob);
					pst.setString(5,pass);
					pst.setString(6,occupation);
					pst.setString(7,address);
					pst.setString(8,city);
					pst.setString(9,state);
					pst.setString(10,country);
					pst.setString(11,pincode);
					pst.setString(12,mob);
					pst.setString(13,adharname);
					pst.setString(14,panname);
					pst.setString(15,income);

				int rowCount=pst.executeUpdate();
				dispatcher=request.getRequestDispatcher("regbor.jsp");
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
					if (con == null) {
				        return;
				    }
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			}
}
			
			

	
	


