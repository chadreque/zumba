<%@page import="com.course.zumba.constant.Query"%>
<%@page import="com.course.zumba.model.BatchParticipant"%>
<%@page import="com.course.zumba.model.Batch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.course.zumba.model.Participant"%>
<%@page import="com.course.zumba.service.*"%>
<%@page import="com.course.zumba.dao.*"%>

<%
GenericService<Batch, Void> service = new GenericServiceImpl<>();
GenericService<BatchParticipant, Void> serviceBP = new GenericServiceImpl<>();

// List<Batch> batchs = new ArrayList<Batch>();
List<Batch> batchs = new ArrayList<Batch>();

batchs = service.findAll(Batch.class); 
// batchs = serviceBatch.findAll(Batch.class);


Batch b = null;

int id = 0;
int idx = 0;
int resp  = -1;

String action = request.getParameter("action") != null ? request.getParameter("action") : "";
String actionMessage = request.getParameter("actionMessage") != null ? request.getParameter("actionMessage") : "";

if(request.getParameter("action-respo") != null) 
	resp = Integer.parseInt(request.getParameter("action-respo"));


if(action.equalsIgnoreCase("edit")) {
	id = Integer.parseInt(request.getParameter("id"));
	b = service.findById(id, Batch.class);
}
	
if(action.equalsIgnoreCase("yesDelete")) {
	
	id = Integer.parseInt(request.getParameter("id"));
	
	String [] condition = {"bid"};
	
	serviceBP.deleteByPramCondition(BatchParticipant.class, condition, id);
	
	actionMessage = "deleted";
	
	resp = service.deleteById(id, Batch.class);
	
	response.sendRedirect("index.jsp?action-respo=" + resp + "&actionMessage=" + actionMessage);
}

if(action.equalsIgnoreCase("delete")) {
	
	id = Integer.parseInt(request.getParameter("id"));
	
	b = service.findById(id, Batch.class);
}

if(action.equalsIgnoreCase("insert")) {
	b = new Batch();
	
	actionMessage = "saved";
	

	String name = request.getParameter("addName");
	String instructor = request.getParameter("addInstructor");

	b.setName(name);
	b.setInstructor(instructor);
	
	resp = service.insert(b);

	response.sendRedirect("index.jsp?action-respo=" + resp + "&actionMessage=" + actionMessage);
}


if (action.equalsIgnoreCase("update")) {
	
	actionMessage = "updated";
	
	service = new GenericServiceImpl<>();
	id = Integer.parseInt(request.getParameter("id"));
	b = service.findById(id, Batch.class);

	String name = request.getParameter("editName");
	String instructor = request.getParameter("editInstructor");

	if (!b.getName().equalsIgnoreCase(name))
		b.setName(name);

	if (!b.getInstructor().equalsIgnoreCase(instructor))
		b.setInstructor(instructor);
	
	
	resp = service.update(b);
	response.sendRedirect("index.jsp?action-respo=" + resp + "&actionMessage=" + actionMessage);
}
%>


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

	<%@include file="../nav-menu.jsp" %>
	
	
	<% if(action.trim().equalsIgnoreCase("add")) {%>
		<div class="container-fluid pb-4">
			<div class="container-sm bg-white w-75 p-5">
				<%@include file="add.jsp" %>
			</div>
		</div>
	<%}%>

	<% if(action.trim().equalsIgnoreCase("edit")) {%>
		<div class="container-fluid pb-4">
			<div class="container-sm bg-white w-75 p-5">
				<%@include file="edit.jsp" %>
			</div>
		</div>
	<%}%>
	
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