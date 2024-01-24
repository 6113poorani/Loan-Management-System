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


/**
 * Servlet implementation class Approve
 */
@WebServlet("/Approve")
public class Approve extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<String> am=new ArrayList<>();
	List<String> pm=new ArrayList<>();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid=request.getParameter("bid");
		String amountrec=request.getParameter("amount");
		String interest=request.getParameter("ri");
		HttpSession session=request.getSession();
		String leid=String.valueOf(session.getAttribute(("lid")));
		
		String months=request.getParameter("month");
		RequestDispatcher dispatcher=null;
	
		notification(request,response,bid,amountrec,leid);
		selfnotification(request,response,bid,amountrec,leid);
		update(request,response,bid,amountrec,leid);
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
			session.setAttribute("bid",bid);
			dispatcher=request.getRequestDispatcher("lenders.jsp");
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
					message.setSubject("Approval from Lender");
					message.setText("Congrats! Your loan was approved by a lender of "+lid+"(Id) for the amount of "+amount+"\n Thank You");
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}
	static void selfnotification(HttpServletRequest request, HttpServletResponse response,String bid,String amount,String lid) throws ServletException, IOException {
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
					message.setSubject("Approval for Borrower");
					message.setText(" The loan was approved for a borrower of "+bid+"(Id) for the amount of "+amount+"\n Thank You");
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}
	static void update(HttpServletRequest request, HttpServletResponse response,String bid,String amountrec,String leid) throws ServletException, IOException {
		
		Connection  cond=null;
		PreparedStatement pstd=null;
		String queryd="update  lender  set bstatus='approved' WHERE bid=? and dla=? and lid=?";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			cond=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			 pstd=cond.prepareStatement(queryd);
			 pstd.setString(1,bid);
			 pstd.setString(2,amountrec);
			 pstd.setString(3,leid);
			 
			 pstd.executeUpdate();
			 
		}
		catch(Exception e){
			  e.printStackTrace();
		}
		}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lid=request.getParameter("id");
		int emi=Integer.parseInt(request.getParameter("in"));
		String tpm=request.getParameter("paid");
		int paid=(Integer.parseInt(request.getParameter("paid")));
		String paided=request.getParameter("paided");
		String la=request.getParameter("lamount");
	String ai=request.getParameter("ai");
	String  months=request.getParameter("months");
	String  tmon=request.getParameter("tmonths");
		HttpSession session=request.getSession();
		String bid=String.valueOf(session.getAttribute(("bid")));
		int monthss=Integer.parseInt(months);
		String full=String.valueOf(emi*monthss);
		int apaided;
		if(paided=="null")
			 apaided=0;
		else
			 apaided=Integer.parseInt(paided);
		
		String pamount=String.valueOf(paid+apaided);
		
		int tm;
		if(tmon=="null")
			 tm=0;
		else
			tm=Integer.parseInt(tmon);
		
		String total=String.valueOf(tm+1);
		LocalDate currentDate = LocalDate.now();

        // Format the date (optional)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);

        // Print the current date
        System.out.println("Current Date: " + formattedDate);
        //total.equals(months)||
		if(pamount.equals(full)) {
			deleteloan(request,response,bid,la,lid);
			updatelen(request,response,bid,la,lid);
			notifiloan(request,response,bid,la,lid);
			selfnotifiloan(request,response,bid,la,lid);

			RequestDispatcher dispatcher=request.getRequestDispatcher("borrowers.jsp");
				request.setAttribute("stat", "success");
		}
		String bname=String.valueOf(session.getAttribute(("bname")));
		System.out.print(bname);
		RequestDispatcher dispatcher=null;
		
		
	if(paided.equals("0") ){
		 am=new ArrayList<>();
		 pm=new ArrayList<>();
		 
		}
		else {
			
			
			
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
					PreparedStatement pst=con.prepareStatement("select * from borrower where bid=? and lid=? and amountrec=?");
					pst.setString(1,bid);
					pst.setString(2,lid);
					pst.setString(3,la);
					ResultSet rs=pst.executeQuery();
					if(rs.next()) {
						//session.setAttribute("date",rs.getString("dates"));
						String[] array=rs.getString("dates").split(",");
						am=new ArrayList<>();
						 for(String text:array) {
					         am.add(text);
					      }
						 String[] arrays=rs.getString("dpaid").split(",");
							pm=new ArrayList<>();
							 for(String text:arrays) {
						         pm.add(text);
						      }
					    
					}
					
			} 
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
		
		
		}
		am.add(formattedDate);
		String date="";
		 for(String txt:am) {
			 if(date.equals("")) { date+=txt;}
		 else {
		date+=","+txt;}}
		
		pm.add(tpm);
		String dpaid="";
		 for(String txt:pm) {
			 if(dpaid.equals("")) { dpaid+=txt;}
			 else {
		dpaid+=","+txt;}}
		
		Connection con=null;
		notifipaid(request,response,lid,bname,ai,total,la);
		selfnotifipaid(request,response,lid,bname,ai,total,la);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			PreparedStatement pst=con.prepareStatement("update borrower set tmonths=?,dates=?,payment=?,dpaid=?  where bid=? and lid=? and amountrec=?");
			pst.setString(1,total);
			pst.setString(2,date);
			pst.setString(3,pamount);
			pst.setString(4,dpaid);
			pst.setString(5,bid);
			pst.setString(6,lid);
			pst.setString(7,la);
			
			int rowCount=pst.executeUpdate();
			session.setAttribute("bid",bid);
			dispatcher=request.getRequestDispatcher("borrowers.jsp");
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

		
	

