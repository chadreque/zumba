
<%
String currentPage  = "";
currentPage = request.getRequestURI();

String actionNav = request.getParameter("action") != null ? request.getParameter("action") : "";

String user = (String) session.getAttribute("sessionid");

if(actionNav.equalsIgnoreCase("logout")) {
	response.sendRedirect("/ZUMBA/login.jsp");
}

%>


<div class="container-fluid btn-dark-brwn p-5">
	<div class="container-sm bg-light w-75 p-2">
		<div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
						aria-controls="navbarTogglerDemo01" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
						<a class="navbar-brand" href="#">Zumba App</a>
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item me-2"><a class="btn btn-sm btn-outline-brwn"
								aria-current="page" href="/ZUMBA/batch/index.jsp">Batch</a></li>

							<li class="nav-item"><a class="btn btn-sm btn-outline-brwn"
								aria-current="page" href="/ZUMBA/participant/index.jsp">Participant</a>
							</li>

						</ul>
						<form action="<%= currentPage %>" class="d-flex mb-2 mb-lg-0">
							<h5 class="me-3 mt-2">Hi, <%= user %></h5>
							<input type="hidden" name="action" value="logout">
							<button type="submit" class="btn btn-sm btn-outline-brwn" type="submit">Logout</button>
						</form>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>
