<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Booking & Reviews</a></li>
			<li class="breadcrumb-item active">View Feedback</li>
			<li class="breadcrumb-item"><a class="btn btn-primary right"
				href='<spring:url value="/Admin/Dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Worker Details</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.success}</h3>
			<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>

<div>
		<div class="col col-sm-12 col-lg-12">
			
				<form action='<spring:url value="/Admin/importeorkers"/>'
					method="post" enctype="multipart/form-data">
					<input class="form-control" type="file" name="efile" /><br> <br>
					<center>
						<button class="btn btn-primary">Import</button>
						<a href='<spring:url value="/Admin/removeWorkers"/>' class="btn btn-primary">Remove All Workers</a>
					</center>
					<h3 Style="color: green; text-align: center;">
						<div id="loader">
							<div id="shadow"></div>
							<div id="box"></div>
						</div>
						${requestScope.message}
					</h3>

				</form>

</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Sr No</th>
							<th scope="col">Name</th>
							<th scope="col">Mobile</th>
							<th scope="col">Email</th>
							<th scope="col">Duty</th>
							
						</tr>
					</thead>
					<tbody>
						<%
							int sr_no = 0;
						%>
						<c:forEach var="w" items="${sessionScope.workers}">

					<tr>
						<th scope="row">${sr_no=sr_no+1}</th>
					
						<td>${w.name}</td>
						<td>${w.mobile}</td>
						<td>${w.email}</td>
						<td>${w.duty}</td>
						
					</tr>
					</c:forEach> 
					</tbody>
				</table>
		</div>
	</div>