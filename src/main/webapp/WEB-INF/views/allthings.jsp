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

table {
	text-align: center;
}

h1 {
	font-size: 50px;
}

h2 {
	font-size: 40px;
}

td {
	background-color: #2d4972;
	color: white;
	font-size: 30px;
	border-radius: 10px;
	border: 3px solid #06174c;
	word-break: break-all;
}

th {
	text-transform: uppercase;
	background-color: #12912e;
	color: white;
	padding: 10px;
	font-size: 30px;
	font-weight: bold;
	text-transform: uppercase;
	border-radius: 10px;
	border: 3px solid #0a6d3f;
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
	padding: 5px;
	margin: 10px 0;
	font-style: italic;
	border-radius: 10px;
	height: 50px;
	bottom: 0;
	left: 10px;
	right: 10px;
	position: fixed;
}

a.foot {
	color: white;
	text-decoration: underline;
	padding: 0;
}
</style>

</head>

<body>
	<div>
		<header>
			<h1 align="center">Lost and found</h1>

			<nav>
				<ul>
					<li><c:if
							test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/list' />">Lost and found</a>
						</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value='/admin' />">Lost and found</a>
						</c:if></li>

					<li><c:if
							test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/lost' />">Lost</a>
						</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value='/admin-lost' />">Lost</a>
						</c:if></li>

					<li><c:if
							test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/found' />">Found</a>
						</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value='/admin-found' />">Found</a>
						</c:if></li>

					<li><a href="<c:url value='/new' />">Add thing</a></li>

					<li><c:if
							test="${pageContext.request.userPrincipal.name == null}">
							<a href="<c:url value='/admin' />" class="log">Log in</a>
						</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="<c:url value="/logout" />" class="log">Log out</a>
						</c:if></li>
				</ul>
			</nav>
		</header>

		<h2 align="center">List of things</h2>

		<table align="center">
			<tr>
				<th>Name</th>
				<th>Place</th>
				<th>Date</th>
				<th>Phone number</th>
				<th>Lost or found</th>
			</tr>
			<c:forEach items="${things}" var="thing">
				<tr>
					<td nowrap>${thing.name}</td>
					<td>${thing.place}</td>
					<td nowrap>${thing.date}</td>
					<td nowrap>${thing.phoneNumber}</td>
					<td nowrap>${thing.lostOrFound}</td>

					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<td nowrap
							style="background-color: #f9f22a; border: 3px solid #8e8e0c;"><a
							href="<c:url value='/edit-${thing.id}-thing' />">Edit</a></td>

					</c:if>

					<c:if test="${pageContext.request.userPrincipal.name != null}">


						<td nowrap
							style="background-color: #f92c41; border: 3px solid #590310;"><a
							href="<c:url value='/delete-${thing.id}-thing' />">Delete</a></td>
					</c:if>

				</tr>
			</c:forEach>
		</table>

		<footer>
			<p>
				Contact information: <a href="mailto:mishastrilets@gmail.com"
					class="foot">mishastrilets@gmail.com</a>.
			</p>
		</footer>

	</div>
</body>
</html>