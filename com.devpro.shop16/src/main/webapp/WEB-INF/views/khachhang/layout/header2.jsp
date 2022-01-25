<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- header -->
<header>
	<!-- mobile menu -->
	<div class="mobile-menu bg-second">
		<a href="#" class="mb-logo">THShop</a> <span class="mb-menu-toggle"
			id="mb-menu-toggle"> <i class='bx bx-menu'></i>
		</span>
	</div>
	<!-- end mobile menu -->
	<!-- main header -->
	<div class="header-wrapper" id="header-wrapper">
		<span class="mb-menu-toggle mb-menu-close" id="mb-menu-close">
			<i class='bx bx-x'></i>
		</span>
		<!-- top header -->
		<div class="bg-second">
			<div class="top-header container">
				<ul class="devided">
					<li><a href="#">+840123456789</a></li>
					<li><a href="#">thsneaker@mail.com</a></li>
				</ul>
			</div>
		</div>
		<!-- end top header -->
		<!-- mid header -->
		<div class="bg-main">
			<div class="mid-header container">
				<a href="#" class="logo">THShop</a>
				<div class="search">
					<input type="text" placeholder="Search"> <i
						class='bx bx-search-alt'></i>
				</div>
				<ul class="user-menu">
					<li><a href="#"><i class='bx bx-bell'></i></a></li>
					<li><a href="#"><i class='bx bx-user-circle'></i></a> <c:choose>
							<c:when test="${isLogined}">
								<ul class="sub-menu-user">
									<li><a href="${base}/user/info">Tài khoản của tôi</a></li>
									<li><a href="">Đơn mua</a></li>
									<li><a href="${base}/logout">Đăng xuất</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="sub-menu-user">
									<li><a href="${base}/login">Đăng nhập</a></li>
									<li><a href="${base}/register">Đăng ký</a></li>
								</ul>
							</c:otherwise>
						</c:choose></li>
					<li><a href="${base}/cart"><i class='bx bx-cart'></i><span
							id="iconShowTotalProductsInCart">${totalProducts}</span></a></li>
				</ul>
			</div>
		</div>
		<!-- end mid header -->
		<!-- bottom header -->
		<div class="bg-second">
			<div class="bottom-header container">
				<ul class="main-menu">
					<li><a href="${base}/index">home</a></li>
					<!-- mega menu -->

					<li class="mega-dropdown"><a href="${base}/category">Shop
							<i class='bx bxs-chevron-down'></i>
					</a>

						<div class="mega-content">

							<div class="row">
								<c:forEach items="${categories}" var="cate">
									<div class="col-3 col-md-12">
										<div class="box">
											<h3>${cate.name}</h3>
											<ul>
											<c:forEach items="${cate.childs}" var="childcate">
												<li><a href="#">${childcate.name}</a></li>
											</c:forEach>
											</ul>
										</div>
									</div>

								</c:forEach>
							</div>

							<div class="row img-row">
								<div class="col-3">
									<div class="box">
										<img src="${base}/img/khachhang/banner/specialnike.png" alt="">
									</div>
								</div>
								<div class="col-3">
									<div class="box">
										<img src="${base}/img/khachhang/banner/addidas1.png" alt="">
									</div>
								</div>
								<div class="col-3">
									<div class="box">
										<img src="${base}/img/khachhang/banner/mlb6.png" alt="">
									</div>
								</div>
								<div class="col-3">
									<div class="box">
										<img src="${base}/img/khachhang/banner/balen.png" alt="">
									</div>
								</div>
							</div>

						</div></li>
					<!-- end mega menu -->

					<li><a href="#">blog</a></li>
					<li><a href="${base}/contact">contact</a></li>
				</ul>
			</div>
		</div>
		<!-- end bottom header -->
	</div>
	<!-- end main header -->
</header>
<!-- end header -->