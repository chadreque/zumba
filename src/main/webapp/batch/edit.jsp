<form action="index.jsp">
	<div class="d-flex">
		<div class="flex-grow-1">
			<h4 class="pb-4">Edit Participant</h4>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-outline-primary btn-outline-brwn mb-4" 
				onclick="javascript:window.location='index.jsp'">cancel</button>
			
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="id" value="<%= b.getId() %>">
				
				<button type="submit" class="btn btn-sm btn-brwn mb-4">Save</button>
		</div>
	</div>
	<div class="d-flex">
		<div class="flex-fill pe-2">
			<!-- Name input -->
			<div class="form-floating mb-3">
				<input type="text" id="editName" name="editName" value="<%= b.getName() %>" class="form-control" /> <label
					class="form-label" for="editName" >Name</label>
			</div>
		</div>
		
		<div class="flex-fill ps-2">
			<!-- Email input -->
			<div class="form-floating mb-3">
				<input type="text" id="editInstructor" class="form-control" name="editInstructor" value="<%= b.getInstructor() %>" /> 
				<label
					class="form-label" for="editInstructor">Instructor</label>
			</div>
		</div>
		
	</div>
</form>