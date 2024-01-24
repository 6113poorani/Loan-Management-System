<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    response.setHeader("Cache-Control","no-Cache,no-store,must-revalidate");
    response.setHeader("pragma","no-cache");
    response.setHeader("Expires","0");
    
    if(session.getAttribute("name")=="null"){
    	response.sendRedirect("login.jsp");
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
    String cont=String.valueOf(session.getAttribute("con"));
    String pincode=String.valueOf(session.getAttribute("pincode"));
    %>
<!DOCTYPE html>
<html>
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
  font-size: 24px;
  padding-left:35px;
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
  height: 1000vh;
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
.pic{height:7%;width:70%;padding-top:3%;padding-left:30%;
}
.th{
margin-right:-50%;
margin-top:1%;
	font-size: 17px;
    font-weight: 600;
    margin-left:10%;
  }
span{

	margin-left:9.5%;
	 
}
.un{margin-left:15.7%;}.sp{margin-left:14.5%;}.ge{margin-left:15%;}
.em{ margin-left:16%;}.occ{ margin-left:12.5%;}.pin{ margin-left:13.8%;}
.ci{ margin-left:16.7%;}.st{ margin-left:16%;}.ch{ margin-left:8%;}.ad{ margin-left:12.5%;}.add{ margin-left:14.5%;}
.lent{margin-left:15%;margin-top:1%; text-decoration:none;} 
.le{padding-left:50px;font-size:15px; font-weight:500;}
.rep{margin-left:35%;margin-top:7%; }
.cl{ margin-left:40%;margin-top:1%;   }
.dis{background-color:skyblue;color:black;
border-radius:5px;
border-color:skyblue;
padding:4.5px;
}
.dis:hover{background-color:green;border-color:green;color:white;}
#rec{margin-bottom:70%;}
.wa{height:20px;width:20px;margin-left:10px;margin-top:10px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<title>welcome to <%out.print(name); %> page</title>
</head>
<body>
<nav class="sidebar">
      <a href="#" class="logo"><%out.print(name); %></a>

      <div class="menu-content">
        <ul class="menu-items">
          

          <li class="item">
            <a href="#pro">Borrower Profile</a>
          </li>
          <li class="item">
            <a href="#rec">Received Loans</a>
          </li>
          <li class="item">
            <a href="#rep">Reports</a>
          </li>
           <li class="item">
            <a href="Reglen">Logout</a>
          </li>
          </div> </nav>

    <nav class="navbar">
      <i class="fa-solid fa-bars" id="sidebar-close"></i>
    </nav>

    <main class="main">
<img class="pic" src="images/len.avif">
           <div class="profile" id="pro">
  <div class="profile" id="pro"><br><br><br>
           <h2>Borrower Profile:</h2>
           
           <p class="th">Account Number<span>: <% out.print(id); %></span></p>
               <p class="th">Name<span class="un">: <% out.print(name); %></span></p>
               <p class="th">Gender<span class="ge">: <% out.print(gen); %></span></p>
               <p class="th">Occupation<span class="occ">: <% out.print(occ); %></span></p>
               <p class="th">Email<span class="em">: <%out.print(email); %></span></p>
                <p class="th">Contact<span class="sp">: <% out.print(mob); %></span></p>
        <p class="th" >For Chat(Borrower)<span class="ch">: Click here:<a href="https://wa.me/<%out.print(mob);%>?hii..."><img class="wa" src="images/walogo.png"></a></span> </p>
                <form action="Loginbor">
		 <input type="hidden" name="adharid" id="adharid" value="<% out.print(id);%>">
		 
		<p class="th">Adhar&Pan<span class="ad">: <input type="submit" class="dis" value="Display"></form></p>
               <p class="th">Address<span class="add">: <% out.print(add); %></span></p>
               <p class="th">City<span class="ci">: <% out.print(city); %></span></p>
                 <p class="th">State<span class="st">: <% out.print(state); %></span></p>
              <p class="th">Country<span class="sp">:  <% out.print(cont); %></span></p>
               <p class="th">Pin-Code<span class="pin">: <% out.print(pincode); %></span></p>
            </div>

	
<div id="rec"><br><br><br>
<h2>Received Loan Details:</h2>

<%@ page import="java.sql.*"  %>
<%@ page import="com.loans.Excel"  %>
<%@ page import="java.util.*"  %>
<%
ResultSet rs=null;
Connection  con=null;
PreparedStatement pst=null;
String query="select * from users,borrower where users.id=borrower.lid";
ArrayList<Excel> len=new ArrayList<Excel>();
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	 pst=con.prepareStatement(query);
	 
	 rs=pst.executeQuery();
		

	 while(rs.next()){
		 int e,m,b;
			e=Integer.parseInt(rs.getString(21));
			m=Integer.parseInt(rs.getString(22));
			
			if(String.valueOf(rs.getString(24))=="null") b=0;
			else  b=Integer.parseInt(rs.getString(24));
			int ta=e*m;
			int ba=ta-b;
			String la=String.valueOf(ta);
			String bal=String.valueOf(ba);
			
			
			String tot_month="";
			if(String.valueOf(rs.getString(23))=="null"){
				tot_month+="0";
			}
			else{
				tot_month+=String.valueOf(rs.getString(23));
			}
			String tot_amount="";
			if(String.valueOf(rs.getString(24))=="null"){
				tot_amount+="0";
			}
			else{
				tot_amount+=String.valueOf(rs.getString(24));
			}
			
		 String eid=String.valueOf(rs.getInt(1));
		 String ename=String.valueOf(rs.getString(2));
		 String eemail=String.valueOf(rs.getString(3));
		 String emob=String.valueOf(rs.getString(13));
		 String eaddress=String.valueOf(rs.getString(8));
		 String eloan=String.valueOf(rs.getString(20));
		 String epaid=String.valueOf(rs.getString(21));
		 String erem=String.valueOf(rs.getString(23));
		 String emon=String.valueOf(rs.getString(22));
		 String eocc=String.valueOf(rs.getString(7));
		 String epaided=String.valueOf(rs.getString(24));
		 String dates=String.valueOf(rs.getString(25));
		 String dpaid=String.valueOf(rs.getString(26));
		len.add(new Excel(eid,ename,eemail,eocc,eaddress,emob,eloan,epaid,erem,emon,epaided,bal,la,dates,dpaid));
		
	%><table  class="lent" >
	 	 <tr ><td class="le" >Lender Account Number</td><td class="le"  >: <%= rs.getInt(1)%></td></tr>

		 <tr ><td class="le">Lender Name</td><td class="le">: <%= rs.getString(2)%></td></tr>
		  <tr ><td class="le">Lender Gender</td><td class="le">: <%= rs.getString(4)%></td></tr>
		 
		  <tr ><td class="le">Lender Occupation</td><td class="le">: <%= rs.getString(7)%></td></tr>
		 <tr ><td class="le">Lender Email</td><td class="le">: <%= rs.getString(3)%></td></tr>
		 <tr ><td class="le">Lender Contact</td><td class="le">: <%= rs.getString(13)%></td></tr>
		 <tr ><td class="le" >For Chat(Lender) </td><td class="le" > Click here:<a href="https://wa.me/<%= rs.getString(13)%>?hii..."><img class="wa" src="images/walogo.png"></a> </td></tr>
		 
		 <tr ><td class="le">Lender Address</td><td class="le">: <%= rs.getString(8)%></td></tr>
		  <tr ><td class="le">Lender City</td><td class="le">: <%= rs.getString(9)%></td></tr>
		   <tr ><td class="le">Lender State</td><td class="le">: <%= rs.getString(10)%></td></tr>
		 <tr ><td class="le">Lender Country</td><td class="le">: <%= rs.getString(11)%></td></tr>
		  <tr ><td class="le">Lender Pin Code</td><td class="le">: <%= rs.getString(12)%></td></tr>
		  <tr ><td class="le" >Total Loan Amount</td><td class="le" >: <%= rs.getString(20)%></td></tr>
		   <tr ><td class="le" >Total Amount for Pay</td><td class="le" >: <% out.print(la);%></td></tr>
		 <tr ><td class="le">Monthly EMI </td><td class="le">: <%= rs.getString(21)%></td></tr>
		 <tr ><td class="le">Total month need to pay </td><td class="le">: <%= rs.getString(22)%></td></tr>
		 <tr ><td class="le">Months of paid</td><td class="le">: <%out.print(tot_month);%></td></tr>
		 <tr ><td class="le" >Total Amount paid</td><td class="le"  >: <%out.print(tot_amount);%></td></tr>
		     <tr ><td class="le" >Balance Amount</td><td class="le"  >: <% out.print(bal); %></td></tr></table><br><br>
	<% 	}
		
	 
	 
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