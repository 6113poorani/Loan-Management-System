
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up for Borrowers </title>
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
	margin-top:10px;
    margin-left: 280px;
    width:100%;
    height:600px;
    max-width:820px ;
    background:white;
    border-radius:20px;
    box-shadow:0 0 5px 10px white;
    overflow:hidden;
    grid-template-columns:repeat(2,1fr);
    display:grid;z-index:1000;
}
.signup{
    background:white;
}
.form-group{
margin-left:60px;
margin-top:12px;
text-decoration:none;
}

.form :where(.form-group input,#address) {
  position: relative;
  outline: none;
  color: #707070;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding-top:4px;
  padding-bottom:4px;
}
 .form-group input{
 position: relative;
  outline: none;
  color: #707070;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding-top:4px;
  padding-bottom:4px;}
.form-group select{
 position: relative;
  outline: none;
  color: #707070;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding-top:4px;
  padding-bottom:4px;}

.sup{
margin-left:50px;
}
.signup-image{
margin-top:60px;
    margin-left:30px;
}
a{text-decoration:none;
}
.already{
margin-left:100px;
margin-bottom:10px;
color:rgb(44, 146, 255);
}
.already:hover{color:red;
}
.img{
	margin-bottom:70px;
}
.reg{
margin-left:10px;
margin-top:20px;
background-color:rgb(44, 146, 255);
border: none;
border-radius: 5px;
padding: 9px;
color:white;
}
.reg:hover{background-color:green;
}
#name{ margin-left:35px;}#email{ margin-left:35px;}#password{margin-left:17px;}#dob{margin-left:14px;}
#country{ margin-left:19px;}#address{ margin-left:22px;}#contact{ margin-left:22px;}
#city{ margin-left:44px;}#state{ margin-left:39px;}#pincode{ margin-left:13px;}
.error{color:red;}
#togglePassword{cursor:pointer;}
</style>

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">


	<div class="main">
		
			<div class="item">
				<div class="signup">
					
						<h2 class="sup" >Sign up</h2>
					<form method="post" action="Regbor" id="form" enctype="multipart/form-data" class="form" onsubmit="return validateForm() ">
						
							<div class="form-group">
								<label for="name">Name</label> 
								<input type="text" name="name" id="name" placeholder="Your Name" >
									<div class="error" id="nameError" ></div>
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input
									type="text" name="email" id="email" placeholder="Your Email" >
									<div class="error" id="emailError" ></div> 
							</div>
						<div class="form-group">Gender<br>
						<input type="radio"  id="gender" name="gender" value="male" >Male
						<input type="radio"  id="gender" name="gender" value="female" >female
						<input type="radio"  id="gender" name="gender" value="other" >others
						
						<div class="error" id="genderError" ></div>
						</div>
			
         
							<div class="form-group">
								<label for="password">Password</label> <input
									type="password" name="password" id="password" placeholder="password" >
										<span id="togglePassword" class="password-toggle">👁️</span>
									
									<div class="error" id="passwordError" ></div>
							</div>
							
				<div class="form-group">
			 <label>Birth Date</label>
            <input type="date" id="dob" name="dob" placeholder="Enter birth date" >
            <div class="error" id="dobError" ></div></div>
							
							
						
							
							
							<div class="form-group">
							Upload Aadhar(img)<input type="file" name="adhar" id="adhar">
							<div class="error" id="adharError" ></div></div>
							<div class="form-group">
							Upload PAN(img)<input type="file" name="pan" id="pan">
							<div class="error" id="panError" ></div></div>
							
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" > <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="terms.jsp" class="term-service">Terms
										of service</a></label>	
								<div class="error" id="agreeError" ></div></div>	
					
							
						
					</div>
					<div class="signup-image">
				
            <div class="form-group">
								<label >Occupation</label> <input
									type="text" name="occupation" id="occupation" placeholder="Occupation" >
									<div class="error" id="occupationError" ></div>
							</div>
					<div class="form-group">
					<label for="address">Annual Income</label>
								<input type="number"  name="income" id="income" placeholder="Annual Income" >
								<div class="error" id="annualError" ></div>
							</div>
												<div class="form-group">
								<label for="address">Address</label>
								<input type="text"  name="address" id="address" placeholder="Address" >
								<div class="error" id="addressError" ></div>
							</div>
							<div class="form-group">
