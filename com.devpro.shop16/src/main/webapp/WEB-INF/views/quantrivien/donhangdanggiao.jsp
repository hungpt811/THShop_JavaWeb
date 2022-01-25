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
							<h1 class="m-0">
								Đơn hàng
								<h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${base}/admin">Trang
										chủ</a></li>
								<li class="breadcrumb-item active">Đơn hàng</li>

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
			<form class="form-inline" action="${base }/admin/shipping"
				method="get">
				<div class="row" style="width: 100%">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Đơn hàng đang giao</h3>
								<div class="card-tools">

									<div class="row input-group input-group-sm"
										style="width: 150px;">

										<input type="hidden" id="page" name="page"
											class="form-control"> <input type="text" id="keyword"
											name="keyword" value="${searchModel.keyword }"
											class="form-control float-right" placeholder="Search">

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
											<th>Payment ID</th>
											<th>Customer ID</th>
											<th>Created Date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${shippingWithPaging.data}" var="shipping">
											<tr>
												<td>${shipping.code}</td>
												<td>${shipping.user.id}</td>
												<td>${shipping.createdDate}</td>
												<td>
												<a href="${base}/admin/shipdetail/${shipping.code}">
														<button type="button" class="btn btn-info">Detail</button></a> 
												<a onclick="return confirm('Xác nhận đơn hàng đã giao thành công!')" href="${base}/admin/shipping/${shipping.id}">
												<button type="button" class="btn btn-success">Shipped</button></a> 
												<a onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này không?')" href="${base}/admin/delete/${shipping.id}">
													<button type="button" class="btn btn-danger">Delete</button></a>
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
					<!-- The Modal -->
					<%-- <div class="modal fade" id="myModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">Chi tiết đơn hàng</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									
									<ul class="list-group">
										<li class="list-group-item">Mã đơn hàng:
											${shipDetail.code}</li>
										<li class="list-group-item">Mã khách hàng:
											${shipDetail.user.id}</li>
										<li class="list-group-item">Hình thức thanh toán:
											Thanh toán khi nhận hàng</li>
										<li class="list-group-item">Người nhận:
											${shipDetail.user.fullname}</li>
										<li class="list-group-item">Số điện thoại nhận hàng:
											${shipDetail.customerPhone}</li>
										<li class="list-group-item">Địa chỉ nhận hàng:
											${shipDetail.customerAddress}</li>
										<li class="list-group-item">Thông tin đơn hàng: <c:forEach
												items="${shipping.saleOrderProducts}" var="ship_pd">
												${ship_pd.quantity}x${ship_pd.product.title}.  
											</c:forEach>
										</li>
										<li class="list-group-item">Tổng hóa đơn:
											${shipping.total}</li>
										<li class="list-group-item">Trạng thái: Đang giao hàng
										</li>
									</ul>

								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div> --%>
				</div>

			</form>

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
		
			$( document ).ready(function() {				
				$("#paging").pagination({
					currentPage: ${shippingWithPaging.currentPage},
			        items: ${shippingWithPaging.totalItems},
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
