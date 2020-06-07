<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <jsp:include page="imports/head_import.jsp"></jsp:include>
</head>
<body>
    <script>

        function editUserDetails() {
            $('#userDetailsCardDiv').addClass('d-none');
            $('#editUserDetailsCardDiv').removeClass('d-none');
            $('#username').attr('readonly','readonly');
        }

        function cancelEditUserDetails() {
            $('#editUserDetailsCardDiv').addClass('d-none');
            $('#userDetailsCardDiv').removeClass('d-none');
        }

        function updateUserDetails() {
			let email = $('#email').val();
			let dob = $('#dob').val();
			let contactNo = $('#contactNo').val();
			var mailFormat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if(!mailFormat.test(email)) {
				alert("Please type a valid email address!");
				document.getElementById('email').focus();
				return;
			}
			var dobFormat = /^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/;
			if(!dobFormat.test(dob)) {
				alert("Please enter the valid date format!");
				document.getElementById('dob').focus();
				return;
			}
			var contactNoFormat = /^\+?([0-9]{2})\)?([0-9]{10})$/;
			if(!contactNoFormat.test(contactNo)) {
				alert("Please enter the contact number in the valid format!");
				document.getElementById('contactNo').focus();
				return;
			}
			let updateForm = document.getElementById('updateForm');
			updateForm.submit();
        }

    </script>
    <!-- HEADER -->
    <jsp:include page="fragments/header_user.jsp"></jsp:include>
    <br><br><br>
    <!-- MAIN CONTENT -->
    <div class="dark-overlay">
        <div class="home-inner container">
            <h2>Welcome ${customer.username}</h2>
            <br><br>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card" id="userDetailsCardDiv">
                        <div class="card-header">User Details <a href="javaScript:editUserDetails();">[edit]</a></div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <tr>
                                    <td width="40%">Full Name</td>
                                    <td>${customer.firstName} ${customer.lastName}</td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>${customer.email}</td>
                                </tr>
                                <tr>
                                    <td>Username</td>
                                    <td>${customer.username}</td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><c:catch var="exception">${customer.gender}</c:catch></td>
                                </tr>
                                <tr>
                                    <td>Date of Birth</td>
                                    <td><c:catch var="exception">${customer.dob}</c:catch></td>
                                </tr>
                                <tr>
                                    <td>Mother's Name</td>
                                    <td><c:catch var="exception">${customer.motherName}</c:catch></td>
                                </tr>
                                <tr>
                                    <td>Father's Name</td>
                                    <td><c:catch var="exception">${customer.fatherName}</c:catch></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><c:catch var="exception">${customer.address}</c:catch></td>
                                </tr>
                                <tr>
                                    <td>Contact No.</td>
                                    <td><c:catch var="exception">${customer.contactNo}</c:catch></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="card d-none" id="editUserDetailsCardDiv">
                        <div class="card-header">Edit User Details</div>
                        <div class="card-body">
                            <form:form action="updateUserDetails" id="updateForm" method="POST" modelAttribute="customer">
                                <table class="table table-bordered">
                                    <tr>
                                        <td width="40%">Full Name</td>
                                        <td>
                                            <div class="input-group">
                                            	<form:input path="firstName" cssClass="form-control" placeholder="First Name"/>
                                            	<form:input path="lastName" cssClass="form-control" placeholder="Last Name"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>
                                        	<form:input path="email" type="email"  class="form-control" placeholder="abc@example.com"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Username</td>
                                        <td>
                                            <form:input path="username" class="form-control" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>
                                            <div class="form-check form-check-inline">
                                                <form:radiobutton path="gender" value="Male" class="form-check-input"/>
                                                <label class="form-check-label mr-3">Male</label>
                                                <form:radiobutton path="gender" value="Female" class="form-check-input"/>
                                                <label class="form-check-label mr-3">Female</label>
                                                <form:radiobutton path="gender" value="Others" class="form-check-input"/>
                                                <label class="form-check-label mr-3">Others</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Date of Birth</td>
                                        <td>
                                            <form:input path="dob" class="form-control" placeholder="dd/mm/yyyy"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mother's Name</td>
                                        <td>
                                            <form:input path="motherName" class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Father's Name</td>
                                        <td>
                                            <form:input path="fatherName" class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td>
                                            <form:input path="address" class="form-control" placeholder="H.No., Street, City, PIN Code, State, Country"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Contact No.</td>
                                        <td>
                                            <form:input path="contactNo" class="form-control" placeholder="+[Country Code][10-Digit Number] (Ex: +917865446787)"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="text-center">
                                            <a href="javaScript:updateUserDetails();" class="btn btn-success">Save</a>
                                            <a href="javaScript:cancelEditUserDetails();" class="btn btn-warning text-white">Cancel</a>
                                        </td>
                                    </tr>
                                </table>
                            </form:form>
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