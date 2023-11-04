<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.course.zumba.service.GenericService"%>
<%@page import="com.course.zumba.model.Participant"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;1,100;1,300;1,400;1,500&display=swap"
	rel="stylesheet">

<style type="text/css">
.btn-dark-brwn {
	background-color: #3e2723;
}

.btn-brwn {
	background-color: #3e2723;
	color: #d7ccc8;
}

.btn-brwn:hover {
	background-color: #a1887f;
	color: #d7ccc8;
}

.btn-outline-brwn {
	border-color: #3e2723;
	color: #3e2723;
}

.btn-outline-brwn:hover {
	border-color: #3e2723;
	background-color: #3e2723;
	color: #d7ccc8;
}

.link-brwn {
	color: #795548;
}

.link-brwn:hover {
	color: #a1887f;
}
</style>
<title>Insert title here</title>
</head>
<body class="bg-light">


	<div class="container-fluid btn-dark-brwn p-5">
		<div class="container-sm bg-light w-75 p-2">
			<div>
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<form action="../batch/index.jsp">
								<input class="nav-link active" type="submit" value="Batch.."
									aria-current="page">
						</form>
						
						<form action="ZUMBA/participant/index.jsp">
						<input class="nav-link active" type="submit" value="Participant.."
									aria-current="page">
								
						</form>
								
							
							<form class="d-flex">
								<input class="form-control me-2" type="search"
									placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Search</button>
							</form>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	
	<div class="container-fluid pb-4">
		<div class="container-sm bg-white w-75 p-5">
		
			<%@include file="add.jsp" %>
			
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="container-sm bg-white w-75 p-5">
		
			<%@include file="list.jsp" %>
			
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>