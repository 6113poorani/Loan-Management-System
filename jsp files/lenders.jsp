<%System.out.print(session.getAttribute("name"));
if(session.getAttribute("name").equals("null")){
	
	response.sendRedirect("loginlen.jsp");
}

String name=String.valueOf(session.getAttribute("name"));
String email=String.valueOf(session.getAttribute("email"));
String mob=String.valueOf(session.getAttribute("mob"));
String id=String.valueOf(session.getAttribute("id"));
String gen=String.valueOf(session.getAttribute("gen"));
String occ=String.valueOf(session.getAttribute("occ"));
String add=String.valueOf(session.getAttribute("add"));
String city=String.valueOf(session.getAttribute("city"));
String state=String.valueOf(session.getAttribute("state"));
String pincode=String.valueOf(session.getAttribute("pincode"));
String conty=String.valueOf(session.getAttribute("con"));
session.setAttribute("lid",id);

if(name==null){
	response.sendRedirect("loginlen.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <style>

        /* Import Google font - Poppins */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
.sidebar {
  position: fixed;
  height: 100%;
  width: 260px;
  background: #11101d;
  padding: 15px;
  z-index: 99;
}
.logo {
  font-size: 20px;
  padding: 0 5px;
}
.sidebar a {
  color: #fff;
  text-decoration: none;
}
.menu-content {
  position: relative;
  height: 100%;
  width: 100%;
  margin-top: 40px;
  overflow-y: scroll;
}
.menu-content::-webkit-scrollbar {
  display: none;
}
.menu-items {
  height: 100%;
  width: 100%;
  list-style: none;
  transition: all 0.4s ease;
}

.menu-title {
  color: #fff;
  font-size: 14px;
  padding: 15px 20px;
}
.item a{
  padding: 16px;
  display: inline-block;
  width: 100%;
  border-radius: 12px;
}
.item i {
  font-size: 12px;
}
.item a:hover {
  background: rgba(255, 255, 255, 0.1);
}



.navbar,
.main {
  left: 260px;
  width: calc(100% - 260px);
  transition: all 0.5s ease;
  z-index: 1000;
}
.sidebar.close ~ .navbar,
.sidebar.close ~ .main {
  left: 0;
  width: 100%;
}
.navbar {
  position: fixed;
  color: #fff;
  padding: 15px 20px;
  font-size: 25px;
  background: #4070f4;
  cursor: pointer;
}
.navbar #sidebar-close {
  cursor: pointer;
}
.main {
padding-top:100px;
padding-left:20px;
  position: relative;
  height: 2000vh;
  z-index: 100;
  background: #e7f2fd;
}
.main h1 {
  color: #11101d;
  font-size: 40px;
 
}
 
}
.main h1 {
  color: #11101d;
  font-size: 40px;
 
}
.th{
margin-right:-50%;
margin-top:2%;
	font-size: 20px;
    font-weight: 600;
    margin-left:10%;
    line-height:20px;
  }
span{
	
	margin-left:9.5%;
	 
}
.un{margin-left:17%;}.sp{margin-left:15.5%;}.ge{margin-left:16%;}.em{ margin-left:17.3%;}.occ{ margin-left:13%;}
.ci{ margin-left:18.5%;}.st{ margin-left:17.5%;}.pin{ margin-left:15%;}
.pic{height:7%;width:70%;padding-top:1%;padding-left:30%;
} 
.len{margin-left:15%;margin-top:1%; text-decoration:none;} 
.le{padding-left:50px;font-size:15px; font-weight:500;}
.rep{margin-left:35%;margin-top:7%; }
.cl{ margin-left:40%;margin-top:1%;   }
.wa{height:20px;width:20px;margin-left:10px;margin-top:10px;
}
.ap{margin-left:200px;background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 10px;
padding-left: 10px;
padding-right: 10px;
color:white;
}.ap:hover{
background-color:green;}
.re{ margin-left:10px;background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 10px;
padding-left: 13px;
padding-right: 13px;
color:white;
}.re:hover{
background-color:red;}
#loan{margin-top:400px;}#rep{margin-top:400px;}
#feed{
margin-top:400px; 

}
.pic{height:4%;width:70%;padding-top:1%;padding-left:30%; } 

#details{
margin-top:500px; 
}
#addl{ margin-top:500px;}
.container {
  position: relative;
  max-width: 700px;
  width: 50%;
  background: #fff;
  padding: 10px;
  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
 margin-bottom:40px;
  margin-left:250px;
}


