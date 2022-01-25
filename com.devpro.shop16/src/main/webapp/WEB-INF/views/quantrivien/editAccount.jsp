<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>THShop Admin</title>
<!-- COMMON -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Core theme CSS (includes Bootstrap)-->
<jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- header -->
		<jsp:include page="/WEB-INF/views/quantrivien/layout/header.jsp"></jsp:include>
		<!-- Menu -->
		<jsp:include page="/WEB-INF/views/quantrivien/layout/menu.jsp"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Thêm mặt hàng</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${base}/admin">Trang
										chủ</a></li>
								<li class="breadcrumb-item active">Thêm mặt hàng</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<!--Dạng 2: Spring-form  -->
					<!-- alert -->
					<sf:form modelAttribute="user" action="${base}/admin/editAccount"
						style="padding: 20px" method="POST">
						<!-- do sử dụng cho cả thêm mới và chỉnh sửa nên cần có ID này -->
						<!-- và ID cần phải hidden từ phía UI -->
						<!-- luôn luôn thêm id property này -->
						<sf:hidden path="id" />

						<div class="row">
							<div class="col-md-6">
								<div class="form-group mb-2">
									<label for="fullname">FullName</label>
									<sf:input path="fullname" autocomplete="off" type="text"
										class="form-control" id="fullname" 
										required="required"></sf:input>
								</div>
								<div class="form-group mb-2">
									<label for="username">UserName</label>
									<sf:input path="name" readonly="true" autocomplete="off" type="text"
										class="form-control" id="username" 
										></sf:input>
								</div>
								<sf:hidden path="password" />
								<div class="form-group">
									<label for="email">Email</label>
									<sf:input type="text" autocomplete="off" path="email"
										class="form-control" id="email" 
										required="required"></sf:input>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phonenumber">Phone</label>
									<sf:input type="text" autocomplete="off" path="phonenumber"
										class="form-control" id="phonenumber"
										required="required"></sf:input>
								</div>

								<div class="form-group">
									<label for="address">Address</label>
									<sf:input type="text" autocomplete="off" path="address"
										class="form-control" id="address"
										required="required"></sf:input>
								</div>

							</div>
						</div>
						<button class="btn btn-primary" type="submit">Submit</button>
					</sf:form>


					
				</div>
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2021 <a
				href="https://www.facebook.com/hwngnaf/">HWNG</a>.
			</strong> All rights reserved.
			<!-- <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0
    </div> -->
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>


	<!-- internal javascript -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#detail_description').summernote({
				placeholder : 'Details Description',
				tabsize : 2,
				height : 100
			});
		});
	</script>
	<!-- ./wrapper -->

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/quantrivien/layout/js.jsp"></jsp:include>
</body>
</html>
