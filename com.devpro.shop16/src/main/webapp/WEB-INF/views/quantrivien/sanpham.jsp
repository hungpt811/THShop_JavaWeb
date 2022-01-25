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
							<h1 class="m-0">Sản phẩm</h1>

						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${base}/admin">Trang
										chủ</a></li>
								<li class="breadcrumb-item active">Sản phẩm</li>

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
			<!-- /.row -->
			<form class="form-inline" action="${base }/admin/product"
				method="get">
				<div class="row" style="width:100%">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Danh sách sản phẩm </h3>
								<div class="card-tools">

									<div class="row input-group input-group-sm"
										style="width: 150px;">

										<input type="hidden" id="page" name="page"
											class="form-control"> <input type="text" id="keyword"
											name="keyword" value="${searchModel.keyword }"
											class="form-control float-right" placeholder="Search">
										<select class="form-control" name="categoryId" id="categoryId"
											style="width: 150px;">
											<option value="0">All</option>
											<c:forEach items="${categories}" var="category">
												<option value="${category.id}">${category.name }</option>
											</c:forEach>
										</select>


										<div class="input-group-append">
											<button type="submit" class="btn btn-default" id="btnSearch"
												name="btnSearch" value="Search">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>



								</div>

							</div>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th>#</th>
											<th>Image</th>
											<th>Name</th>
											<th>Category</th>
											<th>Status</th>
											<th>Price</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${productsWithPaging.data}" var="p"
											varStatus="loop">
											<tr>
												<th>${loop.index + 1}</th>
												<td><img src="${base}/upload/${p.avatar}" /></td>
												<td>${p.title}</td>
												<td>${p.categories.name}</td>
												<td><span id="_product_status_${p.id} }"> <c:choose>
															<c:when test="${p.status}">
																<input type="checkbox" checked="checked"
																	readonly="readonly">
															</c:when>
															<c:otherwise>
																<input type="checkbox" readonly="readonly">
															</c:otherwise>
														</c:choose>
												</span></td>
												<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
														value="${p.price}" type="currency" /></td>
												<td><a href="${base}/admin/addproduct/${p.id}"><button
															type="button" class="btn btn-primary">Edit</button></a>
													<a onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')" 
													href="${base}/admin/product/delete/${p.id}">
													<button  type="button" class="btn btn-danger">Delete</button></a>
												</td>
												
											</tr>
										</c:forEach>

									</tbody>

								</table>
								<!-- Paging -->

							</div>

							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<div class="col-12 d-flex justify-content-center">
						<div id="paging"></div>
					</div>
				</div>

			</form>
			<div>
				<a class="btn btn-primary mb-1" style="margin-left: 10px"
					href="${base }/admin/addproduct" role="button">Add New</a>
			</div>
		</div>

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

		<script type="text/javascript">
			function DeleteProduct(productId) {
				
                 
			}
		
			$( document ).ready(function() {
				$("#categoryId").val(${searchModel.categoryId});
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalItems},
			        itemsOnPage: 8,
			        cssStyle: 'light-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
		</script>
	</div>
	<!-- ./wrapper -->
	<!-- JS -->
	<jsp:include page="/WEB-INF/views/quantrivien/layout/js.jsp"></jsp:include>


</body>
</html>