static void deleteloan(HttpServletRequest request, HttpServletResponse response,String bid,String amountrec,String leid) throws ServletException, IOException {
		
		Connection  cond=null;
		PreparedStatement pstd=null;
		String queryd="DELETE FROM borrower WHERE bid=? and amountrec=? and lid=?";
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			cond=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
			 pstd=cond.prepareStatement(queryd);
			 pstd.setString(1,bid);
			 pstd.setString(2,amountrec);
			 pstd.setString(3,leid);
			 
			 pstd.executeUpdate();
			 
		}
		catch(Exception e){
			  e.printStackTrace();
		}
		}
static void updatelen(HttpServletRequest request, HttpServletResponse response,String bid,String amountrec,String leid) throws ServletException, IOException {
	
	Connection  cond=null;
	PreparedStatement pstd=null;
	String queryd="update lender set lstatus='completed' WHERE bid=? and  lid=?";
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		cond=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		 pstd=cond.prepareStatement(queryd);
		 pstd.setString(1,bid);
		 pstd.setString(2,leid);
		 
		 pstd.executeUpdate();
		 
	}
	catch(Exception e){
		  e.printStackTrace();
	}
	}
static void notifiloan(HttpServletRequest request, HttpServletResponse response,String bid,String amount,String lid) throws ServletException, IOException {
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
				message.setSubject("Loan Completed");
				message.setText("Congrats! The borrower of "+bid+"(Id) for the amount of "+amount+"loan was completed Successfully!"+"\n\n Kindly fill up the feedback form"+"\nBased on this only the automatic approval loan process will be happen."+"\n\n Thank You");
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
		
		}
		

}

static void selfnotifiloan(HttpServletRequest request, HttpServletResponse response,String bid,String amount,String lid) throws ServletException, IOException {
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
				message.setSubject("Loan Completed");
				message.setText("Congrats! You finished your loan for the amount of "+amount+"to the lender of Lender AccountNumber "+lid+"\n\nloan was completed Successfully!\n\n Thank You");
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
		
		}
		

}
	static void notifipaid(HttpServletRequest request, HttpServletResponse response,String lid,String bname,String ai,String total,String la) throws ServletException, IOException {
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
					message.setSubject("Amount from Borrower");
					message.setText("The borrower "+bname+" paid a interest of "+ai+" for the amount of "+la+" for the month of "+total);
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
			
			}
			
	
	}
	static void selfnotifipaid(HttpServletRequest request, HttpServletResponse response,String lid,String bname,String ai,String total,String la) throws ServletException, IOException {
		HttpSession se = request.getSession();
		  ResultSet rsb=null;
		  Connection  conb=null;
		  PreparedStatement ps=null;
		  String queryb="select * from users where utype=3 and uname=?";
		  try{
			 
		  	Class.forName("com.mysql.cj.jdbc.Driver");
		  	conb=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
		  	
		  	 ps=conb.prepareStatement(queryb);
		  	 ps.setString(1,bname);
		  	 
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
					message.setSubject("Amount To Lender");
					message.setText("You paid a interest of "+ai+" for the amount of "+la+" for the month of "+total+"to the lender "+lid+"(ID)\n\n\nThank YOu");
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
