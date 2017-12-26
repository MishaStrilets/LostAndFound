<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Бюро знахідок онлайн</title>

<link rel="icon" type="image/png" href="/static/images/icon.png" />

<link
	href="http://cdn.jsdelivr.net/webjars/bootstrap/3.3.4/css/bootstrap.min.css"
	href="@{/webjars/bootstrap/3.3.4/css/bootstrap.min.css}"
	rel="stylesheet" media="screen" />
<link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>

</head>

<body>
	<div>
		<%@include file="header.jsp"%>
	</div>

	

		<div class="search-form">
			<h2>пошук</h2>

			<form:form method="POST" modelAttribute="search"
				class="form-horizontal">

				<div class="row">

					<div class="col-sm-6">
						<form:input type="search" path="name" id="name"
							placeholder="назва" class="form-control" />
					</div>

					<div class="col-sm-2">
						<form:checkbox path="lost" value="true" />
						втрачені
					</div>

					<div class="col-sm-2">
						<form:checkbox path="found" value="true" />
						знайдені
					</div>

					<div class="col-sm-2">
						<button type="submit" class="button">шукати</button>
					</div>

				</div>
			</form:form>
			<hr />
		</div>

		<div class="table">
			<h2>cписок речей</h2>
			<table>
				<thead>
					<tr>
						<th>назва</th>
						<th>місце</th>
						<th>дата</th>
						<th>номер телефону</th>
						<th>втрачена/знайдена</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${things}" var="thing">
						<tr style="overflow: auto;">
							<td>${thing.name}</td>
							<td>${thing.place}</td>
							<td>${thing.date}</td>
							<td>${thing.phoneNumber}</td>
							<td>${thing.lostOrFound}</td>

							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<td class="button"><a
									style="color: #ffffff; text-decoration: none;"
									href="<c:url value='/edit-${thing.id}-thing' />">редагувати</a></td>
							</c:if>

							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<td class="button"><a
									style="color: #ffffff; text-decoration: none;"
									href="<c:url value='/delete-${thing.id}-thing' />">видалити</a></td>
							</c:if>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	

	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>