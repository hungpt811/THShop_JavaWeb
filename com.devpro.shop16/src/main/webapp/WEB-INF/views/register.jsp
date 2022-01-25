<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="${base}/js/register.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="./asset/style.css" rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<div class="modal-dialog">
			<div class="col-sm-12 main-section">
				<div class="modal-content">
					<div class="col-12 user-img">
						<img src="${base}/img/user1-128x128.jpg">
					</div>
					<a class="out" href="${base}/index">x</a>
					<div class="col-12 user-name">
						<h1 style="color: #fff; margin-left: 114px;">Create Account</h1>
					</div>
					<div class="form-input col-12">
						<sf:form modelAttribute="regUser" action="${base}/register" method="post"
							style="padding-bottom: 40px;">
							<div class="row">
								<div class="col-sm-6">
									<%-- <div class="form-group">
										<label>Fullname</label> <sf:input path="fullname" type="text"
											class="form-control" name="fullname" />
									</div> --%>
									<div class="form-group">
										<label>Username</label> <sf:input path="name" type="text"
											class="form-control" name="name" />
									</div>
									<div class="form-group">
										<label>Email</label> <sf:input path="email" type="email" class="form-control"
											 name="email" />
									</div>
								</div>
								<div class="col-sm-6">
									<%-- <div class="form-group">
										<label>PhoneNumber</label> <sf:input path="phonenumber" type="number"
											class="form-control" name="phonenumber" />
									</div> --%>
									<div class="form-group">
										<label>Password</label> <sf:input path="password" type="password"
											class="form-control" id="password" name="password" />
											
									</div>
									<div class="form-group">
										<label>Re-enter Password</label> <input type="password"
											class="form-control" required id="confirmPassword" name="confirmPassword">
									</div>
								</div>

							</div>
							<%-- <div class="form-group">
								<label>Address</label> <sf:input path="address" type="text" class="form-control"
									 name="address" />
							</div> --%>

							<button class="btn btn-success col-12" type="submit">Join
								Us</button>
							<a href="${base}/login" style="text-decoration: underline; color: #fff">Back to login</a>
						</sf:form>
                        	 
                         </p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<style>
		body {
			background: url('${base}/img/loginwall.jpg') fixed center;
			max-height: auto;
			background-repeat: no-repeat;
			background-size: cover;
			overflow-y: hidden;
		}
		
		.wrapper form label {
			color: #fff;
		}
		
		.user-img {
			margin-top: -50px;
			margin-left: 190px;
		}
		
		.user-img img {
			width: 100px;
			height: 100px;
			border-radius: 50%;
		}
		
		.main-section {
			margin: 0 auto;
			margin-top: 150px;
		}
		
		.modal-content {
			background-color: #313131;
			opacity: 0.9;
			width: 500px;
		}
		.modal-content .out{
		     top: 0;
				    position: absolute;
				    right: 0;
				    color: #fff;
				    margin-right: 8px;
				    font-size: 24px;
				    text-decoration: none;
		        }
</style>
</body>
</html>