package com.loans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


/**
 * Servlet implementation class Registration
 */
@WebServlet("/Apply")
public class Apply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String dla=request.getParameter("amount");
			String ai=request.getParameter("ai");
			String lf=request.getParameter("lf");
			String month=request.getParameter("months");
			String ri=request.getParameter("rate");
			HttpSession session=request.getSession();
			String bid=String.valueOf(session.getAttribute(("boid")));
			
			String lname=request.getParameter("lname");
			
			
			String months=String.valueOf(Integer.parseInt(month));
			notification(request,response,lname,bid,dla,lf,months);
			selfnotification(request,response,lname,bid,dla,lf,months);
			String lid=String.valueOf(session.getAttribute(("lid")));
			RequestDispatcher dispatcher=null;
			Connection con=null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				 PreparedStatement pst=con.prepareStatement("insert into lender(bid,lid,dla,ai,lf,months) values(?,?,?,?,?,?)");
				pst.setString(1,bid);
				pst.setString(2,lid);
				pst.setString(3,dla);
				pst.setString(4,ai);
				pst.setString(5,lf);
				pst.setString(6,months);
				session.setAttribute("lenid", lid);
				
				int rowCount=pst.executeUpdate();
				
				len(request,response,lid,bid);
				
				String fback=String.valueOf(session.getAttribute("fback"));
				String cri=String.valueOf(session.getAttribute("cri"));
				System.out.print(fback);
				System.out.print(cri);

				int d=Integer.parseInt(dla);
				int c=0;
				if(cri.equals("null"))
				c=0;
				else
				 c=Integer.parseInt(cri);
				
				if(fback.equals("good")&&c>=d) {
				 automaticapp(request,response,lid,bid,dla);
				 bor(request,response,bid,lid,dla,months,ri);
				}
				dispatcher=request.getRequestDispatcher("Newloan.jsp");
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
	
	static void len(HttpServletRequest request, HttpServletResponse response,String lid,String bid) throws ServletException, IOException {
		
		
		HttpSession se=request.getSession();
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("select * from users,lender where lender.lid=? and lender.bid=? and lender.lstatus='completed' and users.id=?");
				pst.setString(1,lid);
				pst.setString(2,bid);
				pst.setString(3,lid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()) {
			      se.setAttribute("fback",rs.getString("feedback"));
					System.out.print(rs.getString("approval"));

			      se.setAttribute("cri",rs.getString("approval"));
			    
			      

			     
				}
			
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	

	

	
	static void automaticapp(HttpServletRequest request, HttpServletResponse response,String lid,String bid,String amount) throws ServletException, IOException {
	
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
				PreparedStatement pst=con.prepareStatement("update  lender  set bstatus='approved' WHERE bid=? and lid=? and dla=?");
				pst.setString(1,bid);
				pst.setString(2,lid);
				pst.setString(3,amount);
				int rs= pst.executeUpdate();
				if(rs>0) {
					notifiautomaticbor(request,response,lid,bid,amount);
					notifiautomaticlen(request,response,lid,bid,amount);
				}
				 
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	static void notifiautomaticbor(HttpServletRequest request, HttpServletResponse response,String lid,String bid,String dla) throws ServletException, IOException {
		HttpSession se = request.getSession();
		ResultSet rst=null;
		  Connection  cont=null;
		  PreparedStatement pstt=null;
		  String queryt="select * from users where utype=3 and id=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	cont=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 pstt=cont.prepareStatement(queryt);
		  	 pstt.setString(1,bid);
		  	 
		  	 rst=pstt.executeQuery();
		  	rst.next();
		  	 String email=rst.getString(3);
		  	 String id=rst.getString(1);
		  	se.setAttribute("bid", id);
		  
		  	se.setAttribute("bemail", email);
		  }
		  catch(Exception e){
			  e.printStackTrace();
		  }  
		String email = String.valueOf(se.getAttribute("bemail"));	
		
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
				message.setSubject("AutoApproval from Lender");
				message.setText("Your loan was Auto Approved by a lender of "+lid+"(lenderid)"+" for the amount of "+dla+"\n\n\nThank You");
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
	
	}
	}
	
	static void bor(HttpServletRequest request, HttpServletResponse response,String bid,String leid,String amountrec,String months,String interest) throws ServletException, IOException {
		
	
		
		
		
		Connection con=null;
	int p=Integer.parseInt(amountrec);
	int r=Integer.parseInt(interest);
	int n=Integer.parseInt(months);
	int ans=(p*n*r)/100;
	ans+=Integer.parseInt(amountrec);
	ans/=n;
	String mi=String.valueOf(ans);
	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			PreparedStatement pst=con.prepareStatement("insert into borrower(bid,lid,amountrec,interest,months) values(?,?,?,?,?)");
			pst.setString(1,bid);
			pst.setString(2,leid);
			pst.setString(3,amountrec);
			pst.setString(4,mi);
			pst.setString(5,months);
			
			int rowCount=pst.executeUpdate();
			
			
				
			
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


static void notifiautomaticlen (HttpServletRequest request, HttpServletResponse response,String lid,String bid,String dla) throws ServletException, IOException {
	HttpSession se = request.getSession();
	ResultSet rst=null;
	  Connection  cont=null;
	  PreparedStatement pstt=null;
	  String queryt="select * from users where utype=2 and id=?";
	  try{
		 
	  	Class.forName("com.mysql.cj.jdbc.Driver");
	  	cont=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	  	
	  	 pstt=cont.prepareStatement(queryt);
	  	 pstt.setString(1,lid);
	  	 
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
			message.setSubject("AutoApproval for  borrower");
			message.setText("The loan for "+bid+" for the amount of "+dla+" was auto approved "+"\n\n\nThank You");
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
		String ao=request.getParameter("Amount-Offer");
		String lt=request.getParameter("ltype");
		HttpSession session=request.getSession();
		session.setAttribute("ao",ao);
		session.setAttribute("lt",lt);

		 RequestDispatcher dispatcher=request.getRequestDispatcher("Newloan.jsp");
		 dispatcher.forward(request, response);
	
	}
	
	
	
	static void notification(HttpServletRequest request, HttpServletResponse response,String lname,String bid,String dla,String lf,String month) throws ServletException, IOException {
		HttpSession se = request.getSession();
		ResultSet rst=null;
		  Connection  cont=null;
		  PreparedStatement pstt=null;
		  String queryt="select * from users where utype=2 and uname=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	cont=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 pstt=cont.prepareStatement(queryt);
		  	 pstt.setString(1,lname);
		  	 
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
				message.setSubject("Request from borrower");
				message.setText("you Have new request for loan from borrower of ID "+bid+" for the amont of "+dla+" in the type of "+lf+" loan "+"\n\nThey wish to pay a interest for a month of "+month+"\n\n\nThank You");
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
	
	}
	}
	static void selfnotification(HttpServletRequest request, HttpServletResponse response,String lname,String bid,String dla,String lf,String month) throws ServletException, IOException {
		HttpSession se = request.getSession();
		ResultSet rst=null;
		  Connection  cont=null;
		  PreparedStatement pstt=null;
		  String queryt="select * from users where utype=3 and id=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	cont=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 pstt=cont.prepareStatement(queryt);
		  	 pstt.setString(1,bid);
		  	 
		  	 rst=pstt.executeQuery();
		  	rst.next();
		  	 String email=rst.getString(3);
		  
		  	
		  
		  	se.setAttribute("bemail", email);
		  }
		  catch(Exception e){
			  e.printStackTrace();
		  }  
		String email = String.valueOf(se.getAttribute("bemail"));	
		
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
				message.setSubject("Request To Lender");
				message.setText("you Have sent new request for loan to lender of  "+lname+" for the amont of "+dla+" in the type of "+lf+" loan "+"\n\nYou wish to pay a interest for a month of "+month+"\n\n\nThank You");
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
