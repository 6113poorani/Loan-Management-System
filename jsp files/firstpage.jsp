<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&family=Ubuntu:wght@300;400;500;700&display=swap"
        rel="stylesheet">
    <title>Loan Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Ubuntu', sans-serif;
            scroll-behavior: smooth;
            scroll-margin: 175px;
             
        }
        

        body {
            display: flex;
            flex-direction: column;
            align-items: center;
             background:  #e7f2fd;        }

        .main {
            width: 100vw;
            height: 175px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #070056;
            display: flex;
            flex-direction: column;
        }

        section {
            height: 100vh;
        }

        .down {
            width: 100vw;
            display: flex;
            justify-content: space-evenly;
            margin-bottom: 2vh;
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .navbar .logo {
            width: 200px;
            cursor: pointer;
            margin-left: 20px;
        }

        .h1 {
            padding-top: 10px;
            font-style: bold;
            font-size: 2rem;
            color: white;
        }

        .bg {
            margin-top: 150px;
            background-color: white;
            width: 100%;
            background-color: red;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .contant {
            display: flex;
            background-image: linear-gradient(45deg, rgb(3, 42, 106), rgb(44, 146, 255));
            padding: 20px;
            border-radius: 20px;
            margin-bottom: 10vh;
        }

        .contant>div {
            width: 40vw;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 70vh;
            border-radius: 20px;
        }
		#open{
			position:relative;
			dispay:inline-block;
		}
        .main1 {
            display: none;
            position: absolute;
            padding: 15px;
            right:0.5px;
            top:0.5px;
            min-width: 160px;
            border-radius: 10px;
            background-color: rgb(7, 115, 238);
            z-index:1;
        }
         #open:hover .main1{
         display:block;
         }

        .b1 {
            color: white;
            font-weight: 400;
            padding: 15px;
            margin-bottom: 5px;
            width: 8vw;
            background-color: transparent;
            border-style: solid;
            border-color: white;
            border-radius: 50px;
        }

        .close {
            padding: 10px;
            border-radius: 50px;
            color: blue;
            background-color: white;
            border-style: none;
        }

        .open {
            padding: 10px;
            border-radius: 50px;
            color: blue;
            background-color: white;
            border-style: none;
            display: block;
            margin-right: 20px;
            margin-left: 7vw;
        }

        .mainbtn {
            width: 50vw;
            display: flex;
            justify-content: space-between;
        }

        .he>img {
            width: 35vw;
            border-radius: 10px;
        }

        .para>p {
            background-color: rgba(149, 215, 248, 0.574);
            padding: 20px;
            border-radius: 10px;
            color: white;
        }

        .headgap {
            margin: 2vh 0;
            text-align: center;
        }

        #home {
            margin-top: 180px;
        }
        .lo{
        line-height:50px;
        width:50%;}
        
    </style>
</head>

<body>
    <div class="main">
        <div class="navbar">
            <img src="https://oneyesinfotechsolutions.com/img/oneyes%20logo.png" class="logo">
            <div class="h1">LOAN MANAGEMENT SYSTEM</div>
            <div id="open">
               <button class="open" onclick="toggleMenu()">Login/SignUp</button>
            <div class="main1">
           		<button class="b1" onclick="location.href='login.jsp'">ADMIN</button><br>
            	<button class="b1" onclick="location.href='loginlen.jsp'">LENDERS</a></button><br>
           		<button class="b1" onclick="location.href='loginbor.jsp'">BORROWERS</a></button><br>
            </div>
            </div>
        </div>
        <div class="down">
            <div class="mainbtn">
                <button class="b1" onclick="location.href='#home'">Home</button>
                <button class="b1" onclick="location.href='#loan'">Loans</button>
                <button class="b1" onclick="location.href='#About us'">About us</button>
                <button class="b1" onclick="location.href='#Services'">Services</button>
                <button class="b1" onclick="location.href='#contact'">Contact </button>
            </div>
        </div>
    </div>
