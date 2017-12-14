<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Бюро знахідок онлайн</title>

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
	<div>
		<h2 align="center">Список речей</h2>

		<table align="center">
			<tr>
				<th>Ім'я</th>
				<th>Місце</th>
				<th>Дата</th>
				<th>Номер телефону</th>
				<th>Втрачена/знайдена</th>
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
							href="<c:url value='/edit-${thing.id}-thing' />">Редагувати</a></td>

					</c:if>

					<c:if test="${pageContext.request.userPrincipal.name != null}">


						<td nowrap
							style="background-color: #f92c41; border: 3px solid #590310;"><a
							href="<c:url value='/delete-${thing.id}-thing' />">Видалити</a></td>
					</c:if>

				</tr>
			</c:forEach>
		</table>

		<div>
			<%@include file="footer.jsp"%>
		</div>

	</div>
</body>
</html>