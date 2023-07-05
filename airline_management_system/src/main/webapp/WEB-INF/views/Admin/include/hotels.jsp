<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Layout</a></li>
			<li class="breadcrumb-item active">Add Package</li>
			<li class="breadcrumb-item"><a class="btn btn-primary right"
				href='<spring:url value="/Admin/dashboard"/>'>Back</a></li>
		</ol>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Add Flight Information</h2>
		</div>

		<h3
			style="color: red; background-color: white; margin-right: 150px; margin-left: 150px;">${requestScope.message}</h3>
		<div class="container mt-3">
			<div class="container" style="margin-top: 50px;">
				<form method="post" action='<spring:url value="/Admin/addhotel"/>'
					enctype="multipart/form-data">
					<div class="row form-group">
						<div class="col-md-4">
							<label class="col control-label text-center" for="vehical_no">
								Title </label>
							<div class="input-group">
								<i class="glyphicon glyphicon-user"></i> <input name="title"
									class="form-control text-center" type="text" />
							</div>
						</div>
						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_type">
								Hotel Type </label>
							<div class="input-group">
								<select name="type" class="form-control text-center" type="text">
									<option vlaue="Veg">Veg</option>
									<option vlaue="nonVeg">Non-Veg</option>
									<option vlaue="Veg& Non-Veg">Veg&Non-Veg</option>
								</select>

							</div>
						</div>

						<div class="col-md-4">
							<label class="col control-label text-center"
								for="vehical_capacity"> Rating</label>
							<div class="input-group">
								<i class="glyphicon glyphicon-user"></i> <select name="rating"
									class="form-control text-center" type="text">
									<option vlaue="1">1</option>
									<option vlaue="2">2</option>
									<option vlaue="3">3</option>
									<option vlaue="4">4</option>
									<option vlaue="5">5</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-lg-4">
							<label class="col control-label text-center"
								for="vehical_company"> Mobile </label>
							<div class="input-group">
								<input class="form-control text-center" type="text"
									name="mobile" />
							</div>
						</div>



						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_fuel">
								Distance From Airport </label>
							<div class="input-group">
								<input name="km" class="form-control text-center" type="text" />
							</div>
						</div>
						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_fuel">
								City </label>
							<div class="input-group">
								<input name="city" class="form-control text-center" type="text" />
							</div>
						</div>

						<div class="col-lg-4">
							<label class="col control-label text-center" for="vehical_image">
								Image </label>
							<div class="input-group">
								<input type="file" class="form-control" id="image" name="image" />
							</div>
						</div>
					</div>
			</div>
			<hr>
			<div class="form-group row">
				<div class="col-md-12 text-center">
					<Button class="btn btn-large btn-success">Save</Button>
				</div>
			</div>
			</form>
		</div>
		<div class="alert alert-primary text-center" role="alert">
			<h2>Hotel List</h2>
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
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					int sr_no = 0;
				%>

				<c:forEach var="h" items="${sessionScope.hotellist}">

					<tr>
						<th scope="row">${sr_no=sr_no+1}</th>
						<td><img src="data:image/jpeg;base64,${h.imgUtility}"
							height=100px width=100px /></td>
						<td>${h.title}</td>
						<td>${h.mobile}</td>
						<td>${h.city}</td>
						<td>${h.km}</td>
						<td><a
							href='<spring:url value="/Admin/hotel_delete?hid=${h.id}" />'>
								<button type="button" class="btn btn-danger">
									<i class="far fa-trash-alt"></i>
								</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>
</div>

