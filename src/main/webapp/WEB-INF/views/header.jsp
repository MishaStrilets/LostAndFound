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
						<li style="width: 456px; font-size: 20px"><c:if
								test="${pageContext.request.userPrincipal.name == null}">
								<a style="color: #ffffff" href="<c:url value='/list' />">втрачені
									та знайдені речі</a>
							</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">
								<a style="color: #ffffff" href="<c:url value='/admin' />">втрачені
									та знайдені речі</a>
							</c:if></li>

						<li style="width: 455px; font-size: 20px"><a
							style="color: #ffffff" href="<c:url value='/new' />">додати
								річ</a></li>

						<li style="width: 455px; font-size: 20px"><c:if
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