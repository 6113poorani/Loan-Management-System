<%
//System.out.print(session.getAttribute("bid"));
if(session.getAttribute("name")=="null"){
	response.sendRedirect("loginbor.jsp");
}
   HttpSession se= request.getSession();
   String name = (String) se.getAttribute("value1");
   String email = (String) se.getAttribute("value2");
   String mob = (String) se.getAttribute("value3");
   String occ = (String) se.getAttribute("value4");
   String add = (String) se.getAttribute("value5");
   String city = (String) se.getAttribute("value6");
   String state = (String) se.getAttribute("value7");
   String country= (String) se.getAttribute("value8");
   String pincode= (String) se.getAttribute("value9");
   String income= (String) se.getAttribute("value10");
%>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
body{ background: #e7f2fd;
}
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
.body {
	margin-left:50px;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;

}
.container {
  position: relative;
  max-width: 700px;
  width: 100%;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  margin-top:100px;
  margin-left:200px;
}
.container header {
  font-size: 1.5rem;
  color: #333;
  font-weight: 500;
  text-align: center;
}
.container .form {
  margin-top: 30px;
}
.form .input-box {
  width: 100%;
  margin-top: 20px;
}
.input-box label {
  color: #333;
}
.form :where(.input-box input, .select-box) {
  position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.check input{
 height: 40%;
  width: 50%;
  margin-left:-150px;
 margin-right:-150px;
}
.input-box input:focus {
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.form .column {
  display: flex;
  column-gap: 15px;
}
.form .gender-box {
  margin-top: 20px;
}
.gender-box h3 {
  color: #333;
  font-size: 1rem;
  font-weight: 400;
  margin-bottom: 8px;
}
.form :where(.gender-option, .gender) {
  display: flex;
  align-items: center;
  column-gap: 50px;
  flex-wrap: wrap;
}
.form .gender {
  column-gap: 5px;
}
.gender input {
  accent-color: rgb(130, 106, 251);
}
.form :where(.gender input, .gender label) {
  cursor: pointer;
}
.gender label {
  color: #707070;
}
.address :where(input, .select-box) {
  margin-top: 15px;
}
.select-box select {
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  color: #707070;
  font-size: 1rem;
}
.form button {
  height: 55px;
  width: 100%;
  color: #fff;
  font-size: 1rem;
  font-weight: 400;
  margin-top: 30px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  background: rgb(130, 106, 251);
}
.form button:hover {
  background: rgb(88, 56, 250);
}
/*Responsive*/
@media screen and (max-width: 500px) {
  .form .column {
    flex-wrap: wrap;
  }
  .form :where(.gender-option, .gender) {
    row-gap: 15px;
  }
  }
.column{
margin-top:7px;}
.len{

	font-size: 20px;
    font-weight: 100;
   margin-top:20px;
  margin-bottom:180px;
   
}
.le{
 
	 padding-left:15px;
	 padding-right:15px;
	 padding-top:15px;
	 padding-bottom:15px;
}
.apply{
background-color:skyblue;
border-color:skyblue;padding:5px;}
.apply:hover{
background-color:green;border-color:green;}
.lf{ margin-bottom:10px;margin-left:5px;}
.pic{height:7%;width:70%;padding-top:1%;padding-left:30%;} 
.Amount-Offer{
 margin-bottom:20px;margin-left:40%;font-size:150px;font-weight:150px;
}
.pay{
margin-left:420px;background-color:rgb(44, 146, 255);margin-bottom:110px;margin-top:-5px;
border: none;
border-radius: 5px;
padding: 10px;
padding-left: 20px;
padding-right: 20px;
color:white;
}
.pay:hover{
background-color:green;}
.error{color:red;}
textarea{padding-right:500px;
 position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;}




</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

<title>Search for Loan</title>

</head>
<body>

<nav class="sidebar">
      <a href="#" class="logo">Search for Loan</a>

      <div class="menu-content">
        <ul class="menu-items">
          

          <li class="item">
            <a href="#pro">Amount Required</a>
          </li>
          <li class="item">
            <a href="#lender">Lenders</a>
          </li>
         
          <li class="item">
            <a href="borrowers.jsp">Back to Home</a>
          </li>
          </div> </nav>

    <nav class="navbar">
      <i class="fa-solid fa-bars" id="sidebar-close"></i>
    </nav>

    <main class="main">
<img class="pic" src="images/nl.avif">
           
           
           <div class="profile" id="pro"><br><br><br>
           

<h3>What is the range of amount do you want?</h3><br>
<form action="Apply" method="get">

<input type="radio"  id="Amount-Offer" name="Amount-Offer" value="50K-1L" class="Amount-Offer">50K-1L<br>
<input type="radio"  id="Amount-Offer" name="Amount-Offer" value="1L-5L" class="Amount-Offer">1L-5L<br>
<input type="radio"  id="Amount-Offer" name="Amount-Offer" value="5L+" class="Amount-Offer">5L+<br>
<h3>What type of loan do you want?</h3>

<input type="radio" id="ltype" name="ltype" value="Business" class="Amount-Offer"> Business<br>
           <input type="radio" id="ltype" name="ltype" value="Home" class="Amount-Offer"> Home<br>
           <input type="radio" id="ltype" name="ltype" value="Education" class="Amount-Offer"> Education<br>
           <input type="radio" id="ltype" name="ltype" value="Vehicle" class="Amount-Offer"> Vehicle<br>
           <input type="radio" id="ltype" name="ltype" value="Personnel" class="Amount-Offer"> Personnel</div><br><br>
<input type="submit" name="submit" value="submit" class="pay">
</form>	

</div>
<div id="lender"><br><br><br>
<br> 
<h2>Lender Info</h2>
 
<br>
<%@ page import="java.sql.*"  %>
<%
String ao=String.valueOf(session.getAttribute("ao"));
 String lt=String.valueOf(session.getAttribute("lt"));
ResultSet rs=null;
Connection  con=null;
PreparedStatement pst=null;
String query="select * from users,lentwo where lentwo.amount=? and lentwo.lid=users.id and lentwo.ltype=?";
 
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
	
	 pst=con.prepareStatement(query);
	 pst.setString(1,ao);
	 pst.setString(2,lt);
	 rs=pst.executeQuery();
	 
	%> <table border="1" class="len" >
		<tr ><th class="le" >Name</th><th class="le">Email</th><th class="le">Contact</th><th class="le">Loan Type</th>
		<th class="le" >Amount Offered</th><th class="le">Interest(%)</th><th></th></tr>
<% 
	 while(rs.next()){
		
		 // session.setAttribute("id",rs.getInt("id"));
		
		 %>
		 <tr ><td class="le"><%= rs.getString(2) %></td>
		 <td class="le"><%= rs.getString(3) %></td><td class="le"><%= rs.getString(13) %></td><td class="le"><%= rs.getString(19) %></td>
		 <td class="le"><%= rs.getString(20) %></td> <td class="le"><%= rs.getString(21) %>%</td>
		 <td class="le"><form action="#apply">
		  <input type="hidden" name="loantype" id="loantype" value="<%= rs.getString(19) %>">
		 <input type="hidden" name="lendername" id="lendername" value="<%= rs.getString(2) %>">
		 <input type="hidden" name="interest" id="interest" value="<%= rs.getString(21) %>">
		 
		  <input type="submit" value="Apply" class=" apply"></form></td>
		</tr>
		 <% 
		
		
	 }
}
catch(Exception e){
	out.print(e);
}
%>
</table>
</div >
<div id="apply">	<br>
				
  <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <section class="container" >
      <header><h2 > Application Form</h2></header>
      
      
						

      <form action="Apply" id="form" class="form" method="post" onsubmit="return validateForm() " >
      
      
      
        <div class="column">
          <div class="input-box">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"  %>



			<%String a=request.getParameter("interest");
			String b=request.getParameter("lendername");
			String c=request.getParameter("loantype");
			
			
			String bid=String.valueOf(session.getAttribute("bid")); 
			
		session.setAttribute("boid",bid); %>	
		
	
<label>Lender Name</label>
           <input type="text" name="lname" id="lname" value="<%out.print(b); %>">
           <label>Loan Type</label>
           <input type="text" name="lf" id="lf" value="<%out.print(c); %>">
	 
            <p>Amount (₹)     
            <input id="amount" type="number" name="amount"
            onchange="Calculate()"> 
        </p> 
        <div class="error" id="amountError" ></div>
        
  
        <p>Interest Rate 
            <input id="rate" name="rate" type="number" value="<%out.print(a); %>"
            onchange="Calculate()"> 
        </p> 
  
        <p>Months to Pay 
            <input id="months" type="number" name="months"
            onchange="Calculate()"> 
        </p> 
  			<div class="error" id="monthsError" ></div>
  			   
  <label>Monthly EMI</label>
       <textarea class="emi" id="total"  ></textarea><br>
        <label>Total EMI</label>
       <textarea class="emi" id="totals"  ></textarea><br>
                     
           
            
           
           
           
            <label>Annual Income </label>
            <input type="text" id="ai" name="ai" value="<%out.print(income); %>" ><br>
            	<div class="error" id="aiError" ></div>
            
          <br> 
           <h2>Contact Information</h2>
        <div class="input-box">
          <label>Full Name</label>
          <input type="text" id="bname" name="bname" placeholder="Enter full name" value="<%out.print(name); %>" />
        </div>

        <div class="input-box">
          <label>Email Address</label>
          <input type="text" id="bemail" name="bemail"placeholder="Enter email address" value="<%out.print(email); %>">
        </div>

        <div class="column">
          <div class="input-box">
            <label>Phone Number</label>
            <input type="number"  value="<%out.print(mob); %>">
          </div>
         
        </div><br><br>
        
        
        
         
        
          <div class="column"><div class="input-box"><label>Address</label>
                    <input type="text" id="address" name="address" placeholder="Enter street address" value="<%out.print(add); %>"></div></div>
             <div class="column"><div class="input-box"> <label>City</label>
            <input type="text" id="city" name="city" placeholder="Enter your city" value="<%out.print(city); %>"></div></div>
         
          <div class="column"><div class="input-box"><label>State</label>
            <input type="text" id="region" name="region"  placeholder="Enter your region" value="<%out.print(state); %>" ></div></div>
          <div class="column"><div class="input-box"><label>Country</label>
           <input type="text" id="country" name="country" placeholder="Enter your country" value="<%out.print(country); %>"></div></div>
          <div class="column"><div class="input-box"> <label>Pin-Code</label>
            <input type="text" id="code" name="code" placeholder="Enter postal code" value="<%out.print(pincode); %>"></div>
          </div>
          
        <br><hr><br>
        <h2>Employement Information</h2>
        <div  class="input-box">
        
            <div class="input-box">
        <label class="column">Occupation</label>
          <input type="text" id="occupation" name="occupation" placeholder= "Enter your Ocuupation" value="<%out.print(occ); %>">
       
       
    
          <label class="column"></label>
          <input type="text" id="yoe" name="yoe" placeholder="Enter your Years of Experience" >
        
          <label class="column"></label>
            <input type="text" id="gs" name="gs" placeholder="Enter your Gross monthly income" >
            </div></div>
           <br> <hr><br>
        <h2 >Consent</h2><br>
        <div class="check" >
       <input type="checkbox" name="agree-term" id="agree-term"><label for="agree-term"> authorize prospective Credit Granters/Lending/Leasing Companies to obtain personal and credit information about me from my employer and credit bureau, or credit reporting agency, any person who has or may have any financial dealing with me, or from any references I have provided. This information, as well as that provided by me in the application, will be referred to in connection with this lease and any other relationships we may establish from time to time. Any personal and credit information obtained may be disclosed from time to time to other lenders, credit bureaus or other credit reporting agencies.</label><br>
        <input type="checkbox" name="agree-term2" id="agree-term2"> I hereby agree that the information given is true, accurate and complete as of the date of this application submission. <p> 
      </div>
        <button>Submit</button>
      </form>
     
    </section>
    </div>
     
     <script>
     
     
     
     function validateForm() {
         var amount = document.getElementById("amount").value;
         var months = document.getElementById("months").value;
         var ai= document.getElementById("ai").value;
         
         var  agreeterm= document.getElementsByName("agree-term");
         var  agreeterm2= document.getElementsByName("agree-term2");
         
         var amountError = document.getElementById("amountError");
         var monthsError = document.getElementById("monthsError");
         var aiError = document.getElementById("aiError");
        
         // Reset error messages
         amountError.textContent = "";
         monthsError.textContent = "";
         aiError.textContent = "";
         
         var isagree = false;
         for (var i = 0; i < agreeterm.length; i++) {
             if (agreeterm[i].checked) {
                 isagree = true;
                 break;
             }
         }

         var isagree2 = false;
         for (var i = 0; i < agreeterm2.length; i++) {
             if (agreeterm2[i].checked) {
                 isagree2 = true;
                 break;
             }
         }
        

        
         
         // Validate username
         if (amount.trim()=== "") {
             amountError.textContent = "Amount is required";
            // amount.focus();
             return false;
         }
         if (months === "") {
         	monthsError.textContent = "Months is required";
             return false;
            
           }
        
        

         if (ai.trim() === "") {
         	aiError.textContent = "Annual Income is required";
             return false;
            
         }
         if (!isagree) {
             alert("Accept the terms and conditions.");
             return false;
         }
         if (!isagree2) {
             alert("Accept the terms and conditions.");
             return false;
         }

         // Check for at least one lowercase letter
        

         
         return true; 
     }
     document.addEventListener("DOMContentLoaded", function() {
    	    const form = document.getElementById("form");
    	    const inputField = document.getElementById("amount");
    	    const inputField1 = document.getElementById("months");
    	    const inputField2 = document.getElementById("ai");

    	    form.addEventListener("submit", function(event) {
    	        if (inputField.value.trim() === "") {
    	            event.preventDefault(); // Prevent form submission
    	            inputField.focus(); // Focus on the empty input field
    	        }
    	        else if (inputField1.value.trim() === "") {
    	            event.preventDefault(); // Prevent form submission
    	            inputField1.focus(); // Focus on the empty input field
    	        }
    	        else  if (inputField2.value.trim() === "") {
    	            event.preventDefault(); // Prevent form submission
    	            inputField2.focus(); // Focus on the empty input field
    	        }
    	    });
    	});
		
     
     function Calculate() { 
    	  
    	    // Extracting value in the amount  
    	    // section in the variable 
    	    const amount = document.querySelector("#amount").value; 
    	  
    	    // Extracting value in the interest 
    	    // rate section in the variable 
    	    const rate = document.querySelector("#rate").value; 
    	  
    	    // Extracting value in the months  
    	    // section in the variable 
    	    const months = document.querySelector("#months").value; 
    	  
    	    // Calculating interest per month 
    	    const interest = ((amount*rate*months)/100);
    	      
    	    // Calculating total payment 
    	    const total = ((parseInt(interest)+parseInt(amount))/(months)).toFixed(0); 
    	    const totals =( ((parseInt(interest)+parseInt(amount))/(months)).toFixed(0))*months; 
    	    document.querySelector("#total") 
    	            .innerHTML =  + total; 
    	    document.querySelector("#totals") 
            .innerHTML =  + totals; 
    	}
            </script>
   
    </div>
    
    
    
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="success"){
	swal("Congrats","Appication submitted Successfully","success");
}
</script>

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
</main>
    
    	
</body>
</html>