<label for="dropdown">Country:</label>
            <select class="form-select country" aria-label="Default select example" onchange="loadStates()" name="country" id="country">
                <option value="">Select a country</option>
            </select>
            <div class="error" id="countryError" ></div></div>
            <div class="form-group">
             <label for="state">State:</label>
            <select class="form-select state" aria-label="Default select example" onchange="loadCities()" id="state" name="state">
		 <option>Select a country first    </option>
             </select><div class="error" id="stateError" ></div></div>
<div class="form-group">

        <label for="city">City:</label>
            <select class="form-select city" aria-label="Default select example"  id="city" name="city">
                <option>Select a state first</option>
            </select>
              <div class="error" id="cityError" ></div></div>

        
							<div class="form-group">
								<label >Pin-Code</label>
								<input type="number" name="pincode" id="pincode" placeholder="PinCode" >
								<div class="error" id="pincodeError" ></div>
							</div>
							<div class="form-group">
								<label for="contact">Contact</label>
								<input type="number" name="contact" id="contact" placeholder="Contact no" >
								<div class="error" id="contactError" ></div>
							</div>
					
					
					
								<input type="submit" name="signup" id="signup"
									class="reg" value="Register" />
									<a href="loginbor.jsp" class="already">I am already
							member</a>
							</div>
						</form>
						
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
var nameInput = document.getElementById('name');
var nameError = document.getElementById('nameError');

// Add an input event listener to the input field
nameInput.addEventListener('input', function () {
  // Define a regular expression pattern that allows only letters and spaces
  var pattern = /^[A-Za-z\s]*$/;

  // Get the user's input value
  var inputValue = nameInput.value;

  // Replace any characters that don't match the pattern with an empty string
  var sanitizedValue = inputValue.replace(new RegExp(`[^A-Za-z\\s]*`, 'g'), '');

  // Update the input field value with the sanitized value
  nameInput.value = sanitizedValue;

  // Check if the sanitized value is empty (i.e., no valid characters were entered)
  if (sanitizedValue.trim() === '') {
    // Show an error message
    nameError.textContent = 'Please enter only letters and spaces';
    nameInput.classList.add('error');
  } else {
    // Clear the error message and error class
    nameError.textContent = '';
    nameInput.classList.remove('error');
  }
});

var emailInput = document.getElementById('email');
var emailError = document.getElementById('emailError');

emailInput.addEventListener('input', function () {
  var inputValue = emailInput.value;

  if (isValidEmail(inputValue)) {
	  emailError.textContent = '';
    emailInput.classList.remove('error');
  } else {
    emailError.textContent = 'Please enter a valid email address';
    emailInput.classList.add('error');
  }
});

function isValidEmail(email) {
  // Regular expression pattern for basic email format validation
  var emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
  return emailPattern.test(email);
}
var genderRadios = document.getElementsByName('gender');
var genderError = document.getElementById('genderError');

// Add a change event listener to the radio inputs
for (var i = 0; i < genderRadios.length; i++) {
  genderRadios[i].addEventListener('change', function () {
    // Check if at least one radio option is selected
    var isChecked = false;
    for (var j = 0; j < genderRadios.length; j++) {
      if (genderRadios[j].checked) {
        isChecked = true;
        break;
      }
    }

    if (!isChecked) {
      // Show an error message
      genderError.textContent = 'Please select a gender';
      genderError.classList.add('error');
    } else {
      // Clear the error message and error class
      genderError.textContent = '';
      genderError.classList.remove('error');
    }
  });
}







var passwordInput = document.getElementById('password');
var passwordError = document.getElementById('passwordError');

passwordInput.addEventListener('input', function () {
  var inputValue = passwordInput.value;
  var errors = validatePassword(inputValue);

  if (errors.length === 0) {
    passwordError.textContent = '';
    passwordInput.classList.remove('error');
  } else {
    passwordError.textContent = errors.join(' ');
    passwordInput.classList.add('error');
  }
});

function validatePassword(password) {
  var errors = [];

  if (password.length < 8) {
    errors.push('Atleast 8 characters long.');
  }

  if (!/[A-Z]/.test(password)) {
    errors.push('Atleast one uppercase letter');
  }

  if (!/[a-z]/.test(password)) {
    errors.push('Atleast one lowercase letter');
  }

  if (!/[^A-Za-z0-9]/.test(password)) {
    errors.push('Atleast one special character');
  }

  return errors;
}





var dobInput = document.getElementById('dob');
var dobError = document.getElementById('dobError');

// Add an input event listener to the date of birth input
dobInput.addEventListener('input', function () {
  validateAge();
});

