<%



String aname=String.valueOf(session.getAttribute("name"));

if(session.getAttribute("name").equals("null")){
	response.sendRedirect("login.jsp");
}

String email=String.valueOf(session.getAttribute("email"));
String mob=String.valueOf(session.getAttribute("mob"));
String id=String.valueOf(session.getAttribute("id"));
String gen=String.valueOf(session.getAttribute("gen"));
String add=String.valueOf(session.getAttribute("add"));
String city=String.valueOf(session.getAttribute("city"));
String state=String.valueOf(session.getAttribute("state"));
String cont=String.valueOf(session.getAttribute("con"));
String pincode=String.valueOf(session.getAttribute("pincode"));

%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Welcome!<% out.print(aname); %></title>
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
  padding: 0 10px;
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
.submenu-active .menu-items {
  transform: translateX(-56%);
}
.menu-title {
  color: #fff;
  font-size: 14px;
  padding: 15px 20px;
}
.item a,
.submenu-item {
  padding: 16px;
  display: inline-block;
  width: 100%;
  border-radius: 12px;
}
.item i {
  font-size: 12px;
}
.item a:hover,
.submenu-item:hover,
.submenu .menu-title:hover {
  background: rgba(255, 255, 255, 0.1);
}
.submenu-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #fff;
  cursor: pointer;
}
.submenu {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  right: calc(-100% - 26px);
  height: calc(100% + 100vh);
  background: #11101d;
  display: none;
}
.show-submenu ~ .submenu {
  display: block;
}
.submenu .menu-title {
  border-radius: 12px;
  cursor: pointer;
}
.submenu .menu-title i {
  margin-right: 10px;
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
.itemss{
	margin-top:50px;
	margin-bottom:50px;
    margin-left: 150px;
    width:70%;
    height:400px;
    max-width:820px ;
    background:white;
    border-radius:20px;
    border-color:#fff;
    box-shadow:0 0 7px 10px #fff;
    overflow:hidden;
    grid-template-columns:repeat(2,1fr);
    display:grid;z-index:1000;
}
.bor{
width:100%;
height:100%;}
.submit-form{
    background:white;
}
.form-group{
   margin-left:50px; 
    margin-top:30px;
    
     size:100px;
}
.name{
padding-top:10px;
padding-bottom:10px;
padding-left:10px;
padding-right:10px;

}
.form :where(.form-group input) {
  position: relative;
  outline: none;
  color: #707070;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding-top:11px;
  padding-bottom:11px;
}
.submit{
background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 8px;
padding-left: 12px;
padding-right: 12px;
color:white;
margin-left:50px;
margin-top:20px;

}

.submit:hover{
transform:scale(1.1);
z-index:2;
box-shadow:0 0 5px 10px rgb(44, 146, 255);
}
.th{
margin-right:-50%;
margin-top:1.5%;
	font-size: 20px;
    font-weight: 600;
    margin-left:10%;
  }
span{

	margin-left:9%;
	 
}
.un{margin-left:11.5%;}.sp{margin-left:15%;}.ge{margin-left:15.5%;}.em{ margin-left:16.7%;}
.ci{ margin-left:18%;}.st{ margin-left:17%;}
.len{margin-left:20%;
}
.lent{margin-left:3%;font-size: 15px;font-weight: 500;}
.le{ padding-bottom:10px;  padding-left:10px;      }
.re{ margin-left:450px;margin-top:-50px; background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 13px;
padding-left: 13px;
padding-right: 17px;
color:white;
margin-top:10px;
}.re:hover{
background-color:red;
}
.pic{height:7%;width:70%;padding-top:1%;padding-left:30%;
}

.wa{height:20px;width:20px;margin-left:10px;margin-top:10px;
}
.display{
background-color:skyblue;
border-color:skyblue;
padding:4px;border-radius:3px;}
.display:hover{background-color:green; color:white;border-color:green;
}
.no{margin-left:30%;margin-top:15%;}
.diff{font-size:20px;}
#logout{border: none;  
            background: none;  
            color: white;  /* Set text color */
            text-decoration: none; 
            cursor: pointer; margin-left:15px;font-size:15px;}
    </style>
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  </head>
  <body>
    <nav class="sidebar">
      <a href="#" class="logo">Welcome!<%out.print(aname); %></a>

      <div class="menu-content">
        <ul class="menu-items">
          

          <li class="item">
            <a href="#pro">Profile</a>
          </li>
          <li class="item">
            <a href="#rbor">New Request</a>
          </li>
          <li class="item">
            <a href="#bor" >Borrowers</a>
          </li>
          <li class="item">
            <a href="#len" >Lenders</a>
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
     <img class="pic" src="images/33.jpg">
           <div class="profile" id="pro"><br><br><br>
           <h2>Your Profile:</h2>
            
               <p class="th">Account Number<span>: <% out.print(id); %></span></p>
               <p class="th">Admin Name<span class="un">: <% out.print(aname); %></span></p>
               <p class="th">Gender<span class="ge">: <% out.print(gen); %></span></p>
               <p class="th">Email<span class="em">: <% out.print(email); %></span></p>
                <p class="th">Contact<span class="sp">: <% out.print(mob); %></span></p>
               <p class="th">Address<span class="sp">: <% out.print(add); %></span></p>
                <p class="th">City<span class="ci">: <% out.print(city); %></span></p>
                 <p class="th">State<span class="st">: <% out.print(state); %></span></p>
              <p class="th">Country<span class="sp">:  <% out.print(cont); %></span></p>
               <p class="th">pincode<span class="sp">: <% out.print(pincode); %></span></p>
            </div>
            
           
            
            <div class="borrower" id="bor"><br><br><br>
            <h2 >For Borrower Details:</h2>
             <div class="itemss">
           
					
						<figure >
							<img src="images/1.avif" alt="sign in image" class="bor">
						</figure>
            <div class="submit-form">
            <form action="Admin" method="get" class="form">
             <div class="form-group">
            <label for="userid">UserId:</label><br><br>
            <input type="text" name="userid" id="userid"placeholder="Borrower Id" class="name" required></div>
              <div class="form-group">
            <label for="email">Email:</label><br><br>
            <input type="email" name="email" id="email" placeholder="Borrower Email" class="name" required></div>
              <div class="form-group">
            <input type="submit" value="submit" class="submit"></div>
            </form>
            </div></div></div>
            
            <div class="lender" id="len"><br><br><br>
            <h2 >For Lender Details:</h2>
            <div class="itemss">
           
					
						<figure >
							<img src="images/2.avif" alt="sign in image" class="bor">
						</figure>
					
            <div class="submit-form">
            <form action="Admin" method="post" class="form">
            <div class="form-group">
            <label for="userid">UserId:</label><br><br>
            <input type="text" name="userid" id="userid"placeholder="Lender Id" class="name" required></div>
            <div class="form-group">
            <label for="email">Email:</label><br><br>
            <input type="email" name="email" id="email" placeholder="Lender Email" class="name" required></div>
            <div class="form-group">
            <input type="submit" value="submit" class="submit"></div>
            </form>
            </div></div></div>
            
            
            
            
            
            <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
            <!-- JS -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="js/main.js"></script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <link rel="stylesheet" href="alert/dist/sweetalert.css">
            <script type="text/javascript">
            var status=document.getElementById("status").value;
            if(status=="failed"){
                swal("Sorry","wrong Id or Email","error");
            }
            </script>
            
           
            <div class="request" id="rbor">  <br><br>
           <br> <h2 >Pending Requests:</h2><br>
            
            <%@ page import="java.sql.*"  %>
            <%
            ResultSet rs=null;
            Connection  con=null;
            PreparedStatement pst=null;
            String query="select * from users,lender where users.id=lender.bid and bstatus='notapproved'";
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
                 pst=con.prepareStatement(query);
                
                 rs=pst.executeQuery();
                    
            int i=0;
                 while(rs.next()){
                   i++; 
                %>
                 <table  class="lent" >
                     <tr ><td class="le diff" >Borrower ID</td><td class="le diff"  >: <%= rs.getInt(1)%></td>  </tr>
                   
                     <tr ><td class="le">Name</td><td class="le">: <%= rs.getString(2)%></td> <td class="le">City</td><td class="le">: <%= rs.getString(9)%></td> 
                      <tr ><td class="le">Gender</td><td class="le">: <%= rs.getString(4)%></td>  <td class="le">State</td><td class="le">: <%= rs.getString(10)%></td>
                      <tr ><td class="le" >Desired Amount</td><td class="le" >: <%= rs.getString(20)%></td> <td class="le">Country</td><td class="le">: <%= rs.getString(11)%></td></tr>
                      <tr ><td class="le">Occupation</td><td class="le">: <%= rs.getString(7)%></td><td class="le">Contact</td><td class="le">: <%= rs.getString(13)%></td></tr>
                     <td class="le">Email</td><td class="le">: <%= rs.getString(3)%></td>
                   
                   <form action="Loginbor">
		 <input type="hidden" name="adharid" id="adharid" value="<%= rs.getInt(1)%>">
		 
		<td class="le">Adhar&Pan</<td><td class="le">: <input type="submit" class="display" value="Display"></form></td></tr>
			     <% 
                    
                    ResultSet rs3=null;
            Connection  con3=null;
            PreparedStatement pst3=null;
                String query3="select * from borrower where bid=?";
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
                     pst3=con3.prepareStatement(query3);
                     pst3.setInt(1, rs.getInt(1));
                     rs3=pst3.executeQuery();
                     int count=0;
                     while(rs3.next()){
                         count++;
                        
                     }
                     %>
                     
                     <tr> <td class="le" >Address</td><td class="le" >: <%= rs.getString(8)%></td><td class="le diff">Incompleted Loans</td><td class="le diff">: <%out.print(count);%></td></tr>
                <%    
                    
                 
                 
            }
            catch(Exception e){
                out.print(e);
            } 
                    
              %> 
                  
                  
                  
                    <% 
                    
                    ResultSet rs2=null;
            Connection  con2=null;
            PreparedStatement pst2=null;
                String query2="select * from users where id=?";
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/loan?useSSL=false","root","Pooraniv@213");
                     pst2=con2.prepareStatement(query2);
                     pst2.setString(1, rs.getString(19));
                     rs2=pst2.executeQuery();
                     if(rs2.next()){
                    	 
                     }
                        
                
                   
                
                    
                 
                 
            }
            catch(Exception e){
                out.print(e);
            } 
                    
              %>     
                  
                    
        <tr> <td class="le" >Lender Id</td><td class="le" >: <%= rs.getString(19)%></td><td class="le" >lender Name</td><td class="le" >: <%= rs2.getString(2)%></td></tr>
                  <tr> <td class="le" >Lender Contact</td><td class="le" >: <%= rs2.getString(13)%></td><td class="le" >lender Email</td><td class="le" >: <%= rs2.getString(3)%></td></tr>
          
           <tr ><td class="le" >For Chat(Lender) </td><td class="le" > Click here:<a href="https://wa.me/<%= rs2.getString(13)%>?hii..."><img class="wa" src="images/walogo.png"></a> </td></tr>
                
                    
                    

                    <form action="Reject" method="get">
                    <input type="hidden" name="bid" id="bid" value="<%= rs.getInt(1)%>">
                     <input type="hidden" name="amount" id="amount" value="<%= rs.getString(20)%>" >
                     <input type="hidden" name="lid" id="lid" value="<%= rs.getString(19)%>" >
                      <tr > <td  colspan="4"><button class="re">Reject</button></td></tr></form></table><br><br>
                     
                     
                <% }
                 if(i==0){	%>
            	 <h1 class="no">There is no request!!</h1>
            	 
            	 <% 
            
            }}
                 catch(Exception e){
                     out.print(e);
                 }
           
            %>
            
            </div>
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
                swal("Success","Loan Rejected Successfully","success");
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



</body>
</html>