.container .form {
  margin-top: 30px;
   margin-left: 70px;
   font-size:20px;
}
.form .input-box {
  width: 50%;
  margin-top: 20px;
   margin-left: 20px;
}
.input-box label {
  color: #333;
}
.form :where(.input-box input, .select-box) {
  position: relative;
  height: 30px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  margin-left: 10px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.radio{
margin-top:-2px;
margin-left:130px;
line-height:30px;
}
.head{margin-left:30px;font-size:20px;
}
.add-btn{margin-left:100px;
background-color:skyblue;
 border: 1px solid #ddd;
 margin-top:5px;
 padding:5px;
 padding-left:10px;
 padding-right:10px;
 border-radius: 6px;
}

.add-btn:hover{
background-color:green; color:white; }
.den{margin-left:15%;margin-top:2%; text-decoration:none;} 
.de{padding-left:50px;font-size:18px; font-weight:500;padding-right:50px;}
.up{margin-left:10px;padding-left:20px;padding-right:20px;margin:10px;
}
.del{margin-left:10px;margin:10px;
}
.del:hover{
background-color:red; color:white; }
.display{background-color:skyblue;border-color:skyblue;border-radius:5px;padding:4px;}
.display:hover{background-color:green;border-color:green;color:white;}
.no{
margin-left:20%;margin-top:12%;}
.diff{font-size:25px; font-weight:20px;}
#logout{border: none;  /* Remove borders */
            background: none;  /* Remove background */
            color: white;  /* Set text color */
            text-decoration: none;  /* Add underline to text */
            cursor: pointer; margin-left:15px;font-size:15px;}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<title>welcome!<%out.print(name); %></title>
</head>
<body>
<nav class="sidebar">
      <a href="#" class="logo">Welcome!<%out.print(name); %></a>

      <div class="menu-content">
        <ul class="menu-items">
          

          <li class="item">
            <a href="#pro">Profile</a>
          </li>
          <li class="item">
            <a href="#details">Loan Details</a>
          </li>
          <li class="item">
            <a href="#req">Loan Request</a>
          </li>
          <li class="item">
            <a href="#loan">Approved Loans</a>
          </li>
          <li class="item">
            <a href="#rep">Reports</a>
          </li>
           <li class="item">
            <a href="#feed">Feedback</a>
          </li>
          <li class="item">
            
            <form action="Reglen"><input type="submit" id="logout" value="Logout" onclick="return confirmLogout()"></form>
            <script>
            function confirmLogout() {
                var confirmLogout = window.confirm("Are you sure you want to log out?");
                if (confirmLogout) {
                  
                    return true;
                    // You can redirect the user to a logout page or perform other actions here
                } else {
                    // User clicked "Cancel" (no), do nothing or handle as needed
                   return false;
                }
            }
    </script>
          </li>
          </div> </nav>

    <nav class="navbar">
      <i class="fa-solid fa-bars" id="sidebar-close"></i>
    </nav>

    <main class="main">
<img class="pic" src="images/lender.avif">
<div class="profile" id="pro"><br><br><br>
           <h2>Your Profile:</h2>
            
               <p class="th">Account Number<span>: <% out.print(id); %></span></p>
               <p class="th">Name<span class="un">: <% out.print(name); %></span></p>
               <p class="th">Gender<span class="ge">: <% out.print(gen); %></span></p>
               <p class="th">Occupation<span class="occ">: <% out.print(occ); %></span></p>
               <p class="th">Email<span class="em">: <%out.print(email); %></span></p>
                <p class="th">Contact<span class="sp">: <% out.print(mob); %></span></p>
               <p class="th">Address<span class="sp">: <% out.print(add); %></span></p>
                 <p class="th">City<span class="ci">: <% out.print(city); %></span></p>
                 <p class="th">State<span class="st">: <% out.print(state); %></span></p>
              <p class="th">Country<span class="sp">:  <% out.print(conty); %></span></p>
               <p class="th">pin code<span class="pin">: <% out.print(pincode); %></span></p>
            </div>


<br>


<div id="req"><br><br><br>
<h2>Loan Request:</h2>

