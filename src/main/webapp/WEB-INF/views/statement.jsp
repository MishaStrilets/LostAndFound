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

		<div class="form">

			<form:form method="POST" modelAttribute="thing"
				class="form-horizontal">
				<form:input type="hidden" path="id" id="id" />

				<h2>заявка</h2>

				<div class="form-group">
					<label class="col-sm-2 control-label">назва</label>
					<div class="col-sm-3">
						<form:input type="text" path="name" id="name" size="21"
							maxlength="20" class="form-control" />
					</div>
					<div id="error" class="col-sm-6">
						<form:errors path="name" style="color: #ff0000"
							class="alert alert-danger" />
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-sm-2 control-label">місце</label>
					<div class="col-sm-3">
						<form:input type="text" path="place" id="place" size="31"
							maxlength="30" class="form-control" />
					</div>
					<div id="error" class="col-sm-6">
						<form:errors path="place" style="color: #ff0000"
							class="alert alert-danger" />
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-sm-2 control-label">дата</label>
					<div class="col-sm-3">
						<form:input type="date" path="date" id="date" class="form-control" />
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-sm-2 control-label">номер телефону</label>
					<div class="col-sm-3">
						<form:input type="text" path="phoneNumber" id="phoneNumber"
							size="16" maxlength="15" class="form-control" />
					</div>
					<div id="error" class="col-sm-6">
						<form:errors path="phoneNumber" style="color: #ff0000"
							class="alert alert-danger" />
					</div>
				</div>

				<hr />

				<div class="form-group">
					<label class="col-sm-2 control-label">втрачена/знайдена</label>
					<div class="col-sm-2">
						<form:radiobutton path="lostOrFound" value="Втрачена" />
						втрачена
					</div>
					<div class="col-sm-1">
						<form:radiobutton path="lostOrFound" value="Знайдена" />
						знайдена
					</div>
					<div id="error" class="col-sm-6">
						<form:errors path="lostOrFound" style="color: #ff0000"
							class="alert alert-danger" />
					</div>
				</div>

				<hr />

				<c:choose>
					<c:when test="${edit}">
						<input type="submit" value="оновити" />
					</c:when>
					<c:otherwise>
						<input type="submit" value="додати" />
					</c:otherwise>
				</c:choose>
			</form:form>
		</div>
	</div>

	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>