<%@page import="com.course.zumba.model.Batch"%>
<form action="index.jsp">
	<div class="d-flex">
		<div class="flex-grow-1">
			<h4 class="pb-4">Add Participant</h4>
		</div>
		<div>
			<button type="button" class="btn btn-sm btn-outline-brwn mb-4" 
				onclick="javascript:window.location='../batch/index.jsp'">cancel</button>
				
			<input type="hidden" name="action" value="insert">
			<button type="submit" class="btn btn-sm btn-brwn mb-4">Save</button>
		</div>
	</div>
	<div class="d-flex">
		<div class="flex-fill pe-2">
			<!-- Name input -->
			<div class="form-floating mb-3">
				<input type="text" id="addName" placeholder="name surename" name="addName" required="required" class="form-control" /> 
				<label class="form-label" for="addName">Name</label>
			</div>

		</div>

		<div class="flex-fill pe-2">
			<!-- Instructor input -->
			<div class="form-floating mb-3">
				<input type="text" id="addInstructor" placeholder="intructor full name" name="addInstructor"  required="required" class="form-control" /> 
				<label class="form-label" for="addInstructor">Instructor</label>
			</div>
		</div>
	</div>
</form>