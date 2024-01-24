package com.loans;

public class Excel {
	
	String id,name,email,occupation,address,contact,loan,paid,rem,month,paidloan,balance,tloan,dates,dpaid;

	

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public String getDpaid() {
		return dpaid;
	}

	public void setDpaid(String dpaid) {
		this.dpaid = dpaid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getLoan() {
		return loan;
	}

	public void setLoan(String loan) {
		this.loan = loan;
	}

	public String getPaid() {
		return paid;
	}

	public void setPaid(String paid) {
		this.paid = paid;
	}

	public String getRem() {
		return rem;
	}

	public void setRem(String rem) {
		this.rem = rem;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getPaidloan() {
		return paidloan;
	}

	public void setPaidloan(String paidloan) {
		this.paidloan = paidloan;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public String getTloan() {
		return tloan;
	}

	public void setTloan(String tloan) {
		this.tloan = tloan;
	}

	public Excel(String id, String name, String email, String occupation, String address, String contact, String loan,
			String paid, String rem, String month, String paidloan, String balance, String tloan, String dates,
			String dpaid) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.occupation = occupation;
		this.address = address;
		this.contact = contact;
		this.loan = loan;
		this.paid = paid;
		this.rem = rem;
		this.month = month;
		this.paidloan = paidloan;
		this.balance = balance;
		this.tloan = tloan;
		this.dates = dates;
		this.dpaid = dpaid;
	}

	

	

	
}
