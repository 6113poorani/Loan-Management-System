package com.loans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Reject")
public class Reject extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid=request.getParameter("bid");
		String amountrec=request.getParameter("amount");
		HttpSession session=request.getSession();
		String leid=String.valueOf(session.getAttribute(("lid")));
		Connection  cond=null;
		PreparedStatement pstd=null;
		RequestDispatcher dispatcher=null;
		notification(request,response,bid,amountrec,leid);
		selfnotification(request,response,bid,amountrec,leid);
		String queryd="DELETE FROM lender WHERE bid=? and dla=? and lid=?";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			cond=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			 pstd=cond.prepareStatement(queryd);
			 pstd.setString(1,bid);
			 pstd.setString(2,amountrec);
			 pstd.setString(3,leid);
			 pstd.executeUpdate();
			 request.setAttribute("stat", "success");
			 dispatcher=request.getRequestDispatcher("lenders.jsp");
			 dispatcher.forward(request, response);
		}
		catch(Exception e){
			  e.printStackTrace();
		}
}
	static void notification(HttpServletRequest request, HttpServletResponse response,String bid,String amountrec,String lid) throws ServletException, IOException {
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
					message.setSubject("Reject By Lender");
					message.setText("Sorry! Your loan was  not approved by a lender for the amount of "+amountrec+" by a lenderId "+lid);
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}
	
	
	static void selfnotification(HttpServletRequest request, HttpServletResponse response,String bid,String amountrec,String lid) throws ServletException, IOException {
		HttpSession se = request.getSession();
		  ResultSet rsb=null;
		  Connection  conb=null;
		  PreparedStatement ps=null;
		  String queryb="select * from users where utype=2 and id=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	conb=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 ps=conb.prepareStatement(queryb);
		  	 ps.setString(1,lid);
		  	 
		  	 rsb=ps.executeQuery();
		  	rsb.next();
		  	 String lemail=rsb.getString(3);
		  	 se.setAttribute("email",lemail);
		  
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
					message.setSubject("Reject the Loan");
					message.setText("The loan was  not approved to the Borrower of "+bid+"(ID) for the amount of "+amountrec+"\n\nThank You");
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid=request.getParameter("bid");
		String amountrec=request.getParameter("amount");
		String leid=request.getParameter("lid");
		System.out.print(bid+" "+leid);
		Connection  cond=null;
		PreparedStatement pstd=null;
		RequestDispatcher dispatcher=null;
		notifibor(request,response,bid,amountrec,leid);
		notifilen(request,response,bid,amountrec,leid);
		String queryd="DELETE FROM lender WHERE bid=? and dla=? and lid=?";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			cond=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			 pstd=cond.prepareStatement(queryd);
			 pstd.setString(1,bid);
			 pstd.setString(2,amountrec);
			 pstd.setString(3,leid);
			 pstd.executeUpdate();
			 request.setAttribute("status", "success");
			 dispatcher=request.getRequestDispatcher("index.jsp");
			 dispatcher.forward(request, response);
		}
		catch(Exception e){
			  e.printStackTrace();
		}
}
	static void notifibor(HttpServletRequest request, HttpServletResponse response,String bid,String amountrec,String lid) throws ServletException, IOException {
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
					message.setSubject("Reject By Adim");
					message.setText("Sorry! Your loan was  not approved by a Admin for the amount of "+amountrec+" to a lenderId "+lid);
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}
	static void notifilen(HttpServletRequest request, HttpServletResponse response,String bid,String amount,String leid) throws ServletException, IOException {
		HttpSession se = request.getSession();
		ResultSet rst=null;
		  Connection  cont=null;
		  PreparedStatement pstt=null;
		  String queryt="select * from users where utype=2 and id=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	cont=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 pstt=cont.prepareStatement(queryt);
		  	 pstt.setString(1,leid);
		  	 
		  	 rst=pstt.executeQuery();
		  	rst.next();
		  	 String email=rst.getString(3);
		  	 String id=rst.getString(1);
		  	se.setAttribute("lid", id);
		  
		  	se.setAttribute("lemail", email);
		  }
		  catch(Exception e){
			  e.printStackTrace();
		  }  
		String email = String.valueOf(se.getAttribute("lemail"));	
		
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
				message.setSubject("Reject by Admin");
				message.setText("you Have new request for loan from borrower of ID "+bid+" for the amount of "+amount+" but, that was rejected by Admin");
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
