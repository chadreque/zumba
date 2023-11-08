
<div class="d-flex">
	<div class="flex-grow-1">
		<h4 class="pb-4">List Participants</h4>
	</div>
	<%
	if (!action.equalsIgnoreCase("add") && !action.equalsIgnoreCase("edit")) {
	%>
	<div>
		<form action="index.jsp">
			<input type="hidden" name="action" value="add">

			<button type="submit" class="btn btn-sm btn-brwn mb-4">Add
				New</button>
		</form>
	</div>
	<%
	}
	%>
</div>

<%
if (resp == 1) {
%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong>Success!</strong> The participant was <%= actionMessage %>.
	<button type="button" onclick="javascript:window.location='index.jsp'"
		class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
}
%>

<%
if (resp == -1 ) {
%>
<div class="alert alert-warning alert-dismissible fade show"
	role="alert">
	<strong>Warning!</strong> The participant was not <%= actionMessage %>.
	<button type="button" onclick="javascript:window.location='index.jsp'"
		class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
}
%>

<%
if (action.equalsIgnoreCase("delete")) {
%>
<div class="alert alert-info alert-dismissible fade show"
	style="width: 36vw" role="alert">
	<h4>Confirm!</h4>
	<span>Are you sure you want delete participant <%=p.getName()%>?
	</span>

	<button type="button" onclick="javascript:window.location='index.jsp'"
		class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

	<hr>

	<div class="d-flex">
		<div class="flex-grow-1"></div>
		<div>

			
				
				<form action="index.jsp">
					<div class="btn-group" role="group"
					aria-label="Basic radio toggle button group">
					<button type="button"
					onclick="javascript:window.location='index.jsp'"
					class="btn btn-sm btn-outline-info  me-2">No</button>
					<input type="hidden" name="action" value="yesDelete"> 
					<input type="hidden" name="id" value="<%=p.getId()%>">

					<button type="submit" class="btn btn-sm  btn-info">Yes</button>
					</div>
					
					
				</form>


		</div>
	</div>

</div>
<%
}
%>
<table class="table table-striped table-hover">
	<tr>
		<th>No. </th>
		<th>Name</th>
		<th>email</th>
		<th>Contact</th>
		<th>Batch</th>
		<th></th>
	</tr>

	<%
	for (Participant participant : participants) {
		List<Batch> participanBatchs = new ArrayList<>();
		participanBatchs = service.findAllByQuery(Query.findAllBatchParticipantByParticipant, Batch.class, participant.getId());
	%>
	<tr>
		<td><%=participants.indexOf(participant) + 1%></td>
		<td><%=participant.getName()%></td>
		<td><%=participant.getEmail()%></td>
		<td><%=participant.getContact()%></td>
		<td>

			<h6>
				<%
				for (Batch b : participanBatchs) {
				%>
				<span class="badge bg-secondary"><%=b.getName()%></span>
				<%
				}
				%>

			</h6>

		</td>
		<th>
			<div class="btn-group btn-group-sm float-end" role="group"
				aria-label="Basic outlined example">
				<form action="index.jsp">

					<input type="hidden" name="action" value="edit"> <input
						type="hidden" name="id" value="<%=participant.getId()%>">

					<button type="submit"
						class="btn btn-sm btn-outline-brwn me-2">Edit</button>
				</form>

				<form action="index.jsp">

					<input type="hidden" name="action" value="delete"> <input
						type="hidden" name="id" value="<%=participant.getId()%>">

					<button type="submit"
						class="btn btn-sm btn-outline-brwn">Delete</button>
				</form>
			</div>
		</th>
	</tr>
	<%
	}
	%>

</table>


