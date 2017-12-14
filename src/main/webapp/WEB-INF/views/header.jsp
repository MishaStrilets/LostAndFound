<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
</head>
<body>
	<div class="container">
		<div class="header">
			<nav class="navbar">
				<div class="container-fluid">

					<ul class="nav navbar-nav">
						<li
							style="background-color: #1945e5; width: 275px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #ffffff" href="<c:url value='/list' />">Втрачені
									та знайдені</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #ffffff" href="<c:url value='/admin' />">Втрачені
									та знайдені</a>
							</c:if></li>

						<li
							style="background-color: #ff0019; width: 275px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #ffffff" href="<c:url value='/lost' />">Втрачені</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #ffffff" href="<c:url value='/admin-lost' />">Втрачені</a>
							</c:if></li>

						<li
							style="background-color: #05a800; width: 275px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #000000" href="<c:url value='/found' />">Знайдені</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #000000" href="<c:url value='/admin-found' />">Знайдені</a>
							</c:if></li>

						<li
							style="background-color: #efff11; width: 275px; font-size: 20px"><a
							style="color: #000000" href="<c:url value='/new' />">Додати
								річ</a></li>

						<li
							style="background-color: #000000; width: 266px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #ffffff" href="<c:url value='/admin' />"
									class="log">Вхід</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #ffffff" href="<c:url value="/logout" />"
									class="log">Вихід</a>
							</c:if></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>