<div class="bb">
    <section id="home">
        <div class="headgap">
            <h1>Home</h1>
        </div>
        <div class="contant">
            <div class="he">
                <img src="https://images.assettype.com/fortuneindia%2F2022-06%2F1fa744fc-adb4-48fd-a40e-54e45a7edc8b%2FGettyImages_955530262.jpg?rect=0,66,2129,1198&w=1250&q=60"
                    alt="">
            </div>
            <div class="para">
                <p>
                    Loans are financial instruments that provide individuals and businesses with access to capital
                    for various purposes, such as buying a home, starting a business, or covering unexpected
                    expenses. They typically involve borrowing a specific amount of money from a lender, with an
                    agreement to repay it over time with interest. Loans come in various types, including personal
                    loans, mortgages, auto loans, and student loans. The terms and conditions of loans, including
                    interest rates and repayment schedules, can vary widely depending on the lender and the
                    borrower's creditworthiness. Careful consideration and responsible borrowing are essential when
                    taking out loans to manage debt effectively.
                </p>
            </div>
        </div>
    </section>
    
     <section id="loan">
        <div class="headgap">
            <h1>Loan</h1>
        </div>
        <div class="contant">
           
                
            <div class="he">
                   <img class="ll" src="images/lk.jfif">
                </div>
                <div class="para">
                 <p class="lo">
                  
                     Business Loan<br>
                    Home Loan<br>
                   Education Loan<br>
                   Vehicle Loan<br>
                   Personnel Loan<br>
                </p>
        </div>
    </section>
    
    
    
    
    <section id="About us">
        <div>
            <div class="headgap">
                <h1>About us</h1>
            </div>
            <div class="contant">
                <div class="he">
                    <img src="https://images.assettype.com/fortuneindia%2F2022-06%2F1fa744fc-adb4-48fd-a40e-54e45a7edc8b%2FGettyImages_955530262.jpg?rect=0,66,2129,1198&w=1250&q=60"
                        alt="">
                </div>
                <div class="para">
                    <p>
                        At OneYes Loan Management, we are committed to revolutionizing the way financial institutions
                        and
                        lending organizations manage loans. With a passion for innovation and a dedication to
                        simplifying
                        complex processes, we have developed a state-of-the-art Loan Management System (LMS) that
                        empowers
                        lenders to thrive in today's dynamic financial landscape.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section id="Services">
        <div>
            <div class="headgap">
                <h1>Services</h1>
            </div>
            <div class="contant">
                <div class="he">
                    <img src="https://images.assettype.com/fortuneindia%2F2022-06%2F1fa744fc-adb4-48fd-a40e-54e45a7edc8b%2FGettyImages_955530262.jpg?rect=0,66,2129,1198&w=1250&q=60"
                        alt="">
                </div>
                <div class="para">
                    <p>
                        One key aspect of LMS services is loan origination. It allows for easy application intake,
                        credit
                        checks, and automated underwriting, ensuring that only qualified applicants receive loans. LMS
                        also
                        facilitates document management, making it effortless to collect and store necessary borrower
                        documentation.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <section id="contact">
        <div class="headgap">
            <h1>Contact</h1>
        </div>
        <div class="contant">
            <div class="he">
                <img src="https://bengalpeerless.com/wp-content/uploads/2019/06/c3.jpg" alt="">
            </div>
            <div class="para">
                <p>
                    Email: pooranivijayan@gmail.com<br>
                    contact: 7397601567
                </p>
            </div>
        </div>
    </section>
    </div>
    
    <script>
        function toggleMenu() {
            const main1 = document.querySelector('.main1');
            const openButton = document.querySelector('.open');

            if (main1.style.display === 'none' || main1.style.display === '') {
                main1.style.display = 'flex';
                main1.classList.add('main1show');
                openButton.style.display = 'none';
            } else {
                main1.style.display = 'none';
                main1.classList.remove('main1show');
                openButton.style.display = 'block';
            }
        }

        function closeApp() {
            const main1 = document.querySelector('.main1');
            const openButton = document.querySelector('.open');

            if (main1.style.display === 'none' || main1.style.display === '') {
                main1.style.display = 'flex';
                main1.classList.add('main1show');
                openButton.style.display = 'none';
            } else {
                main1.style.display = 'none';
                main1.classList.remove('main1show');
                openButton.style.display = 'block';
            }
        }

    </script>
</body>

</html>