<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr><td>ID</td><td>Name</td><td>Email</td><td>Occupation</td><td>Address</td><td>Contact</td><td>Loan Amount</td><td>EMI</td>
<td>Months paided</td><td>No.of month need to pay</td><td>Amount paid</td><td>Balance amount</td><td>Total Amount</td>
<td>Date</td><td>Payment</td></tr><tr>
<%@ page import="com.loans.Excel"  %>
<%@ page import="java.util.*"  %>
<%
response.setContentType("application/vmd.ms-excel");
response.setHeader("Content-Disposition","inline;filename=report.xls");
ArrayList<Excel> excels=(ArrayList<Excel>) session.getAttribute("exl");
	for(Excel ex:excels){%>
		<td><%= ex.getId() %></td>
		<td><%= ex.getName() %></td>
		<td><%= ex.getEmail() %></td>
		<td><%= ex.getOccupation() %></td>  
		<td><%= ex.getAddress() %></td>
		<td><%= ex.getContact() %></td>
		<td><%= ex.getLoan() %></td>
		<td><%= ex.getPaid() %></td>
		<td><%= ex.getRem() %></td>
		<td><%= ex.getMonth() %></td>
		<td><%= ex.getPaidloan() %></td>
		<td><%= ex.getBalance() %></td>
		<td><%= ex.getTloan() %></td>
		<td><%= ex.getDates() %></td>
		<td><%= ex.getDpaid() %></td>
		</tr>
	
<% }%>
</table>

</body>
</html>