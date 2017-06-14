<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lost and found</title>

<style type="text/css">
body {
	background-color: #fcae14;
	font-family: Arial;
}
h1 {
	font-size: 50px;
}
li {
	text-transform: uppercase;
	display: inline;
	font-weight: bold;
	font-size: 30px;
	padding: 10px;
}
ul {
	width: 1220px;
	padding: 15px;
	border-bottom: 3px solid #b618f9;
	background-color: #000000;
	text-align: center;
	border-radius: 10px;
}
a {
	color: #ffffff;
	text-decoration: none;
	padding: 5px 20px 5px 20px;
}
a.log {
	color: red;
}
footer {
	background-color: #7c7a7a;
	padding: 10px;
	margin: 10px 0;
	font-style: italic;
	border-radius: 10px;
	height: 50px;
}
a.foot {
	color: white;
	text-decoration: underline;
	padding: 0;
}
.error {
	font-size: 30px;
	color: #ff0000;
}
label {
	display: inline-block;
	width: 200px;
	font-size: 30px;
}
legend {
	font-size: 40px;
}
input[type=text] {
	width: 250px;
	padding: 5px;
	margin: 10px 0;
	border: 3px solid #b618f9;
	font-family: Arial;
	border-radius: 3px;
}
input[type=submit] {
	width: 120px;
	padding: 5px 5px;
	border: 3px solid #b618f9;
	background-color: green;
	color: white;
	font-size: 30px;
	border-radius: 10px;
}
input[type=date] {
    width: 250px;
	padding: 5px;
	margin: 10px 0;
	border: 3px solid #b618f9;
	font-family: Arial;
	border-radius: 3px;
}
</style>

</head>

<body>
	<div>
		<header>
			<h1 align="center">Lost and found</h1>
			<nav>
				<ul>

					<li>
					    <c:if test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/list' />">Lost and found</a>
						</c:if> 
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value='/admin' />">Lost and found</a>
						</c:if>
					</li>

					<li>
					    <c:if test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/lost' />">Lost</a>
						</c:if> 
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value='/admin-lost' />">Lost</a>
						</c:if>
				    </li>

					<li>
					    <c:if test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/found' />">Found</a>
						</c:if> 
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value='/admin-found' />">Found</a>
						</c:if>
					</li>


					<li><a href="<c:url value='/new' />">Add thing</a></li>

					<li>
					    <c:if test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/admin' />" class="log">Log in</a>
						</c:if> 
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value="/logout" />" class="log">Log out</a>
						</c:if>
					</li>

				</ul>
			</nav>
		</header>

		<form:form method="POST" modelAttribute="thing">
			<form:input type="hidden" path="id" id="id" />
			<fieldset>
				<legend>Statement</legend>

				<label for="name">Name:</label>
				<form:input path="name" id="name" size="30" maxlength="15" />
				<form:errors path="name" cssClass="error" />
				<br /> 
				
				<label for="place">Place:</label>
				<form:input path="place" id="place" size="30" maxlength="30" />
				<form:errors path="place" cssClass="error" />
				<br /> 
					
				<label for="date">Date:</label>
			    <form:input type="date" path="date" id="date" />
			    <form:errors path="date" cssClass="error" />
				<br />
			
				<label for="phoneNumber">Cell phone:</label>
				<form:input path="phoneNumber" id="phoneNumber" size="30" maxlength="13" />
				<form:errors path="phoneNumber" cssClass="error" />
				<br /> 
				
				<label for="lostOrFound">Lost or found:</label>
				<form:input path="lostOrFound" id="lostOrFound" size="30" maxlength="5" />
				<form:errors path="lostOrFound" cssClass="error" />
				<br />
			</fieldset>
			<br />
			<c:choose>
				<c:when test="${edit}">
					<input type="submit" value="Update" />
				</c:when>
				<c:otherwise>
					<input type="submit" value="Add" />
				</c:otherwise>
			</c:choose>
		</form:form>

		<footer>
			<p>
				Contact information: <a href="mailto:mishastrilets@gmail.com" class="foot">mishastrilets@gmail.com</a>.
			</p>
		</footer>

	</div>
</body>
</html>