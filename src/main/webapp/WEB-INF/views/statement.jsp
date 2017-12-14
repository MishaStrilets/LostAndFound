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
	<div>Заявка</div>
	<div>
		<form:form method="POST" modelAttribute="thing">
			<form:input type="hidden" path="id" id="id" />

			<div class="form-group">
				<label class="col-sm-2 control-label">Ім'я</label>
				<div class="col-sm-3">
					<form:input type="text" path="name" id="name" size="21"
						maxlength="20" class="form-control" />
				</div>
				<div class="col-sm-6">
					<form:errors path="name" style="color: #ff0000"
						class="alert alert-danger" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Місце:</label>
				<div class="col-sm-3">
					<form:input type="text" path="place" id="place" size="31"
						maxlength="30" class="form-control" />
				</div>
				<div class="col-sm-6">
					<form:errors path="name" style="color: #ff0000"
						class="alert alert-danger" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Дата:</label>
				<div class="col-sm-3">
					<form:input type="date" path="date" id="date" class="form-control" />
				</div>
				<div class="col-sm-6">
					<form:errors path="name" style="color: #ff0000"
						class="alert alert-danger" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Номер телефону:</label>
				<div class="col-sm-3">
					<form:input type="text" path="phoneNumber" id="phoneNumber"
						size="16" maxlength="15" class="form-control" />
				</div>
				<div class="col-sm-6">
					<form:errors path="name" style="color: #ff0000"
						class="alert alert-danger" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Втрачена/знайдена:</label>
				<div class="col-sm-3">
					<form:input type="text" path="lostOrFound" id="lostOrFound"
						size="11" maxlength="10" class="form-control" />
				</div>
				<div class="col-sm-6">
					<form:errors path="name" style="color: #ff0000"
						class="alert alert-danger" />
				</div>
			</div>

			<br />
			<c:choose>
				<c:when test="${edit}">
					<input type="submit" value="Оновити" />
				</c:when>
				<c:otherwise>
					<input type="submit" value="Додати" />
				</c:otherwise>
			</c:choose>
		</form:form>

		<div>
			<%@include file="footer.jsp"%>
		</div>

	</div>
</body>
</html>