function validateAge() {
  var birthdate = dobInput.value;

  if (birthdate.trim() === '') {
    dobError.textContent = 'Date of Birth is required';
    dobError.classList.add('error');
    return;
  }

  var dob = new Date(birthdate);
  var currentDate = new Date();
  var age = currentDate.getFullYear() - dob.getFullYear();

  // Check if the birthday has already occurred this year
  if (currentDate.getMonth() < dob.getMonth() || (currentDate.getMonth() === dob.getMonth() && currentDate.getDate() < dob.getDate())) {
    age--;
  }

  if (age < 18) {
    dobError.textContent = 'Above 18 yrs only allowed';
    dobError.classList.add('error');
  } else {
    dobError.textContent = '';
    dobError.classList.remove('error');
  }
}



var adharInput = document.getElementById('adhar');
var panInput = document.getElementById('pan');
var adharError = document.getElementById('adharError');
var panError = document.getElementById('panError');

// Add an input event listener to the adhar input
adharInput.addEventListener('input', function () {
  validateFile(adharInput, adharError, 1); // Specify the maximum file size in megabytes (5MB)
});

// Add an input event listener to the pan input
panInput.addEventListener('input', function () {
  validateFile(panInput, panError, 1); // Specify the maximum file size in megabytes (5MB)
});

function validateFile(input, errorElement, maxFileSizeInMB) {
  if (input.value === '') {
    errorElement.textContent = 'Upload Image';
  } else {
    var file = input.files[0];
    var fileSizeInBytes = file.size;
    var fileSizeInMB = fileSizeInBytes / (1024 * 1024);

    if (fileSizeInMB > maxFileSizeInMB) {
      errorElement.textContent = 'File size must be less than ' + maxFileSizeInMB + 'MB.';
      input.value = ''; // Clear the input field
    } else if (
      !(
        file.type === 'image/jfif' ||
        file.type === 'image/jpeg' ||
        file.type === 'image/png' ||
        file.type === 'image/gif'
      )
    ) {
      errorElement.textContent = 'Please select a valid image file (JPEG, PNG, GIF).';
      input.value = ''; // Clear the input field
    } else {
      errorElement.textContent = '';
    }
  }
}


var occupationInput = document.getElementById('occupation');
var occupationError = document.getElementById('occupationError');

// Add an input event listener to the input field
occupationInput.addEventListener('input', function () {
  // Define a regular expression pattern that allows only letters and spaces


  // Get the user's input value
  var inputValue = occupationInput.value;
	  

  // Check if the sanitized value is empty (i.e., no valid characters were entered)
  if (inputValue.trim() === '') {
    // Show an error message
    occupationError.textContent = 'Please enter Occupation';
    occupationInput.classList.add('error');
  } else {
    // Clear the error message and error class
    occupationError.textContent = '';
    occupationInput.classList.remove('error');
  }
});



var annualInput = document.getElementById('income');
var annualError = document.getElementById('annualError');

// Add an input event listener to the input field
annualInput.addEventListener('input', function () {
  // Define a regular expression pattern that allows only letters and spaces


  // Get the user's input value
  var inputValue = annualInput.value;
	  

  // Check if the sanitized value is empty (i.e., no valid characters were entered)
  if (inputValue.trim() === '') {
    // Show an error message
   annualError.textContent = 'Please enter Amount';
   annualInput.classList.add('error');
  } else {
    // Clear the error message and error class
    annualError.textContent = '';
    annualInput.classList.remove('error');
  }
});


var addressInput = document.getElementById('address');
var addressError = document.getElementById('addressError');

// Add an input event listener to the input field
addressInput.addEventListener('input', function () {
  // Define a regular expression pattern that allows only letters and spaces
  var pattern = /^[A-Za-z\s]*$/;

  // Get the user's input value
  var inputValue = addressInput.value;
	  

  // Check if the sanitized value is empty (i.e., no valid characters were entered)
  if (inputValue.trim() === '') {
    // Show an error message
    addressError.textContent = 'Please enter Address';
    addressInput.classList.add('error');
  } else {
    // Clear the error message and error class
    addressError.textContent = '';
    addressInput.classList.remove('error');
  }
});

var countrySelect = document.getElementById('country');
var countryError = document.getElementById('countryError');

// Add a change event listener to the select dropdown
countrySelect.addEventListener('change', function () {
  // Check if a city is selected (a non-empty value)
  var selectedcountry = countrySelect.value;

  if (selectedcountry === '') {
    // Show an error message
   countryError.textContent = 'Please select a Country';
   countryError.classList.add('error');
  }
  else if (selectedcountry !== 'India') {
      // Show an error message
     alert('Indians can only enter into this App');
     countryError.classList.add('error');
    }else {
    // Clear the error message and error class
    countryError.textContent = '';
    countryError.classList.remove('error');
  }
});


