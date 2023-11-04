
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.course.zumba.model.Participant"%>
<%@page import="com.course.zumba.service.*"%>
<%@page import="com.course.zumba.dao.*"%>
<%
/* GenericService<Participant> service = new GenericServiceImpl<>();
List<Participant> participants = new ArrayList<>();
participants = service.findAll(Participant.class); */

List<Participant> participants = new ArrayList<>();

GenericDaoImpl<Participant> dao;
try {
	dao = new GenericDaoImpl<Participant>();
	participants = dao.findAll(Participant.class);
	
	//participants.stream().forEach(p -> System.out.println("Participant: " + p));
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>


<table class="table table-striped">
	<tr>
		<th>Name</th>
		<th>email</th>
		<th>Contact</th>
		<th>Batch</th>
		<th></th>
	</tr>
	
	<%
		for(Participant participant : participants) {
	%>
	<tr>
		<td><%participant.getName(); %></td>
		<td><%participant.getEmail(); %></td>
		<td><%participant.getId(); %></td>
		<td>
			<h6>
				<span class="badge bg-secondary">Zumba 1</span>
			</h6>
		</td>
		<th>
			<div class="btn-group btn-group-sm float-end" role="group"
				aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-primary btn-outline-brwn">Edit</button>
				<button type="button" class="btn btn-outline-primary btn-outline-brwn">Delete</button>
			</div>
		</th>
	</tr>
	
	<!-- <tr>
		<td>Chadreque Micajo</td>
		<td>chadrequeam@gmail.com</td>
		<td>846084589</td>
		<td>
			<h6>
				<span class="badge bg-secondary">Zumba 1</span>
			</h6>
		</td>
		<th>
			<div class="btn-group btn-group-sm float-end" role="group"
				aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-primary btn-outline-brwn">Edit</button>
				<button type="button" class="btn btn-outline-primary btn-outline-brwn">Delete</button>
			</div>
		</th>
	</tr>
	
	<tr>
		<td>Maria Tebete</td>
		<td>maria.tebete</td>
		<td>844085502</td>
		<td>
			<h6>
				<span class="badge bg-secondary">Zumba 2</span> <span
					class="badge bg-secondary">Zumba 3</span> <span
					class="badge bg-secondary">Zumba 5 </span>
				<a href="#!" class="link-brwn" data-bs-toggle="modal" data-bs-target="#exampleModal">More...</a>
			</h6>
		</td>
		<th>
			<div class="btn-group btn-group-sm float-end" role="group"
				aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-primary btn-outline-brwn">Edit</button>
				<button type="button" class="btn btn-outline-primary btn-outline-brwn">Delete</button>
			</div>
		</th>
	</tr> -->
	<%} %>
	
</table>

<!-- Modal -->
<div class="modal fade modal-dialog" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-sm" id="exampleModalLabel">Chadreque Batch's</h5>
        <button type="button" class="btn-xs btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        		<h6>
				<span class="badge bg-secondary">Zumba 2</span> <span
					class="badge bg-secondary">Zumba 3</span> <span
					class="badge bg-secondary">Zumba 5 </span>
					
					<span
					class="badge bg-secondary">Zumba 6 </span>
					<span
					class="badge bg-secondary">Zumba 8 </span>
			</h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-xs btn-primary">Close</button>
      </div>
    </div>
  </div>
</div>