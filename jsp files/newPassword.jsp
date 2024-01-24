
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>New Password</title>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
	rel='stylesheet'>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	
<style>
.error{color:red;
}
.placeicon {
	font-family: fontawesome
}

.custom-control-label::before {
	background-color: #dee2e6;
	border: #dee2e6
}

</style>
</head>
<body oncontextmenu='return false' class='snippet-body bg-info'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
	<div>
		<!-- Container containing all contents -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
					<!-- White Container -->
					<div class="container bg-white rounded mt-2 mb-2 px-0">
						<!-- Main Heading -->
						<div class="row justify-content-center align-items-center pt-3">
							<h1>
								<strong>Reset Password</strong>
							</h1>
						</div>
						<div class="pt-3 pb-3">
							<form class="form form-horizontal" id="form" action="newPassword" method="POST" onsubmit="return validateForm() ">
								<!-- User Name Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="text" id="password" name="password" placeholder="&#xf084; &nbsp; New Password"
											class="form-control border-info placeicon">
											<div class="error" id="passwordError" ></div>
											
									</div>
									
								</div>
								<!-- Password Input -->
								<div class="form-group row justify-content-center px-3">
									<div class="col-9 px-0">
										<input type="password" name="confPassword" id="confPassword"
											placeholder="&#xf084; &nbsp; Confirm New Password"
											class="form-control border-info placeicon">
									<div class="error" id="password2Error" ></div>
											
									</div>
								</div>
							
								<!-- Log in Button -->
								<div class="form-group row justify-content-center">
									<div class="col-3 px-3 mt-3">
										<input type="submit" value="Reset"
											class="btn btn-block btn-info">
									</div>
								</div>
							</form>
						</div>
						<!-- Alternative Login -->
						<div class="mx-0 px-0 bg-light">
							
							<!-- Horizontal Line -->
							<div class="px-4 pt-5">
								<hr>
							</div>
						
							
							</div>
						</div>
					</div>
				</div>
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
		function validateForm() {
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("confPassword").value;

            
            
            
          
            var passwordError = document.getElementById("passwordError");
            var password2Error = document.getElementById("password2Error");

            // Reset error messages
           
            passwordError.textContent = "";
            password2Error.textContent = "";

            

          
        


            // Validate password
            if (password === "") {
                passwordError.textContent = "Password is required";
                return false;
            }
            else if (password.length < 8) {
            	 alert("Password must be atleast 8 charcter.\nPassword should contains lowerCase.\nPassword should contains UpperCase.\nPassword should contains digits"); 
            	passwordError.textContent = "Password must be atleast 8 charcter";
                return false;
            
            }

            // Check for at least one lowercase letter
            else if (!/[a-z]/.test(password)) {
            	passwordError.textContent = "Password contains lowerCase";
                return false;
            	
            }

            // Check for at least one uppercase letter
            else if (!/[A-Z]/.test(password)) {
            	passwordError.textContent = "Password contains UpperCase";
                return false;
            	
            }
            else if (!/[0-9]/.test(password)) {
            	passwordError.textContent = "Password contains digits";
                return false;
            	
            }

            // Check for at least one special character (e.g., !@#$%^&*)
            else  if (!/[!@#$%^&*]/.test(password)) {
            	passwordError.textContent = "Password contains special character";
                return false;
            	
            }
            if (password2 === "") {
                password2Error.textContent = "Confirm Password is required";
                return false;
            }
           
           if(password!==password2){
        	   alert("Sorry!\nThe Password and Confirm Password are mismatching");
        	   return false;
           }

            
            return true; 
        }
		document.addEventListener("DOMContentLoaded", function() {
    	    const form = document.getElementById("form");
    	    const inputField = document.getElementById("password");
    	    const inputField1 = document.getElementById("confPassword");

    	    form.addEventListener("submit", function(event) {
    	        if (inputField.value.trim() === "") {
    	            event.preventDefault(); // Prevent form submission
    	            inputField.focus(); // Focus on the empty input field
    	        }
    	        else if (inputField.value.length < 8) {
    	        	 event.preventDefault(); // Prevent form submission
     	            inputField.focus(); // Focus on the empty input field
     	        }
    	        
    	        else if (!/[a-z]/.test(inputField.value)) {
    	        	event.preventDefault(); // Prevent form submission
     	            inputField.focus(); 
                	
                }
    	        else if (!/[A-Z]/.test(inputField.value)) {
    	        	event.preventDefault(); // Prevent form submission
     	            inputField.focus(); 
                	
                }
                else if (!/[0-9]/.test(inputField.value)) {
                	event.preventDefault(); // Prevent form submission
     	            inputField.focus(); 
                	
                }

                // Check for at least one special character (e.g., !@#$%^&*)
                else  if (!/[!@#$%^&*]/.test(inputField.value)) {
                	event.preventDefault(); // Prevent form submission
     	            inputField.focus(); 
                	
                }
    	        else if (inputField1.value.trim() === "") {
    	            event.preventDefault(); // Prevent form submission
    	            inputField1.focus(); // Focus on the empty input field
    	        }
    	    });
    	});
		
		</script>
	
	
	<script type='text/javascript'
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

		
</body>
</html>