var stateSelect = document.getElementById('state');
var stateError = document.getElementById('stateError');

// Add a change event listener to the select dropdown
stateSelect.addEventListener('change', function () {
  // Check if a city is selected (a non-empty value)
  var selectedstate = stateSelect.value;

  if (selectedstate === '') {
    // Show an error message
    stateError.textContent = 'Please select a State';
    stateError.classList.add('error');
  } else {
    // Clear the error message and error class
    stateError.textContent = '';
    stateError.classList.remove('error');
  }
});


var citySelect = document.getElementById('city');
var cityError = document.getElementById('cityError');

// Add a change event listener to the select dropdown
citySelect.addEventListener('change', function () {
  // Check if a city is selected (a non-empty value)
  var selectedCity = citySelect.value;

  if (selectedCity === '') {
    // Show an error message
    cityError.textContent = 'Please select a city';
    cityError.classList.add('error');
  } else {
    // Clear the error message and error class
    cityError.textContent = '';
    cityError.classList.remove('error');
  }
});



var pincodeInput = document.getElementById('pincode');
var pincodeError = document.getElementById('pincodeError');

pincodeInput.addEventListener('input', function () {
  var inputValue = pincodeInput.value;
  var isValid = validatePincode(inputValue);

  if (isValid) {
    pincodeError.textContent = '';
    pincodeInput.classList.remove('error');
  } else {
    pincodeError.textContent = 'Please enter a valid 6-digit Pin-Code ';
    pincodeInput.classList.add('error');
  }
});

function validatePincode(pincode) {
  var pincodePattern = /^\d{6}$/;
  return pincodePattern.test(pincode);
}

var contactInput = document.getElementById('contact');
var contactError = document.getElementById('contactError');

contactInput.addEventListener('input', function () {
  var inputValue = contactInput.value;
  var isValid = validateIndianPhoneNumber(inputValue);

  if (isValid) {
    contactError.textContent = '';
    contactInput.classList.remove('error');
  } else {
    contactError.textContent = 'Please enter a valid Indian phone number.';
    contactInput.classList.add('error');
  }
});

