<form action="index.jsp">
	<div class="d-flex">
		<div class="flex-grow-1">
			<h4 class="pb-4">Edit Participant</h4>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-outline-primary btn-outline-brwn mb-4" 
				onclick="javascript:window.location='index.jsp'">cancel</button>
			
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="id" value="<%= p.getId() %>">
				
				<button type="submit" class="btn btn-sm btn-brwn mb-4">Save</button>
		</div>
	</div>
	<div class="d-flex">
		<div class="flex-fill pe-2">
			<!-- Name input -->
			<div class="form-floating mb-3">
				<input type="text" id="editName" name="editName" value="<%= p.getName() %>" class="form-control" /> <label
					class="form-label" for="editName" >Fullname</label>
			</div>

			<!-- Email input -->
			<div class="form-floating mb-3">
				<input type="email" id="editEmail" class="form-control" name="editEmail" value="<%= p.getEmail() %>" /> 
				<label
					class="form-label" for="editEmail">E-mail</label>
			</div>
		</div>
		
		<div class="flex-fill ps-2">
			<!-- Contact input -->
			<div class="form-floating mb-3">
				<input type="tel" id="editContact" class="form-control" name="editContact" value="<%= p.getContact() %>" /> <label
					class="form-label" for="editContact">Contact</label>
			</div>

			<!-- Batch Select -->
			<div class="form-floating mb-3">
				<button type="button" class="btn w-100 btn-xs btn-outline-brwn  p-3 mb-4" data-bs-toggle="modal" data-bs-target="#editListBatchModal">Edit Batchs</button>
			</div>
		</div>
	</div>
	
	<%@include  file="edit-list-batch-dialog.jsp" %>
</form>