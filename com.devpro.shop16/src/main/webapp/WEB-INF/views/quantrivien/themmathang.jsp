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

					<!--Dạng 1: HTML Form  -->
					<!-- <form action="#" style="padding: 20px">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>MÃ£ sáº£n pháº©m</label> <input type="text" required
										class="form-control" placeholder="Nháº­p mÃ£ sáº£n pháº©m"
										id="code" name="code">
								</div>
								<div class="form-group">
									<label>TÃªn sáº£n pháº©m</label> <input type="text" required
										class="form-control" placeholder="Nháº­p tÃªn sáº£n pháº©m"
										name="name" id="name">
								</div>
								<div class="form-group">
									<label>Sá» lÆ°á»£ng</label> <input type="text" required
										class="form-control"
										placeholder="Nháº­p sá» lÆ°á»£ng sáº£n pháº©m" name="amount"
										id="amount">
								</div>
								<div class="form-group">
									<label>Ghi chÃº</label> <input type="text" required
										class="form-control" placeholder="Nháº­p ghi chÃº" name="note"
										id="note">
								</div>
							</div>
						</div>
						<button class="btn btn-primary" type="submit">Submit</button>
					</form> -->

					<!--Dạng 2: Spring-form  -->
					<!-- alert -->
					<c:if test="${not empty TB }">
						<div class="alert alert-light" role="alert">${TB }</div>
					</c:if>
					<sf:form modelAttribute="product" action="${base}/admin/addproduct"
						style="padding: 20px" enctype="multipart/form-data" method="POST">
						<!-- do sử dụng cho cả thêm mới và chỉnh sửa nên cần có ID này -->
						<!-- và ID cần phải hidden từ phía UI -->
						<!-- luôn luôn thêm id property này -->
						<sf:hidden path="id" />

						<div class="row">
							<div class="col-md-6">
								<div class="form-group mb-2">
									<label for="title">Title</label>
									<sf:input path="title" autocomplete="off" type="text"
										class="form-control" id="title" placeholder="Title"
										required="required"></sf:input>
								</div>
								<div class="form-group mb-2">
									<label for="fileProductAvatar">Avatar</label> <input
										id="fileProductAvatar" name="productAvatar" type="file"
										class="form-control">
								</div>
								<div class="form-group ">
									<label for="fileProductPictures">Picture</label> <input
										id="fileProductPictures" name="productPictures" type="file"
										class="form-control" multiple="multiple">
								</div>
								<div class="form-group">
									<label>Categories</label>
									<sf:select path="categories.id" class="form-control"
										id="category">
										<sf:options items="${categories}" itemValue="id"
											itemLabel="name" />
									</sf:select>
								</div>


								<div class="form-group">
									<label for="price">Price</label>
									<sf:input type="number" autocomplete="off" path="price"
										class="form-control" id="price" placeholder="Price"
										required="required"></sf:input>
								</div>
								<div class="form-group form-check ">
									<sf:checkbox path="isHot" class="form-check-input" id="isHot" />
									<label class="form-check-label" for="isHot">Is Hot
										Product?</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="short_description">Description</label>
									<sf:textarea autocomplete="off" path="shortDes"
										class="form-control" placeholder="Short Description"
										id="short_description" rows="3" required="required"></sf:textarea>
								</div>

								<div class="form-group">
									<label for="detail_description">Details</label>
									<sf:textarea autocomplete="off" path="detailDes"
										class="form-control summernote" id="detail_description"
										rows="3" required="required"></sf:textarea>
								</div>

							</div>
						</div>
						<button class="btn btn-primary" type="submit">Submit</button>
					</sf:form>


					<!--Dạng 3: AJAX  -->
					<%-- <div class="alert alert-light" role="alert" id="TB_PRODUCT"></div>
					<form action="${base}/product" id="add_product_form" style="padding: 20px" 
							enctype="multipart/form-data" method="POST">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Mã sản phẩm</label> <input type="text" required
										class="form-control" placeholder="Nhập mã sản phẩm"
										id="code" name="code">
								</div>
								<div class="form-group">
									<label>Tên sản phẩm</label> <input type="text" required
										class="form-control" placeholder="Nhập tên sản phẩm"
										name="name" id="name">
								</div>
								<div class="form-group">
									<label>Ảnh sản phẩm</label> <input type="file" required
										class="form-control" placeholder="Thêm ảnh"
										 id="attachment_product" name="attachment_product">
								</div>
								<div class="form-group">
									<label>Số lượng</label> <input type="text" required
										class="form-control"
										placeholder="Nhập số lượng sản phẩm" name="amount"
										id="amount">
								</div>
								<div class="form-group">
									<label>Danh mục</label> <input type="text" required
										class="form-control" placeholder="Nhập danh mục" name="cate"
										id="note">
								</div>
								<div class="form-group">
									<label>Đặc trưng</label> <input type="text" required
										class="form-control" placeholder="Nhập đặc trưng sản phẩm" name="feature"
										id="feature">
								</div>
							</div>
						</div>
						<button class="btn btn-primary" onclick="product('${base}')" type="button">Cập nhật</button>
						
					</form> --%>
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
