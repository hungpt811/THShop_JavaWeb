<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="${base}/admin" class="brand-link"> <img
		src="${base}/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">THShop Admin</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="${base}/img/user1-128x128.jpg"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">Phan Thành Hưng</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">



				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-chart-pie"></i>
						<p>
							Quản lý danh mục <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${base }/admin/category"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Danh sách danh mục</p>
						</a></li>
						<li class="nav-item"><a href="${base }/admin/addcategory"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Thêm/Sửa danh mục</p>
						</a></li>
					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-edit"></i>
						<p>
							Quản lý đơn hàng <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${base }/admin/shipping"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Đơn hàng đang giao</p>
						</a></li>
						<li class="nav-item"><a href="${base }/admin/shipped"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Đơn hàng đã giao</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-table"></i>
						<p>
							Quản lý hàng hóa <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${base}/admin/product"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Danh sách hàng hóa</p>
						</a></li>
						<li class="nav-item"><a href="${base}/admin/addproduct"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Thêm/Sửa mặt hàng</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-users"></i>
						<p>
							Quản lý tài khoản<i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${base}/admin/adminAccount"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Tài khoản admin</p>
						</a></li>
						<li class="nav-item"><a href="${base}/admin/account"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Tài khoản người dùng</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="${base }/admin/contact"
					class="nav-link"> <i class="nav-icon fas fa-phone"></i>
						<p>Liên hệ</p>
				</a></li>
				<li class="nav-item"><a href="${base }/admin/subcribe"
					class="nav-link"> <i class="nav-icon fas fa-gift"></i>
						<p>Đăng ký khuyến mãi</p>
				</a></li>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
