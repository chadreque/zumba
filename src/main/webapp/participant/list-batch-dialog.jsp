
<!-- Modal -->
<div class="modal fade" id="listBatchModal" tabindex="-1"
	aria-labelledby="exampleModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-sm" id="exampleModalLabel">Select Batch for Participant</h5>
				<button type="button" class="btn-xs btn-close"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="list-group">
				
				<% for(Batch batch: batchs) { %>
				  <label class="list-group-item">
				    <input class="form-check-input me-1" type="checkbox" name="selected" value="<%= batch.getId() %>">
				    <%= batch.getName() %>
				  </label>
				<% } %>

				</div>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>