function validateIndianPhoneNumber(phoneNumber) {
  // Regular expression pattern for Indian phone numbers (10 digits, starting with 7, 8, or 9)
  var phonePattern = /^[6789]\d{9}$/;
  return phonePattern.test(phoneNumber);
}
document.getElementById("form").onsubmit = function (event) {
      var name = document.getElementById("name").value;
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;
     var occupation = document.getElementById("occupation").value;
      var amount= document.getElementById("income").value;

      var address = document.getElementById("address").value;
      var country = document.getElementById("country").value;
       var state = document.getElementById("state").value;
     var city = document.getElementById("city").value;
       var contact = document.getElementById("contact").value;
       var pincode = document.getElementById("pincode").value;
       
       
       var gender = document.getElementsByName("gender");
       var  agreeterm= document.getElementsByName("agree-term");
       var i=1;
      // Reset previous error messages
      var errorElements = document.querySelectorAll(".error");
      for (var i = 0; i < errorElements.length; i++) {
          errorElements[i].innerHTML = "";
      }
      
      
      var isGenderSelected = false;
       for (var i = 0; i < gender.length; i++) {
           if (gender[i].checked) {
               isGenderSelected = true;
               break;
           }
       }
       

       // Check if at least one hobby is selected
       var isagree = false;
       for (var i = 0; i < agreeterm.length; i++) {
           if (agreeterm[i].checked) {
               isagree = true;
               break;
           }
       }

      // Validate username (at least 3 characters)
      if (name==="") {
          document.getElementById("nameError").innerHTML = "Name is required ";
         i*=0;
          event.preventDefault();
      }
     
      else if (name.length<3 ) {
           document.getElementById("nameError").innerHTML = "Atleast above 3 characters";

           i*=0;

           event.preventDefault();
     
     }

      // Validate email (simple pattern)
      var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
      if (email==="") {
          document.getElementById("emailError").innerHTML = "Email is required ";
         
          i*=0;
          event.preventDefault();
      }
      else if (!emailPattern.test(email)) {
          document.getElementById("emailError").innerHTML = "Enter a Valid Email ";
          i*=0;

          event.preventDefault();
      }
     if (!isGenderSelected) {
           document.getElementById("genderError").innerHTML = "Gender is required";
           i*=0;
          // genderError.textContent = " Gender is Required ";
           event.preventDefault();
       }

      // Validate password (at least 6 characters)
      if (password ==="") {
          document.getElementById("passwordError").innerHTML = "Password is required.";
          event.preventDefault(); i*=0;
      }
      else if (password.length < 8) {
       	// alert("\nPassword must be atleast 8 charcter.\nPassword should contains lowerCase.\nPassword should contains UpperCase.\nPassword should contains digits"); 
       	 document.getElementById("passwordError").innerHTML= "Password must be atleast 8 charcter";
       	 event.preventDefault(); i*=0;
       
       }

       // Check for at least one lowercase letter
       else if (!/[a-z]/.test(password)) {
       	 document.getElementById("passwordError").innerHTML = "Password contains lowerCase";
       	 event.preventDefault(); i*=0;
       	
       }

       // Check for at least one uppercase letter
       else if (!/[A-Z]/.test(password)) {
       	 document.getElementById("passwordError").innerHTML = "Password contains UpperCase";
       	 event.preventDefault(); i*=0;
       	
       }
       else if (!/[0-9]/.test(password)) {
       	 document.getElementById("passwordError").innerHTML = "Password contains digits";
       	 event.preventDefault(); i*=0;
       	
       }

       // Check for at least one special character (e.g., !@#$%^&*)
       else  if (!/[!@#$%^&*]/.test(password)) {
       	 document.getElementById("passwordError").innerHTML= "Password contains special character";
       	 event.preventDefault(); i*=0;
       	
       }
     if (occupation==="") {
          document.getElementById("occupationError").innerHTML = "Occupation is required";
          event.preventDefault(); i*=0;
      }
      if (amount==="") {
          document.getElementById("annualError").innerHTML = "Amount is required";
          event.preventDefault(); i*=0;
      }
      
      if (address==="") {
          document.getElementById("addressError").innerHTML = "Address is required";
          event.preventDefault(); i*=0;
      }
      if (country === "") {
       	
   	   document.getElementById("countryError").innerHTML = " Country is Required ";
   	 i*=0;
       	  event.preventDefault(); // Prevent the form from submitting
       } 
      else if (country !== "India") {
      	
   	   alert("Indians only can enter into this app");
   	   i*=0;
       	  event.preventDefault(); // Prevent the form from submitting
       }
       if (state === ""||state ==='Select a country first') { i*=0;
       	document.getElementById("stateError").innerHTML= " State is Required ";
          
       	  event.preventDefault(); // Prevent the form from submitting
       }
      
        
       if (city === ""||city === 'Select a State first'||city === 'Select a state first') {
       	document.getElementById("cityError").innerHTML = " City is Required ";
        i*=0;
       	  event.preventDefault(); // Prevent the form from submitting
       }
       
       
       
       
       if (pincode=== "") {
       	document.getElementById("pincodeError").innerHTML = "Pincode is required";
       	event.preventDefault(); i*=0;
         
         }  else if (pincode.length !==6 || !/[0-9]/.test(pincode) || /[a-z]/.test(pincode) || /[A-Z]/.test(pincode)) {
       	  document.getElementById("pincodeError").innerHTML = " must be atleast 6 digits";
       	  event.preventDefault(); i*=0;
       
       }  var pattern = /^[6789]\d{9}$/;
       if (contact=== "") {
       	document.getElementById("contactError").innerHTML = "Contact is required";
       	event.preventDefault(); i*=0;
         
         }  else if (!pattern.test(contact)) {
       	  document.getElementById("contactError").innerHTML = " Should be a indian number";
       	  event.preventDefault(); i*=0;
       
       }
      

       
  
       
      

       // Check if a file is selected
        if (document.getElementById("adhar").value==='') { i*=0;
    	   document.getElementById("adharError").innerHTML = "Upload Image";

           event.preventDefault();
       }
        else  if(!(document.getElementById("adhar").files[0].type==="image/jfif"||document.getElementById("adhar").files[0].type==="image/jpeg"|| document.getElementById("adhar").files[0].type==="image/png"|| document.getElementById("adhar").files[0].type==="image/gif"))
{ document.getElementById("adharError").innerHTML = "Please select a valid image file (JPEG, PNG, GIF)."; i*=0;

event.preventDefault();
    	  
      }

       if (document.getElementById("pan").value==='') {
    	   document.getElementById("panError").innerHTML = "Upload Image"; i*=0;

           event.preventDefault();
       }
       else  if(!(document.getElementById("pan").files[0].type==="image/jfif"||document.getElementById("pan").files[0].type==="image/jpeg"|| document.getElementById("pan").files[0].type==="image/png"|| document.getElementById("pan").files[0].type==="image/gif"))
       { document.getElementById("panError").innerHTML = "Please select a valid image file (JPEG, PNG, GIF)."; i*=0;

       event.preventDefault();
           	  
             }
      
      
       
       
       
       
        var birthdate = document.getElementById("dob").value;
            if (birthdate.trim() === "") {
            	 document.getElementById("dobError").innerHTML = "Date of Birth is required";
            	 i*=0;
                 event.preventDefault();
               
              }
            var dob = new Date(birthdate);
            var currentDate = new Date();
            var age = currentDate.getFullYear() - dob.getFullYear();

            // Check if the birthday has already occurred this year
            if (currentDate.getMonth() < dob.getMonth() || (currentDate.getMonth() === dob.getMonth() && currentDate.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 18) {
            	 document.getElementById("dobError").innerHTML = "Above 18 yrs only allowed";
            	 i*=0;
                 event.preventDefault();
           
        }
           
             
        
       
      if (!isagree&&i==1) {
       	alert("Accept the terms and conditions");

           event.preventDefault();
       }

};
           
            
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("form");
    const name = document.getElementById("name");
    const email = document.getElementById("email");
    const password = document.getElementById("password");
    const occupation = document.getElementById("occupation");
    const amount = document.getElementById("income");
    const address = document.getElementById("address");
  
    const pincode = document.getElementById("pincode");
    const contact = document.getElementById("contact");
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var pattern = /^[789]\d{9}$/;
    
    
  
    form.addEventListener("submit", function(event) {
        if (name.value.trim() === "") {
            event.preventDefault(); // Prevent form submission
            name.focus(); // Focus on the empty input field
        }
       
        else if ( name.value.length<3) {
       	 event.preventDefault(); // Prevent form submission
           name.focus(); 
         
         }
        else if (email.value.trim() === "") {
            event.preventDefault(); // Prevent form submission
            email.focus(); // Focus on the empty input field
        }
    
       
        else if (!emailPattern.test(email.value)) {

           event.preventDefault();
           email.focus();
       }
       
       else  if (password.value.length ==="") {
    	   password.focus();
    	   event.preventDefault();
       }
       else if (password.value.length < 8) {
        	// alert("\nPassword must be atleast 8 charcter.\nPassword should contains lowerCase.\nPassword should contains UpperCase.\nPassword should contains digits"); 
password.focus();
event.preventDefault();
        
        }

        // Check for at least one lowercase letter
        else if (!/[a-z]/.test(password.value)) {
        	 password.focus();
        	   event.preventDefault();
        	
        }

        // Check for at least one uppercase letter
        else if (!/[A-Z]/.test(password.value)) {
        	 password.focus();
        	   event.preventDefault();
        	
        }
        else if (!/[0-9]/.test(password.value)) {
        	 password.focus();
        	   event.preventDefault();
        	
        }

        // Check for at least one special character (e.g., !@#$%^&*)
        else  if (!/[!@#$%^&*]/.test(password.value)) {
        	 password.focus();
        	   event.preventDefault();
        	
        }

        else if (occupation.value.trim() === "") {
            event.preventDefault(); // Prevent form submission
            occupation.focus(); // Focus on the empty input field
        }
        else if (amount.value.trim() === "") {
            event.preventDefault(); // Prevent form submission
            income.focus(); // Focus on the empty input field
        }
       else  if (address.value==="") {
    	   address.focus();
    	   event.preventDefault();
       }
      
        
        
        
       else  if (pincode.value=== "") {
    	   pincode.focus();
    	   event.preventDefault();
          
          }  else if (pincode.value.length !==6 || !/[0-9]/.test(pincode.value) || /[a-z]/.test(pincode.value) || /[A-Z]/.test(pincode.value)) {
        	  pincode.focus();
        	   event.preventDefault();
        
        }  
          else if (contact.value=== "") {
        	  contact.focus();
        	   event.preventDefault();
          
          }  else if (!pattern.test(contact.value)) {
        	  contact.focus();
        	   event.preventDefault();
        }
       

         
        
       

    });
}); 

           
            
   
		
		</script>
  <script src="drop.js"></script>
   

	
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="success"){
	swal("Congrats","Account created Successfully","success");
}
</script>


</body>
</html>