<%@page import="java.util.List"%>
<%@page import="com.course.zumba.constant.Query"%>
<%@page import="com.course.zumba.service.GenericServiceImpl"%>
<%@page import="com.course.zumba.model.User"%>
<%@page import="com.course.zumba.service.GenericService"%>
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

<%

String message = "";

GenericService<User, User> service = new GenericServiceImpl<>();

String username = request.getParameter("username") != null ? request.getParameter("username") : "";
String password = request.getParameter("password") != null ? request.getParameter("password") : "";

int resp = -2;
User user = null;


String action = request.getParameter("action") != null ? request.getParameter("action") : "";

if(action.equalsIgnoreCase("login")) {
	if(!username.equals("") && !password.equals("")) {
		
		List<User> users = service.findAllByQuery(Query.queryUserByUsernameAndPassword, User.class, username, password); 
		
		if(users != null && !users.isEmpty()) {
			user = users.get(0);
			session.setAttribute("sessionid", username);
			response.sendRedirect("index.jsp");
		} else {

resp = -1;
message = "Username or password invalid. Please enter a valid username and password!";
		}
		
	}
}




%>
	
	<div
		class="position-absolute h-60 top-50 start-50 translate-middle shadow-sm p-5 mb-5 bg-body rounded"
		style="width: 35vw">
		<h2 class="w-100 text-center pb-4">Sign In</h2>
		<form action="login.jsp">
		
		<%
if (resp == -1 ) {
%>
<div class="alert alert-warning alert-dismissible fade show"
	role="alert">
	<strong>Osp...!</strong>  <%= message %>.
	<button type="button" onclick="javascript:window.location='login.jsp'"
		class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
}
%>
			<!-- Username input -->
			<div class="form-floating mb-3">
				<input type="text" id="username" name="username" placeholder="username" class="form-control" /> <label
					class="form-label" for="username">Username</label>
			</div>

			<!-- Password input -->
			<div class="form-floating mb-3">
				<input type="password" id="password" name="password" placeholder="password" class="form-control" /> <label
					class="form-label" for="password">Password</label>
			</div>

			<div class="d-flex">
				<div class="flex-grow-1">
					<input type="hidden" name="action" value="login">
					<button type="submit" class="btn btn-brwn mb-4 w-100">Sign in</button>
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