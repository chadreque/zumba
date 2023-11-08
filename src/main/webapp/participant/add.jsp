<%@page import="com.course.zumba.model.Batch"%>
<form action="index.jsp">
	<div class="d-flex">
		<div class="flex-grow-1">
			<h4 class="pb-4">Add Participant</h4>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-outline-primary btn-outline-brwn mb-4" 
				onclick="javascript:window.location='../participant/index.jsp'">cancel</button>
				
			<input type="hidden" name="action" value="insert">
			<button type="submit" class="btn btn-sm btn-brwn mb-4">Save</button>
		</div>
	</div>
	<div class="d-flex">
		<div class="flex-fill pe-2">
			<!-- Name input -->
			<div class="form-floating mb-3">
				<input type="text" id="addName" placeholder="name surename" name="addName" required="required" class="form-control" /> 
				<label class="form-label" for="addName">Fullname</label>
			</div>

			<!-- Email input -->
			<div class="form-floating mb-3">
				<input type="email" id="addEmail" placeholder="example@mail.com" name="addEmail"  required="required" class="form-control" /> 
				<label lass="form-label" for="addEmail">E-mail</label>
			</div>
		</div>

		<div class="flex-fill ps-2">
			<!-- Contact input -->
			<div class="form-floating mb-3">
				<input type="tel" id="addContact" required="required" placeholder="+258 84 008845378" name="addContact" class="form-control" /> 
				<label class="form-label" for="addContact">Contact</label>
			</div>

			<!-- Batch Select -->
			<div class="form-floating mb-3">
				<button type="button" class="btn w-100 btn-xs btn-outline-brwn  p-3 mb-4" data-bs-toggle="modal" data-bs-target="#listBatchModal">Select Batchs</button>
			</div>
			
		</div>
	</div>
	
	
	<%@include  file="list-batch-dialog.jsp" %>
</form>