<%@ page import="java.sql.*"  %>
<%
ResultSet rs=null;
Connection  con=null;
PreparedStatement pst=null;
String query="select * from users,lender,lentwo where users.id=lender.bid and lender.bstatus='notapproved' and lender.lid=? and lentwo.lid=? and lender.lf=lentwo.ltype";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	 pst=con.prepareStatement(query);
	 pst.setString(1,id);
	 pst.setString(2,id);
	 rs=pst.executeQuery();
		int i=0;
	 while(rs.next()){
		i++;
	%>
	 <table  class="len" >
	
	
	 <tr ><td class="le diff" >Account Number</td><td class="le diff"  >: <%= rs.getInt(1)%></td></tr>
		 <tr ><td class="le">Name</td><td class="le">: <%= rs.getString(2)%></td></tr>
		  <tr ><td class="le">Gender</td><td class="le">: <%= rs.getString(4)%></td></tr>
		  <tr ><td class="le" >Desired Amount</td><td class="le" >: <%= rs.getString(20)%></td></tr>
		  <tr ><td class="le">Occupation</td><td class="le">: <%= rs.getString(7)%></td></tr>
		 <tr ><td class="le">Email</td><td class="le">: <%= rs.getString(3)%></td></tr>
		 <tr ><td class="le">Contact</td><td class="le">: <%= rs.getString(13)%>
		 </td></tr>
		 <form action="Loginbor">
		 <input type="hidden" name="adharid" id="adharid" value="<%= rs.getInt(1)%>">
		 
		<tr><td class="le">Adhar&Pan</<td><td class="le">: <input type="submit" class ="display" value="Display"></form></td></tr>
			
		
		 <tr ><td class="le">Annual Income</td><td class="le">: <%= rs.getString(21)%></td></tr>
		 <tr ><td class="le">Loan for</td><td class="le">: <%= rs.getString(22)%></td></tr>
		 <tr ><td class="le">Month for Interest</td><td class="le">: <%= rs.getString(23)%></td></tr>
		 <tr ><td class="le">Address</td><td class="le">: <%= rs.getString(8)%></td></tr>
		  <tr ><td class="le">City</td><td class="le">: <%= rs.getString(9)%></td></tr>
		   <tr ><td class="le">State</td><td class="le">: <%= rs.getString(10)%></td></tr>
		    <tr ><td class="le">Country</td><td class="le">: <%= rs.getString(11)%></td></tr>
		    <tr ><td class="le">Address</td><td class="le">: <%= rs.getString(12)%></td></tr>
		 <form method="post" action="Approve">
		<input type="hidden" name="bid" id="bid" value="<%= rs.getInt(1)%>">
		 <input type="hidden" name="amount" id="amount" value="<%= rs.getString(20)%>" >
		 <input type="hidden" name="month" id="month" value="<%= rs.getString(23)%>" >
		 <input type="hidden" name="ri" id="ri" value="<%= rs.getString(30)%>" >
		 <tr ><td  ><button class="ap">Approve</button></td></form>
		<form action="Reject" method="post">
		<input type="hidden" name="bid" id="bid" value="<%= rs.getInt(1)%>">
		 <input type="hidden" name="amount" id="amount" value="<%= rs.getString(20)%>" >
		 <td><button class="re">Reject</button></td></tr></form></table><br><br>
		 
		 
	<% 	}
	 if(i==0){	%>
	 <h1 class="no">There is no request!!</h1>
	 
	 <% 
	 
 }
		
		
	 
	 
}
catch(Exception e){
	out.print(e);
}
%>

</div>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="success"){
	swal("Approved","Loan request is Approved","success");
}
</script>
<input type="hidden" id="stat" value="<%= request.getAttribute("stat")%>">
<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var stat=document.getElementById("stat").value;
if(stat=="success"){
	swal("Rejected","Loan request is Rejected","error");
}
</script>



<br>

<div id="loan"><br><br><br>
 <h2>Approved Loans:</h2>
