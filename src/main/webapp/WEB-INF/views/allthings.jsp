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

	<div class="body">

		<div class="table">
			<h2>cписок речей</h2>
			<table>
				<tr>
					<th>назва</th>
					<th>місце</th>
					<th>дата</th>
					<th>номер телефону</th>
					<th>втрачена/знайдена</th>
				</tr>
				<c:forEach items="${things}" var="thing">
					<tr>
						<td>${thing.name}</td>
						<td>${thing.place}</td>
						<td>${thing.date}</td>
						<td>${thing.phoneNumber}</td>
						<td>${thing.lostOrFound}</td>

						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<td class="btn"><a
								style="color: #ffffff; text-decoration: none;"
								href="<c:url value='/edit-${thing.id}-thing' />">редагувати</a></td>

						</c:if>

						<c:if test="${pageContext.request.userPrincipal.name != null}">


							<td class="btn"><a
								style="color: #ffffff; text-decoration: none;"
								href="<c:url value='/delete-${thing.id}-thing' />">видалити</a></td>

						</c:if>

					</tr>
				</c:forEach>
			</table>

		</div>
	</div>

	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>