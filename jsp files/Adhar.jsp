<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
//System.out.print(session.getAttribute("bid"));
if(session.getAttribute("name")=="null"){
	response.sendRedirect("firstpage.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADHAR/PAN</title>
<style>
*{background-color:grey;
}
.img{
margin-left:40%;
justify-content:center;
}
.back{
text-decoration:none;
color:black;}
.ba{

font-color:black;
padding:5px;
margin-left:50%;
margin-top:10px;}
</style>
</head>
<body>
 


<%



String adharid=String.valueOf(request.getAttribute("adharid"));
String adharfile=String.valueOf(request.getAttribute("adhar"));
String panfile=String.valueOf(request.getAttribute("pan"));

if(adharfile!=""&&adharid!=""&&panfile!=""){
	%>
	<div class="img">
	<h1>Adhar Card:</h1><br>
	<img src="images/<%= adharfile%>"><br>
	<h1>PAN Card:</h1><br>
	<img src="images/<%= panfile%>"></div>
	<% 
}
%>


</body>
</html>