<%@ page import="java.sql.*"  %>
<%@ page import="com.loans.Excel"  %>
<%@ page import="java.util.*"  %>
<%
ResultSet rst=null;
Connection  cont=null;
PreparedStatement pstt=null;
String queryt="select * from users,borrower where users.id=borrower.bid and borrower.lid=?";
ArrayList<Excel> len=new ArrayList<Excel>();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	cont=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	 pstt=con.prepareStatement(queryt);
	
	 pstt.setString(1,id);
	 rst=pstt.executeQuery();
	
	%>
		
	<% 
	int i=0;
	 while(rst.next()){
		 i++;
		 int e,m,b;
			e=Integer.parseInt(rst.getString(21));
			m=Integer.parseInt(rst.getString(22));
			
			if(String.valueOf(rst.getString(24))=="null") b=0;
			else  b=Integer.parseInt(rst.getString(24));
			int ta=e*m;
			int ba=ta-b;
			String la=String.valueOf(ta);
			String bal=String.valueOf(ba);
			
			String tot_month="";
			if(String.valueOf(rst.getString(23))=="null"){
				tot_month+="0";
			}
			else{
				tot_month+=String.valueOf(rst.getString(23));
			}
			String tot_amount="";
			if(String.valueOf(rst.getString(24))=="null"){
				tot_amount+="0";
			}
			else{
				tot_amount+=String.valueOf(rst.getString(24));
			}
				
			
		 String eid=String.valueOf(rst.getInt(1));
		 String ename=String.valueOf(rst.getString(2));
		 String eemail=String.valueOf(rst.getString(3));
		 String emob=String.valueOf(rst.getString(13));
		 String eaddress=String.valueOf(rst.getString(8));
		 String eloan=String.valueOf(rst.getString(20));
		 String eocc=String.valueOf(rst.getString(7));
		 String epaid=String.valueOf(rst.getString(21));
		 String erem=String.valueOf(rst.getString(23));
		 String emon=String.valueOf(rst.getString(22)); 
		 String epaided=String.valueOf(rst.getString(24));
		 String dates=String.valueOf(rst.getString(25));
		 String dpaid=String.valueOf(rst.getString(26));
		len.add(new Excel(eid,ename,eemail,eocc,eaddress,emob,eloan,epaid,erem,emon,epaided,bal,la,dates,dpaid));
		
	%> <table  class="len " ><tr ><td class="le diff" >Account Number</td><td class="le diff"  >: <%= rst.getInt(1)%></td></tr>
		 <tr ><td class="le">Borower Name</td><td class="le">: <%= rst.getString(2)%></td></tr>
		  <tr ><td class="le">Borower Email</td><td class="le">: <%= rst.getString(3)%></td></tr>
		  <tr ><td class="le">Borower Occupation</td><td class="le">: <%= rst.getString(7)%></td></tr>
		 <tr ><td class="le">Borower Address</td><td class="le">: <%= rst.getString(8)%></td></tr>
		 <tr ><td class="le">Borower Contact</td><td class="le">: <%= rst.getString(13)%> </td></tr>
		  <tr ><td class="le" >For Chat </td><td class="le" > Click here:<a href="https://wa.me/<%= rst.getString(13)%>?hii..."><img class="wa" src="images/walogo.png"></a> </td></tr>
		  <tr ><td class="le" >Loan Amount </td><td class="le" >: <%= rst.getString(20)%></td></tr>
		  <tr ><td class="le" >Total Amount for Pay</td><td class="le" >: <% out.print(la);%></td></tr>
		   <tr ><td class="le" >Monthly EMI</td><td class="le" >: <%= rst.getString(21)%></td></tr>
		   <tr ><td class="le" >Total Month need to pay </td><td class="le" >: <%= rst.getString(22)%></td></tr>
		    <tr ><td class="le" >Total Month Paid</td><td class="le" >: <%out.print(tot_month);%></td></tr>
		    <tr ><td class="le" >Total Amount paid</td><td class="le" >: <%out.print(tot_amount);%></td></tr>
		     <tr ><td class="le" >Balance Amount</td><td class="le">:  <% out.print(bal); %></td></tr>
		 </table><br><br>
		 
		
	
		 
		 
	<% 	}
	 if(i==0){	%><br><br><br><br>
	 <h1 class="no">There is no Approved Loans!!</h1>
	 <% 
	
 }
		
	 
}
catch(Exception e){
	out.print(e);
}
session.setAttribute("exl", len);
%>
</div>
<div id="rep"><br><br><br>

<a href="reports.jsp"  ><img src="images/ex.png" class="rep"></a>
<h3 class="cl">Click here</h3>
</div>

<div id="feed" class="feed"><br><br><br>
<h2>FeedBack:</h2>

