<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Forgot Password</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
	background-position: center;
	background-color: #eee;
	background-repeat: no-repeat;
	background-size: cover;
	color: #505050;
	font-family: "Rubik", Helvetica, Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.5;
	text-transform: none
}

.forgot {
	background-color: #fff;
	padding: 12px;
	border: 1px solid #dfdfdf
}

.padding-bottom-3x {
	padding-bottom: 72px !important
}

.card-footer {
	background-color: #fff
}

.btn {
	font-size: 13px
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #76b7e9;
	outline: 0;
	box-shadow: 0 0 0 0px #28a745
}
span{
color:white;
text-decoration:none;}
.bton{
padding:3px;
text-decoration:none;
background-color:red;
border-color:red;
border-radius:5px;
margin-top:20px;
margin-left:20px;
margin-right:500px;
size:5px;

}
.error{color:red;}
</style>
</head>
<%	String type=String.valueOf(session.getAttribute("type")); %>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container padding-bottom-3x mb-2 mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="forgot">
					<h2>Forgot your password?</h2>
					<p>Change your password in three easy steps. This will help you
						to secure your password!</p>
					<ol class="list-unstyled">
						<li><span class="text-primary text-medium">1. </span>Enter
							your email address below.</li>
						<li><span class="text-primary text-medium">2. </span>Our
							system will send you an OTP to your email</li>
						<li><span class="text-primary text-medium">3. </span>Enter the OTP on the 
						next page</li>
					</ol>
				</div>
				<form class="card mt-4"  id="form" action="ForgotPassword" method="POST" onsubmit="return validateForm() ">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">Enter your email address</label> <input
								class="form-control" type="text" name="email" id="email" ><small
								class="form-text text-muted">Enter the registered email address . Then we'll
								email a OTP to this address.</small>
									<div class="error" id="emailError" ></div>
								
						</div>
					</div>
					<input type="hidden" id="type" name="type" value="<%out.print(type); %>">
					<div class="card-footer">
						<button class="btn btn-success" type="submit">Get New
							Password</button>
						
					</div></form>
					<%
					
				
					
					if(type.equals("1")){%>
						<button class="bton"><a href="login.jsp"><span>Back to
						Login</span></a></button>
						<% }
						else if(type.equals("2")){%>
						<button class="bton"><a href="loginlen.jsp"><span>Back to
						Login</span></a></button>
						<% }
						else {%>
						<button class="bton"><a href="loginbor.jsp"><span>Back to
						Login</span></a></button>
						<% }  %>
					
				
				
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
            var email = document.getElementById("email").value;
 var emailError = document.getElementById("emailError");
            
            // Reset error messages
            emailError.textContent = "";
            var emailpattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (email.trim() === "") {
            	emailError.textContent = "Email is required";
                return false;
               
              }
            else if (!emailpattern.test(email)) {
            	emailError.textContent = "Not Valid email(@gmail.com)";
                return false;
              	
              }
            return true;}
		
		document.addEventListener("DOMContentLoaded", function() {
    	    const form = document.getElementById("form");
    	    const inputField = document.getElementById("email");
    	    form.addEventListener("submit", function(event) {
    	        if (inputField.value.trim() === "") {
    	            event.preventDefault(); // Prevent form submission
    	            inputField.focus(); // Focus on the empty input field
    	        }
    	    });
    	});
		</script>
		
		
		
		
		
		
		
            
            
            
            
            
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript' src=''></script>
	<script type='text/javascript' src=''></script>
	<script type='text/Javascript'></script>
	<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
	
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="failed"){
	swal("Sorry","There is no such email in the account","error");
}
</script>




</script>
</body>
</html>