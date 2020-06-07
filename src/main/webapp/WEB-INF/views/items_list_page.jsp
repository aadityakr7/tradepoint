<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Homepage</title>
    <jsp:include page="imports/head_import.jsp"></jsp:include>
</head>
<body>
	<script>

		function buyItem(cItemId) {
            window.location.href = "buyItem?cItemId=" + cItemId;
        }
	
	</script>
    <!-- HEADER -->
    <jsp:include page="fragments/header_user.jsp"></jsp:include>
    <br><br><br>
    <!-- MAIN CONTENT -->
    <div class="dark-overlay">
        <div class="home-inner container">
        	<c:choose>
            	<c:when test="${cItems.size() > 0}">
           			<div class="card-columns">
		            	<c:forEach var="cItem" items="${cItems}">
							<div class="card text-center">
			                    <img class="card-img-top" src="resources/images/news-8.jpg" alt="">
			                    <div class="card-body">
			                        <h4 class="card-title">${cItem.item.itemName}</h4>
			                        <h6 class="card-subtitle text-muted mb-3">Price: Rs. ${cItem.item.cost}</h6>
			                        <a class="btn btn-outline-primary btn-block" href="javaScript:buyItem(${cItem.id});">Buy</a>
			                    </div>
			                </div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<br><br><br><br>
					<h3 class="text-center text-danger">${message}</h3>
					<br><br><br><br>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
        
    <br><br><br>
    <!-- FOOTER -->
    <jsp:include page="fragments/footer.jsp"></jsp:include>
</body>
</html>