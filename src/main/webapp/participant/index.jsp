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
GenericService<Participant, Batch> service = new GenericServiceImpl<>();
GenericService<Batch, Void> serviceBatch = new GenericServiceImpl<>();
GenericService<BatchParticipant, Void> serviceBP = new GenericServiceImpl<>();

GenericService<Participant, Participant> serviceID = new GenericServiceImpl<>();

List<Participant> participants = new ArrayList<Participant>();
List<Batch> batchs = new ArrayList<Batch>();
List<Batch> pBatchs =  new ArrayList<Batch>();

List<Integer> pbatchIds =  new ArrayList<>();

participants = service.findAll(Participant.class); 
batchs = serviceBatch.findAll(Batch.class);

Participant p = null;

int id = 0;
int idx = 0;
int resp  = -2;

String action = request.getParameter("action") != null ? request.getParameter("action") : "";
String actionMessage = request.getParameter("actionMessage") != null ? request.getParameter("actionMessage") : "";

if(request.getParameter("action-respo") != null) 
	resp = Integer.parseInt(request.getParameter("action-respo"));


if(action.equalsIgnoreCase("edit")) {
	id = Integer.parseInt(request.getParameter("id"));
	p = service.findById(id, Participant.class);
	
	pBatchs = service.findAllByQuery(Query.findAllBatchParticipantByParticipant, Batch.class, id);	
	
	for(Batch bt: pBatchs) {
		pbatchIds.add(bt.getId());
	}
}
	
if(action.equalsIgnoreCase("yesDelete")) {
	
	id = Integer.parseInt(request.getParameter("id"));
	
	String [] condition = {"pid"};
	
	serviceBP.deleteByPramCondition(BatchParticipant.class, condition, id);
	
	actionMessage = "deleted";
	
	resp = service.deleteById(id, Participant.class);
	
	response.sendRedirect("index.jsp?action-respo=" + resp + "&actionMessage=" + actionMessage);
}

if(action.equalsIgnoreCase("delete")) {
	
	id = Integer.parseInt(request.getParameter("id"));
	
	p = service.findById(id, Participant.class);
}

if(action.equalsIgnoreCase("insert")) {
	p = new Participant();
	
	actionMessage = "saved";
	

	String name = request.getParameter("addName");
	String email = request.getParameter("addEmail");
	String contact = request.getParameter("addContact");

	p.setName(name);
	p.setEmail(email);
	p.setContact(contact);
	
	String [] selected = request.getParameterValues("selected");
	
	resp = service.insert(p);

	List<Participant> participantSaved = serviceID.findAllByQuery(Query.queryParticpantNameAndEmail, Participant.class, name, email);
	
	if(resp != -1 && selected != null) {
		for(String bid : selected) {
			BatchParticipant bp = new BatchParticipant();
			bp.setPid(participantSaved.get(0).getId());
			
			bp.setBid(Integer.valueOf(bid));
	
			resp = serviceBP.insert(bp);
		}
	}
	
	response.sendRedirect("index.jsp?action-respo=" + resp + "&actionMessage=" + actionMessage);
}


if (action.equalsIgnoreCase("update")) {
	
	actionMessage = "updated";
	
	service = new GenericServiceImpl<>();
	id = Integer.parseInt(request.getParameter("id"));
	p = service.findById(id, Participant.class);

	String name = request.getParameter("editName");
	String email = request.getParameter("editEmail");
	String contact = request.getParameter("editContact");

	if (!p.getName().equalsIgnoreCase(name))
		p.setName(name);

	if (!p.getEmail().equalsIgnoreCase(email))
		p.setEmail(email);

	if (!p.getContact().toString().equalsIgnoreCase(contact))
		p.setContact(contact);

	String [] selected = request.getParameterValues("batchSelected");
	

	pBatchs = service.findAllByQuery(Query.findAllBatchParticipantByParticipant, Batch.class, id);	
	
	for(Batch bt: pBatchs) {
		pbatchIds.add(bt.getId());
	}
	
	List<Integer> containedIDs = new ArrayList<>();
	
	if(selected != null) {
		for(int i = 0; i < selected.length; i++) {
			if(!pbatchIds.contains(selected[i])) {
				BatchParticipant bp = new BatchParticipant();
				
				bp.setPid(p.getId());
				bp.setBid(Integer.valueOf(selected[i]));
		
				serviceBP.insert(bp);
			}
			
			if(pbatchIds.contains(Integer.valueOf(selected[i]))) {
				out.println("contain id: " + selected[i]);
				containedIDs.add(Integer.valueOf(selected[i]));
			}	
		}
	}
	
	for(Integer cid : containedIDs) {
		pbatchIds.remove(cid);
	}
	
	String [] condition = {"bid", "pid"};

	
	if(pbatchIds.size() != 0) {
		for(Integer cid : pbatchIds) {
			serviceBP.deleteByPramCondition(BatchParticipant.class, condition, Integer.valueOf(cid), p.getId());
		}
	}
	
	pbatchIds = new ArrayList<>();
	resp = service.update(p);
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