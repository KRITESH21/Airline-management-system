


<%@page import="com.app.pojos.Admin"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="alert alert-primary text-center" role="alert">
			<h2>Past Booking Details</h2>
		</div>

		<h3
			style="color: green; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>

		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Sr No</th>
							<th scope="col">Name</th>
							<th scope="col">Location</th>
							<th scope="col">Payment Type</th>
							<th scope="col">Amount Paid</th>
							<th scope="col">Date</th>

						</tr>
					</thead>
					<tbody>
						<%
							int sr_no = 0;
						%>
						<c:forEach var="book" items="${sessionScope.bookings}">
							<tr>
								<td scope="row">${sr_no=sr_no+1}</td>
								<td>${book.user.name}</td>
								<td>${book.package1.title}</td>
								<td>${book.paytype}</td>
								<td>${book.amountPaid }</td>
								<td>${book.startdate} to ${book.enddate}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<div class="alert alert-primary text-center" role="alert">
			<h2>Near by Hotel List</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Sr No</th>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Mobile</th>
					<th scope="col">City</th>
					<th scope="col">Distance From Airport</th>
					
				</tr>
			</thead>
			<tbody>
				<%
					int sr_no1 = 0;
				%>

				<c:forEach var="h" items="${sessionScope.hotellist}">

					<tr>
						<th scope="row">${sr_no1=sr_no1+1}</th>
						<td><img src="data:image/jpeg;base64,${h.imgUtility}"
							height=100px width=100px /></td>
						<td>${h.title}</td>
						<td>${h.mobile}</td>
						<td>${h.city}</td>
						<td>${h.km}</td>
						
					</tr>
				</c:forEach> 
			</tbody>
		</table>

	</div>
			
		</div>
	</div>
</div>