
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>

<title>Sign In for Lender </title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body{
background-color:rgb(3, 42, 106);
}
.main{
    width: 100%;
    background-position: center;
    background-size: cover;
    height: 90vh;
    position: relative;
    
}.item{
	margin-top:60px;
    margin-left: 280px;
    width:100%;
    height:500px;
    max-width:820px ;
    background:white;
    border-radius:20px;
    box-shadow:0 0 7px 10px white;
    overflow:hidden;
    grid-template-columns:repeat(2,1fr);
    display:grid;z-index:1000;
}
.signin{
    background:white;
}
a{
text-decoration:none;
color:rgb(44, 146, 255);
}
.signup a{
color: white;
}
.signup{
margin-top:10px;
margin-left:100px;
background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 8px;
    
}
.login{
background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 8px;
padding-left: 12px;
padding-right: 12px;
color:white;
margin-left:80px;
margin-top:50px;

}
.fp:hover{color:red;
}
.login:hover,.signup:hover{
transform:scale(1.1);
z-index:2;
box-shadow:0 0 5px 10px rgb(44, 146, 255);
}
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
}.error{color:red;}#togglePassword{cursor:pointer;}
</style>


</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

	<div class="main">
			<div class="item">
				<div class="signin">
					
						<figure>
							<img src="images/signin-image.jpg" alt="sign in image">
						</figure>
						<button class="signup"><a href="reglen.jsp" >Create an
							account</a></button>
					</div>

					<div class="submit-form">
						<h2 >Sign in</h2>
					<form method="post" action="Loginlen" class="form" onsubmit="return validateForm() ">					
			<div class="form-group">
								<label for="username">Email<br><br></label>
								<input type="text" name="username" id="username"
									placeholder="Your Email" class="name" >
									<div class="error" id="usernameError" ></div>
							</div>
							<div class="form-group">
								<label for="password">Password<br><br></label> <input
									type="password" name="password" id="password"
									placeholder="Password" class="name" >
								<span id="togglePassword" class="password-toggle">👁️</span>
									
									<div class="error" id="passwordError" ></div>
							</div>
							<% session.setAttribute("type","2"); %>
							<div class="form-group">
								<a href="forgotPassword.jsp" class="fp">Forgot Password</a></div>
							
							<div class=" form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit login" value="Log in" >
							</div>
						</form>
					
					
				</div>
			</div>
		

	</div>
	<%-- Password input field --%>
<script>
$(document).ready(function() {
    $("#togglePassword").click(function() {
        var passwordField = $("#password");
        var passwordFieldType = passwordField.attr("type");
        if (passwordFieldType === "password") {
            passwordField.attr("type", "text");
        } else {
            passwordField.attr("type", "password");
        }
    });
});
</script>
	<script>
	
	
	// Function to validate the form
	  function validateForm() {
		  var username = document.getElementById("username").value;
          var password = document.getElementById("password").value;
          var usernameError = document.getElementById("usernameError");
          var passwordError = document.getElementById("passwordError");
          
          // Reset error messages
          usernameError.textContent = "";
          passwordError.textContent = "";
          
          // Validate username
           if (username === "" && password === "") {
              usernameError.textContent = "Username is required";
              passwordError.textContent = "Password is required";

              return false;
          }
          if (username === "") {
              usernameError.textContent = "Username is required";
              return false;
          }
          
          // Validate password
          if (password === "") {
              passwordError.textContent = "Password is required";
              return false;
          }
          
          return true; 
	}
	  
	
	</script>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="failed"){
	swal("Sorry","Wrong Username or Password","error");
}
</script>
<input type="hidden" id="statu" value="<%= request.getAttribute("statu")%>">
<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var statu=document.getElementById("statu").value;
if(statu=="resetSuccess"){
	swal("Congrats","Your Password reseted Successfully ","success");
}

</script>
</body>

</html>