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
							style="background-color: #ffffff; width: 275px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #000000" href="<c:url value='/list' />">втрачені
									та знайдені</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #000000" href="<c:url value='/admin' />">втрачені
									та знайдені</a>
							</c:if></li>

						<li
							style="background-color: #e1e1e1; width: 275px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #000000" href="<c:url value='/lost' />">втрачені</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #000000" href="<c:url value='/admin-lost' />">втрачені</a>
							</c:if></li>

						<li
							style="background-color: #797979; width: 275px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #ffffff" href="<c:url value='/found' />">знайдені</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #ffffff" href="<c:url value='/admin-found' />">знайдені</a>
							</c:if></li>

						<li
							style="background-color: #353535; width: 275px; font-size: 20px"><a
							style="color: #ffffff" href="<c:url value='/new' />">додати
								річ</a></li>

						<li
							style="background-color: #000000; width: 266px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #ffffff" href="<c:url value='/admin' />"
									class="log">вхід</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #ffffff" href="<c:url value="/logout" />"
									class="log">вихід</a>
							</c:if></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>