<%@ page import="java.sql.*"  %>
<%
ResultSet rsl=null;
Connection  conl=null;
PreparedStatement pstl=null;
String queryl="select * from users,lender where lender.bid=users.id and lender.lid=? and lstatus='completed' and feedback='bad'";


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conl=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	 pstl=conl.prepareStatement(queryl);
	 pstl.setString(1,id);
	 rsl=pstl.executeQuery();
		
	int i=0;
	 while(rsl.next()){
		i++;
	%>
	
	 
	<form  action="Loginlen"> <p class="le">Account Number</td><td class="le"  >: <%= rsl.getInt(1)%></p>
		 <p class="le">Borrower Name</td><td class="le">: <%= rsl.getString(2)%></p>
		  <p class="le">Loan Amount</td><td class="le" >: <%= rsl.getString(20)%></p>
		<input type="hidden" name="bid" id="bid" value="<%= rsl.getInt(1)%>">
		 <input type="hidden" name="amount" id="amount" value="<%= rsl.getString(20)%>" >
		
		<br><h4>Are he/she paid the Emi on time?</h4><br>
		 <input type="radio"  id="f1" name="f1" value="yes" class="Amount-Offer">Yes<br><br>
		<input type="radio"  id="f1" name="f1" value="no" class="Amount-Offer">No<br><br>
		<br><h4>Would you like to give a auto approval for particular lender?</h4><br>
		 <input type="radio"  id="f2" name="f2" value="good" class="f2">Yes<br><br>
		<input type="radio"  id="f2" name="f2" value="bad" class="f2">No<br><br>
		
		
		 <tr ><td  ><button class="ap">Submit</button></td></form><br><br>
		 
		 
	<% 	}
	 if(i==0){	%><br><br><br><br>
	 <h1 >There is no Completed loans!!</h1>
	 <% 
	
 }
		
	 
	 
}
catch(Exception e){
	out.print(e);
}
%>
<input type="hidden" id="feed" value="<%= request.getAttribute("feed")%>">
<input type="hidden" id="add" value="<%= request.getAttribute("add")%>">
<input type="hidden" id="edit" value="<%= request.getAttribute("edit")%>">
<input type="hidden" id="deleted" value="<%= request.getAttribute("deleted")%>">


<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var feed=document.getElementById("feed").value;
if(feed=="success"){
	swal("Submitted","Feedback Submitted Sucessfully","success");
}
var add=document.getElementById("add").value;
if(add=="success"){
	swal("Added","Loan Details Added","success");
}
var edit=document.getElementById("edit").value;
if(edit=="success"){
	swal("Success","Loan Details Updated","success");
}
var deleted=document.getElementById("deleted").value;
if(deleted=="success"){
	swal("Success","Loan Details Deleted","success");
}

</script>

<div id="details"><br><br><br>
<h2>Loan details:</h2>
<a href="#addl"><button class="add-btn">Add New</button></a>
<table border="1" class="den">
<tr><th class="de">Loan Type</th ><th class="de">Amount</th class="de"><th class="de">Interest</th><th class="de" colspan="2">Actions</th>

<%@ page import="java.sql.*"  %>
<%
ResultSet rsdl=null;
Connection  condl=null;
PreparedStatement pstdl=null;
String querydl="select * from lentwo where lid=?";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	condl=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	 pstdl=condl.prepareStatement(querydl);
	 pstdl.setString(1,id);
	 rsdl=pstdl.executeQuery();
	
	 while(rsdl.next()){
			%>
			
	 <tr ><td class="de"><%= rsdl.getString(2) %></td><td class="de"><%= rsdl.getString(3) %></td></td><td class="de"><%= rsdl.getString(4) %></td>
	 <td class="btn" >
	 <form action="#update">
	 <input type="hidden" name="l_type" id="l_type" value="<%= rsdl.getString(2)%>">
		 <input type="hidden"  name="amountl" id="amountl" value="<%= rsdl.getString(3)%>" >
		 		 <input type="hidden"  name="interest" id="interest" value="<%= rsdl.getString(4)%>" >
		 
	 <input type="submit" value="Edit" class="  up add-btn"></form></td>
	 <td class="btn">
	 <form action="Login" >
	 <input type="hidden" name="ltype" id="ltype" value="<%= rsdl.getString(2)%>">
		 <input type="hidden" name="amount" id="amount" value="<%= rsdl.getString(3)%>" >
	 <input type="submit" value="Delete" class=" del add-btn"></form>
	 
	 </td>
	 </tr>
	 
	<%  }
	 }catch(Exception e){
	out.print(e);
}
%>

</table>


</div>


