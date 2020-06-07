<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login page</title>
	<jsp:include page="imports/head_import.jsp"></jsp:include>
</head>
<body>
	<!-- HEADER -->
    <jsp:include page="fragments/header.jsp"></jsp:include>
    <br><br><br>
    <!-- MAIN CONTENT -->
    <div class="dark-overlay">
        <div class="home-inner container">
            <div class="row">
                <div class="col-lg-4 bg-light mx-auto">
                    <h3 class="h3">Log In</h3>
                    <span class="text-danger">${errorMessage}</span>
                    <form action="processLogin" method="post">
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="text" id="username" name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="Password" required>
                        </div>
                        <input class="btn btn-primary btn-block" type="submit" value="Login">
                        Register new <a href="registration" class="">here</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br><br><br>
    <!-- FOOTER -->
    <jsp:include page="fragments/footer.jsp"></jsp:include>
</body>
</html>