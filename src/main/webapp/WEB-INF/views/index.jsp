<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>TradePoint</title>
    <jsp:include page="imports/head_import.jsp"></jsp:include>
</head>
<body>
	<script>

		function signUp() {
			let firstName = $('#firstName').val();
			let lastName = $('#lastName').val();
			let username = $('#username').val();
			let email = $('#email').val();
			let password = $('#password').val();
			let cPassword = $('#confirmPassword').val();
			if(!firstName || firstName.length===0) {
				alert("Please enter first name!");
				document.getElementById('firstName').focus();
				return;
			}
			if(!lastName || lastName.length===0) {
				alert("Please enter last name!");
				document.getElementById('lastName').focus();
				return;
			}
			var noSpecialCharFormat = /[^a-zA-Z0-9]/;
			if(noSpecialCharFormat.test(username)) {
				alert("No special characters allowed!");
				document.getElementById('username').focus();
				return;
			}
			var mailFormat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if(!mailFormat.test(email)) {
				alert("Please type a valid email address!");
				document.getElementById('email').focus();
				return;
			}
			if(password != cPassword) {
				alert("Passwords don't match!");
				document.getElementById('confirmPassword').focus();
				return;
			}
			let signUpForm = document.getElementById('signUpForm');
			signUpForm.submit();
		}
	
	</script>
    <!-- HEADER -->
    <jsp:include page="fragments/header.jsp"></jsp:include>
    <br><br><br>
    <!-- MAIN CONTENT -->
    <div class="dark-overlay">
        <div class="home-inner container">
            <div class="row">
                <div class="col-lg-8 mb-3">
                    <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis, odit omnis! Numquam facilis sunt quas quisquam, modi beatae voluptates facere dolore eum atque tempora quam! Eligendi explicabo reprehenderit totam quasi, culpa, sit dolore nam suscipit necessitatibus vitae nesciunt blanditiis tenetur sunt! Labore non exercitationem sit molestias consectetur pariatur cum et delectus. Consectetur necessitatibus eum at molestias commodi possimus inventore, molestiae velit, animi rem minima nulla odit. Cupiditate a architecto obcaecati atque exercitationem tempore, nihil soluta sint molestiae corporis aut nulla consequatur, repudiandae magni illum iusto aspernatur dolorem? Reiciendis, natus! Provident iure qui est cum iste necessitatibus repellendus reiciendis, voluptate neque.</p>
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugit quis assumenda aspernatur fugiat nostrum laborum dolorum modi iusto aliquam id commodi voluptates error, magni illum. Aliquam ullam, delectus dolorum officiis nihil animi alias esse necessitatibus, at saepe corporis exercitationem? Facilis vitae illum distinctio aliquam quibusdam ullam tenetur expedita, soluta molestiae dignissimos aliquid itaque fugit, nostrum, voluptatum quia nam consequatur eligendi fuga optio. In magnam veniam praesentium velit, ipsa, laborum ratione voluptas similique accusantium iste natus minima libero sint facere sed totam, quisquam eligendi quas reiciendis inventore quis assumenda quaerat maiores? Dignissimos cumque corporis inventore? Aliquid unde maxime harum est omnis!</p>
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deleniti, voluptate molestias obcaecati libero autem blanditiis maiores. Minima nisi tempora aliquam alias expedita placeat. Ratione, dignissimos quod voluptates laborum praesentium ipsa id, nulla qui perferendis voluptate iste et exercitationem. Voluptatem enim, hic necessitatibus iusto perferendis repellendus quae asperiores dolorem excepturi id reiciendis culpa totam explicabo, laboriosam rerum, nulla ea? Architecto facere ducimus optio adipisci impedit ipsam sit magni veniam. Tenetur aspernatur temporibus cumque illum. Corrupti facilis recusandae animi tempora aperiam a saepe illo dicta dignissimos suscipit autem reprehenderit fuga soluta ab doloribus, deserunt quia. Error sit vel fugiat ea quidem praesentium?</p>
                </div>
                <div class="col-lg-4">
                    <div class="card bg-primary text-center text-white card-form">
                        <div class="card-body">
                            <h3 class="h3">Sign Up Today</h3>
                            <p>Please fill out this form to register</p>
                            <form action="processRegistration" id="signUpForm" method="post" autocomplete="off">
                                <div class="form-group">
                                    <input class="form-control form-control-lg" type="text" id="firstName" name="firstName" placeholder="First Name" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control form-control-lg" type="text" id="lastName" name="lastName" placeholder="Last Name" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control form-control-lg" type="text" id="username" name="username" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control form-control-lg" type="email" id="email" name="email" placeholder="E-Mail" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control form-control-lg" type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                                </div>
                                <div class="form-group">
                                    <a href="javaScript:signUp();" class="btn btn-outline-light btn-block">Sign Up</a>
                                    Already a user? <a href="login" class="text-white">Login</a>
                                </div>
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