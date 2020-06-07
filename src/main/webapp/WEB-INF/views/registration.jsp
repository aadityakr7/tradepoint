<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registration page</title>
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
                    <h3 class="h3">Sign Up Today</h3>
                    <p>Please fill out this form to register</p>
                    <form action="processRegistration" method="post">
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="text" id="firstName" name="firstName" placeholder="First Name">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="text" id="lastName" name="lastName" placeholder="Last Name">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="text" id="username" name="username" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="email" id="email" name="email" placeholder="E-Mail">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
                        </div>
                        <input class="btn btn-primary btn-block" type="submit" value="Sign Up">
                        Already a user? <a href="login" class="">Login</a>
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