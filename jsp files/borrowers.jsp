<%
response.setHeader("Cache-Control","no-Cache,no-store,must-revalidate");
response.setHeader("pragma","no-cache");
response.setHeader("Expires","0");
if(session.getAttribute("name").equals("null")){
	response.sendRedirect("loginbor.jsp");
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
String cont=String.valueOf(session.getAttribute("con"));
String income=String.valueOf(session.getAttribute("income"));

HttpSession se= request.getSession();
se.setAttribute("value1", name);
se.setAttribute("value2", email);
se.setAttribute("value3", mob);
se.setAttribute("value4", occ);
se.setAttribute("value5", add);
se.setAttribute("value6", city);
se.setAttribute("value7", state);
se.setAttribute("value8", cont);
se.setAttribute("value9", pincode);
se.setAttribute("value10", income);

session.setAttribute("bid",id);
session.setAttribute("bname",name);




if(name==null){
	response.sendRedirect("loginbor.jsp");
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
.un{margin-left:17%;}.sp{margin-left:15%;}.ge{margin-left:16%;}.em{ margin-left:17%;}.occ{ margin-left:13%;}
.pic{height:7%;width:70%;padding-top:1%;padding-left:30%;} .ci{margin-left:18%;}.st{margin-left:17%;}
#loan{margin-bottom:50%;}
.len{margin-left:15%;margin-top:1%; text-decoration:none;} 
.le{padding-left:50px;font-size:15px; font-weight:500;padding-bottom:4px}
.rep{margin-left:35%;margin-top:7%; }
.cl{ margin-left:40%;margin-top:1%;   }
.wa{height:20px;width:20px;margin-left:10px;margin-top:10px;
}
.pay{margin-left:50px;background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 5px;
padding-left: 20px;
padding-right: 20px;
color:white;
}.pay:hover{
background-color:green;}
.form {
  position: relative;
  outline: none;
  color: #707070;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding-top:5px;
  padding-bottom:5px;
}
.no{margin-left:20%;margin-top:15%;}
.diff{font-size:15px;}
#logout{border: none;  
            background: none;  
            color: white;  /* Set text color */
            text-decoration: none; 
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
            <a href="Newloan.jsp" >Apply Loan</a>
          </li>
          <li class="item">
            <a href="#loan">Received Loan</a>
          </li>
          <li class="item">
            <a href="#rep">Reports</a>
          </li>
          <li class="item">
            <form action="Reglen"><input type="submit" id="logout" value="Logout" onclick="return confirmLogout()"></form>
            <script>
            function confirmLogout() {
                var confirmLogout = window.confirm("Are you sure you want to log out?");
                if (confirmLogout) {
                    // User clicked "OK" (yes), perform the logout action here
                    
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
<img class="pic" src="images/len.avif">
           <div class="profile" id="pro"><br><br><br>
           <h2>Profile:</h2>
            
               <p class="th">Account Number<span>: <% out.print(id); %></span></p>
               <p class="th">Name<span class="un">: <% out.print(name); %></span></p>
               <p class="th">Gender<span class="ge">: <% out.print(gen); %></span></p>
               <p class="th">Occupation<span class="occ">: <% out.print(occ); %></span></p>
               <p class="th">Email<span class="em">: <%out.print(email); %></span></p>
               <p class="th">Contact<span class="sp">: <% out.print(mob); %></span></p>
                <p class="th">Address<span class="sp">: <% out.print(add); %></span></p>
                <p class="th">City<span class="ci">: <% out.print(city); %></span></p>
                 <p class="th">State<span class="st">: <% out.print(state); %></span></p>
              <p class="th">Country<span class="sp">:  <% out.print(cont); %></span></p>
               <p class="th">pin code<span class="sp">: <% out.print(pincode); %></span></p>
            </div>
            


<br>
<div id="loan"><br><br><br>
<h2>Received Loan</h2>


<%@ page import="java.sql.*"  %>
<%@ page import="com.loans.Excel"  %>
<%@ page import="java.util.*"  %>
<%
ResultSet rs=null;
Connection  con=null;
PreparedStatement pst=null;
String query="select * from users,borrower where users.id=borrower.lid and borrower.bid=?";
ArrayList<Excel> len=new ArrayList<Excel>();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	 pst=con.prepareStatement(query);
	 pst.setString(1,id);
	 rs=pst.executeQuery();
	 int i=0;
	 while(rs.next()){
		 i++;
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
		 String eocc=String.valueOf(rs.getString(7));
		 String emon=String.valueOf(rs.getString(22));
		 String epaided=String.valueOf(rs.getString(24));
		 String dates=String.valueOf(rs.getString(25));
		 String dpaid=String.valueOf(rs.getString(26));
		len.add(new Excel(eid,ename,eemail,eocc,eaddress,emob,eloan,epaid,erem,emon,epaided,bal,la,dates,dpaid));
		
		
		
		
	%><table  class="len" >  
	<form action="Approve" ><tr  ><td class="le diff" >Account Number</td><td class="le " >: <%= rs.getInt(1)%></td></tr>
		<input type="hidden"  id="id" name="id" value="<%= rs.getInt(1)%>" >
		 <tr ><td class="le">Lender Name</td><td class="le">: <%= rs.getString(2)%></td></tr>
		<tr ><td class="le">Lender Email</td><td class="le">: <%= rs.getString(3)%></td></tr>
 <tr><td class="le">Lender Address</td><td class="le">:	<%= rs.getString(8)%></td></tr>	
  <tr><td class="le">Lender City</td><td class="le">:	<%= rs.getString(9)%></td></tr>	
 
  <tr><td class="le">Lender State</td><td class="le">:	<%= rs.getString(10)%></td></tr>	
 
 <tr ><td class="le">Lender Contact</td><td class="le">: <%= rs.getString(13)%></td></tr>
 	
 <tr ><td class="le" >For Chat</td><td class="le"  > :Click here-<a href=" https://wa.me/<%=rs.getString(13)%>?hi.."><img class="wa" src="images/walogo.png"></a></td></tr>
  
		  <tr ><td class="le" >Loan Amount</td><td class="le"  >: <%= rs.getString(20)%></td></tr>
		   <input type="hidden" name="lamount" id="lamount" value="<%= rs.getInt(20)%>" >
		   		  <tr ><td class="le" >Total Amount for Pay</td><td class="le" >: <% out.print(la);%></td></tr>
		   
		 <tr ><td class="le" >Monthly EMI</td><td class="le" >: <%= rs.getString(21)%></td></tr>
		 <input type="hidden" name="ai" id="ai" value="<%= rs.getInt(21)%>" >
		  <tr ><td class="le" >Month to pay Interest</td><td class="le"  >: <%= rs.getString(22)%></td></tr>
		  <tr ><td class="le" >Total Month paid</td><td class="le"  >: <%out.print(tot_month);%></td></tr>
		    <tr ><td class="le" >Total Amount paid</td><td class="le"  >:  <%out.print(tot_amount);%></td></tr>
		     <tr ><td class="le" >Balance Amount</td><td class="le"  >: <% out.print(bal); %></td></tr>
		<input type="hidden" name="months" id="months" value="<%= rs.getInt(22)%>" >
		<input type="hidden" name="tmonths" id="tmonths" value="<%= rs.getInt(23)%>" >
	<input type="hidden" name="in" id="in" value="<%= rs.getInt(21)%>" >
	<input type="hidden" name="paided" id="paided" value="<%= rs.getInt(24)%>" >
	
	
	
		 <tr><td class="le"> <input type="text" value="<%= rs.getString(21)%>" id="paid" name="paid"></td>
		<td> <input type="submit" class="pay" value="pay">
		<script>
		 document.addEventListener("DOMContentLoaded", function() {
            var payButton = document.querySelector(".pay");

            if (payButton) {
                payButton.addEventListener("click", function(event) {
                    // Display a confirmation prompt
                    var confirmed = confirm("Are you sure you want to make the payment?");
                    
                    if (!confirmed) {
                        event.preventDefault(); // Prevent the form from submitting if not confirmed
                    }
                });
            }
            });</script>
		</td></tr></form>
		 
	</table><br><br>
	<% 	
		
	 }
	 if(i==0){	%>
	 <h1 class="no">There is no Received Loan!!</h1>
	 
	 <% }
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

<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="success"){
	swal("Success","Amount paided Successfully","success");
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
	swal("Congrats","Loan was finished","success");
}
</script>
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
