<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Items</title>
    <jsp:include page="imports/head_import.jsp"></jsp:include>
</head>
<body>
    <script>
        
        function sellItem(cItemId) {
            window.location.href = "sellItem?cItemId=" + cItemId;
        }

        function repairItem(cItemId) {
        	window.location.href = "repairItem?cItemId=" + cItemId;
        }

        function deleteItem(cItemId) {
            if(confirm("Are you sure you want to delete this item?")) {
                window.location.href = "deleteItem?cItemId=" + cItemId;
            }
        }

    </script>
    <!-- HEADER -->
    <jsp:include page="fragments/header_user.jsp"></jsp:include>
    <br><br><br>
    <!-- MAIN CONTENT -->
    <div class="dark-overlay">
        <div class="home-inner container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">User Items</div>
                        <div class="card-body">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Status</th>
                                        <th>Cost</th>
                                        <th>User Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cItem" items="${customerItems}">
                                        <tr>
                                            <td>${cItem.item.itemName}</td>
                                            <td>${cItem.status}</td>
                                            <td>Rs. ${cItem.item.cost}</td>
                                            <td>
                                            	<c:choose>
	                                            	<c:when test="${cItem.status == 'Selling'}">
		                                                <button onclick="#" class="btn btn-success disabled">Sell</button>
		                                                <button onclick="#" class="btn btn-info disabled">Repair</button>
		                                                <button onclick="deleteItem(${cItem.id});" class="btn btn-danger">Delete</button>
	                                               	</c:when>
	                                               	<c:when test="${cItem.status == 'Sold'}">
		                                                <button onclick="#" class="btn btn-success disabled">Sell</button>
		                                                <button onclick="#" class="btn btn-info disabled">Repair</button>
		                                                <button onclick="#" class="btn btn-danger disabled">Delete</button>
	                                               	</c:when>
	                                               	<c:when test="${cItem.status == 'Sent to Repair'}">
		                                                <button onclick="#" class="btn btn-success disabled">Sell</button>
		                                                <button onclick="#" class="btn btn-info disabled">Repair</button>
		                                                <button onclick="#" class="btn btn-danger disabled">Delete</button>
	                                               	</c:when>
	                                               	<c:otherwise>
		                                                <button onclick="sellItem(${cItem.id});" class="btn btn-success">Sell</button>
		                                                <button onclick="repairItem(${cItem.id});" class="btn btn-info">Repair</button>
		                                                <button onclick="deleteItem(${cItem.id});" class="btn btn-danger">Delete</button>
	                                               	</c:otherwise>
                                               </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">Add Items</div>
                            <div class="card-body">
                            <form action="addItem" method="post" class="form-inline">
                                <input type="text" name="itemName" placeholder="Item Name" class="form-control mr-3" required>
                                <input type="number" name="cost" placeholder="Item Cost" class="form-control mr-3" required>
                                <input type="hidden" name="customerId" value="${customer.id}">
                                <input type="submit" value="Add" class="btn btn-primary">
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
    </div>
    <br><br><br>
    <!-- FOOTER -->
    <jsp:include page="fragments/footer.jsp"></jsp:include>
</body>
</html>