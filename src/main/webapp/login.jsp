<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;1,100;1,300;1,400;1,500&display=swap" rel="stylesheet">

<style type="text/css">
	.btn-brwn {
		background-color: #795548;
		color: #d7ccc8;
	}
	
	.btn-brwn:hover {
		background-color: #a1887f;
		color: #d7ccc8;
	}
	
	.link-brwn{
		color: #795548;
	}
	
	.link-brwn:hover {
		color: #a1887f;
	}
	
</style>
<title>Insert title here</title>
</head>
<body class="bg-light">


	<div
		class="position-absolute h-60 top-50 start-50 translate-middle shadow-sm p-5 mb-5 bg-body rounded"
		style="width: 35vw">
		<h2 class="w-100 text-center pb-4">Sign In</h2>
		<form>
			<!-- Username input -->
			<div class="form-outline mb-4">
				<input type="email" id="form2Example1" class="form-control" /> <label
					class="form-label" for="form2Example1">Username</label>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-4">
				<input type="password" id="form2Example2" class="form-control" /> <label
					class="form-label" for="form2Example2">Password</label>
			</div>

			<div class="d-flex">
				<div class="flex-grow-1">
					<button type="button" class="btn btn-brwn mb-4">Sign in</button>
				</div>

				<div class="text-center">
					<p>
						Not a member? <a href="#!" class="link-brwn">Register</a>
					</p>
				</div>
			</div>
		</form>
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