<div id="addl"><br><br><br>
<section class="container">
<form action="Lenloan" method="post" class="form">
<div class="head"><label>Loan Type:</label></div><br>
<div class="radio">
<input type="hidden" id="lid" name="lid" value="<%out.print(id); %>">
<input type="radio" id="ltype" value="Home" name="ltype" required>Home<br>
<input type="radio" id="ltype" value="Business" name="ltype" required>Business<br>
<input type="radio" id="ltype" value="Vehicle" name="ltype" required>Vehicle<br>
<input type="radio" id="ltype" value="Personnel" name="ltype" required>Personnel<br>
<input type="radio" id="ltype" value="Education" name="ltype" required>Education<br></div>
<div class="head"><label>Amount</label></div><br>
<div class="radio">
<input type="radio" id="amount" value="50K-1L" name="amount" required>50K-1L<br>
<input type="radio" id="amount" value="1L-5L" name="amount" required>1L-5L<br>
<input type="radio" id="amount" value="5L+" name="amount" required>5L+<br></div>
 <div class="input-box">
<label>Interest</label><br>
<input type="number" name="interest" id="interest" placeholder="Enter the Interest" required><br></div>
<input type="submit" value="Add" class="add-btn">
</form>
</section>
</div>



<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"  %>



<div id="update"><br><br><br>
<%
//out.print(request.getParameter("l_type"));
String l_type=request.getParameter("l_type");
String amountl=request.getParameter("amountl");
String interest=request.getParameter("interest");

//out.print(amountl);
//out.print(l_type);
%>
<section class="container">
<form action="Lenloan" class="form">

	 <input type="hidden" name="old_ltype" id="old_ltype" value="<% out.print(l_type);%>">
	 <input type="hidden" name="old_amount" id="old_amount" value="<% out.print(amountl);%>">
	 	 <input type="hidden" name="old_rate" id="old_rate" value="<% out.print(interest);%>">
	 
	<h3 class="head">Loan Type:<%out.print(l_type); %></h3>
	<!--  <label  class="head">Loan Type</label><br>
<div class="radio">
<input type="radio" id="ltype1" value="Home" name="ltype" >Home<br>
<input type="radio" id="ltype2" value="Business" name="ltype" >Business<br>
<input type="radio" id="ltype3" value="Vehicle" name="ltype" >Vehicle<br>
<input type="radio" id="ltype4" value="Personnel" name="ltype" >Personnel<br>
<input type="radio" id="ltype5" value="Education" name="ltype" >Education<br>	</div>  --> 
	  
<label  class="head">Amount</label><br>
<div class="radio">
<input type="radio" id="amount1" value="50K-1L" name="amount" >50K-1L<br>
<input type="radio" id="amount2" value="1L-5L" name="amount" >1L-5L<br>
<input type="radio" id="amount3" value="5L+" name="amount" >5L+<br></div>
 <div class="input-box">

<label >Interest(%)</label><br>

<input type="text" name="interest" id="interest" value="<% out.print(interest);%>"><br></div>
<input type="submit" value="Update" class="add-btn">
</form>
<script>
/*var type=document.getElementById("old_ltype").value;
if(document.getElementById("ltype1").value===type)
	ltype1.checked = true;
if(document.getElementById("ltype2").value===type)
	ltype2.checked = true;
if(document.getElementById("ltype3").value===type)
	ltype3.checked = true;
if(document.getElementById("ltype4").value===type)
ltype4.checked = true;
if(document.getElementById("ltype5").value===type)
ltype5.checked = true;*/
    var rate=document.getElementById("old_amount").value;
      if(document.getElementById("amount1").value===rate)
      amount1.checked = true;
      if(document.getElementById("amount2").value===rate)
          amount2.checked = true;
      if(document.getElementById("amount3").value===rate)
          amount3.checked = true;
    
   </script>
</section>
</div>
</main>

<script>
        const sidebar = document.querySelector(".sidebar");
const sidebarClose = document.querySelector("#sidebar-close");
const menu = document.querySelector(".menu-content");
const menuItems = document.querySelectorAll(".submenu-item");
const subMenuTitles = document.querySelectorAll(".submenu .menu-title");

sidebarClose.addEventListener("click", () => sidebar.classList.toggle("close"));

menuItems.forEach((item, index) => {
  item.addEventListener("click", () => {
    menu.classList.add("submenu-active");
    item.classList.add("show-submenu");
    menuItems.forEach((item2, index2) => {
      if (index !== index2) {
        item2.classList.remove("show-submenu");
      }
    });
  });
});

subMenuTitles.forEach((title) => {
  title.addEventListener("click", () => {
    menu.classList.remove("submenu-active");
  });
});
        </script>



</body>
</html>
