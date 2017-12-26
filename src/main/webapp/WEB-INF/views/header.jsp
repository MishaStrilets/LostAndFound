<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
</head>
<body>
	<ul class="topnav">
		<li><a href="<c:url value='/' />">втрачені та знайдені речі</a></li>

		<li><a href="<c:url value='/new' />">додати річ</a></li>

		<li><c:if
				test="${pageContext.request.userPrincipal.name == null}">
				<a href="<c:url value='/admin' />" class="log">вхід</a>
			</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
				<a href="<c:url value="/logout" />" class="log">вихід</a>
			</c:if></li>
	</ul>
</body>
</html>