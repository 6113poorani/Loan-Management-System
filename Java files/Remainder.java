package com.loans;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;



/**
 * Servlet implementation class Remainder
 */
@WebServlet("/Remainder")
public class Remainder extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession se = request.getSession();
		  ResultSet rsb=null;
		  Connection  conb=null;
		  PreparedStatement ps=null;
		  String queryb="select * from lender where bstatus='approved' ";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	conb=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 ps=conb.prepareStatement(queryb);
		  	
		  	 
		  	 rsb=ps.executeQuery();
		  	rsb.next();
		  	String appdate=rsb.getString(10);
		  	String[] appdate1=appdate.split("-");
		  	String date1=""+appdate1[2];
		  	String[] appdate2=date1.split(" ");
			//System.out.print(appdate2[0]);
		  	int d1=Integer.parseInt(appdate2[0]);
			 LocalDate currentDate = LocalDate.now();
			 System.out.println("Current Date: " + currentDate);
		        // Format the date (optional)
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        String formattedDate = currentDate.format(formatter);
		        String[] formattedDate1 = formattedDate.split("-");

		        // Print the current date
		       // System.out.println("Current Date: " + formattedDate1[2]);
		    	int d2=Integer.parseInt(formattedDate1[2]);
		    	
		    	
		    	  LocalTime currentTime = LocalTime.now();

		          // Format the time using DateTimeFormatter
		          DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("HH:mm:ss");
		          String formattedTime = currentTime.format(formatter1);

		          // Print the current time
		          System.out.println("Current Time: " + formattedTime);
		         if(formattedTime.equals("09:00:00")) {
		          System.out.println(d1-d2);
		    	if(d1-d2==1||d1-d2==2) {
		    	  	String bid=rsb.getString(1);
		    	  	String lid=rsb.getString(2);
		    	  String dla=rsb.getString(3);
		    	  notification(request,response,bid,dla,lid);
		    	  
		    	}
		         }
		  	
		  
		  }
		  catch(Exception e){
			  e.printStackTrace();
		  } 
				
	}
	static void notification(HttpServletRequest request, HttpServletResponse response,String bid,String amount,String lid) throws ServletException, IOException {
		HttpSession se = request.getSession();
		  ResultSet rsb=null;
		  Connection  conb=null;
		  PreparedStatement ps=null;
		  String queryb="select * from users where utype=3 and id=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	conb=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 ps=conb.prepareStatement(queryb);
		  	 ps.setString(1,bid);
		  	 
		  	 rsb=ps.executeQuery();
		  	rsb.next();
		  	 String bemail=rsb.getString(3);
		  	 se.setAttribute("email",bemail);
		  
		  }
		  catch(Exception e){
			  e.printStackTrace();
		  } String email = String.valueOf(se.getAttribute("email"));		
			RequestDispatcher dispatcher = null;
			
			HttpSession mySession = request.getSession();
			
			if(email!=null || !email.equals("")) {
				

				String to = email;// change accordingly
				// Get the session object
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("pooranivijayan2111@gmail.com", "njrk kavy rsvu lyum");// Put your email
																										// id and
																										// password here
					}
				});
				// compose message
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(email));// change accordingly
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject("Remainder for Loan");
					message.setText("You have to pay a interest for a loan of "+amount+" to the lender of  "+lid+"\n Thank You");
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}	
	
	
	
	
	
	
			
}


