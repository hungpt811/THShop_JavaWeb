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
<title>Candles Sneakers</title>
<!-- css -->
<jsp:include page="/WEB-INF/views/khachhang/layout/css.jsp"></jsp:include>
</head>

<body>
	<div id="wrapper">
		<!-- header -->
		<div id="header">
			<nav class="d-flex">
				<div class="logo align-items-center text-left d-flex">
					<a href="" class="d-block"> <img
						src="${base}/img/khachhang/logo.png" alt="Candles">
					</a>
				</div>
				<div
					class="block-menu justify-content-center menu-content position-relative d-flex">
					<ul class="d-flex">
						<li class="lv_1 position-relative"><a
							class="d-block font-weight-bold" href="${base}/index">Home</a></li>
						<li class="lv_1 position-relative"><a
							class="d-block font-weight-bold" href="">About</a></li>
						<li class="lv_1 position-relative"><a
							class="d-block font-weight-bold" href="${base}/category">Shop</a>
							<ul>
								<li class="lv_2"><a class="d-block font-weight-bold"
									href="">Nike</a></li>
								<li class="lv_2"><a class="d-block font-weight-bold"
									href="">Addidas</a></li>
								<li class="lv_2"><a class="d-block font-weight-bold"
									href="">MLB</a></li>
								<li class="lv_2"><a class="d-block font-weight-bold"
									href="">Others</a></li>
							</ul></li>
						<li class="lv_1 position-relative"><a
							class="d-block font-weight-bold" href="${base}/contact">Contact</a></li>
					</ul>

				</div>
				<div class="top-menu-icons">
				<c:choose>
					<c:when test="${isLogined}"> 						
						<ul>
	                        <li class="icons_lv1 position-relative">
	                            <input style="color: #fff" type="text" placeholder="search..">
	                            <i class="fas fa-search"></i>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                            <i class="fas fa-user"></i>
	                            <ul class="dropdown_icons position-absolute">
	                                <li class="icons_lv2 "><a class="d-block font-weight-bold" href="">${userLogined.fullname}</a></li>
	                                <li class="icons_lv2 "><a class="d-block font-weight-bold" href="">Your Order</a></li>
	                                <li class="icons_lv2 "><a class="d-block font-weight-bold" href="${base}/logout">Log out</a></li>
	                            </ul>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                        	<a href="${base}/cart">
	                        		<i class="fas fa-shopping-cart"></i>
	                        		<span id="iconShowTotalProductsInCart" style="font-size: 14px;">${totalProducts}</span>
	                        	</a>
	                       
	                        </li>
	                    </ul>
					</c:when>
					<c:otherwise>
						<ul>
	                        <li class="icons_lv1 position-relative">
	                            <input style="color: #fff" type="text" placeholder="search..">
	                            <i class="fas fa-search"></i>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                            <i class="fas fa-user"></i>
	                            <ul class="dropdown_icons position-absolute">
	                                <li class="icons_lv2 "><a href="${base}/login" class="d-block font-weight-bold" >Login</a></li>
	                                <li class="icons_lv2 "><a href="${base}/register" class="d-block font-weight-bold" >Join us</a></li>
	                            </ul>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                            <a href="${base}/cart">
	                        		<i class="fas fa-shopping-cart"></i>
	                        		<span id="iconShowTotalProductsInCart" style="font-size: 14px;">${totalProducts}</span>
	                        	</a>
	                        </li>
	                    </ul>
					</c:otherwise>
				</c:choose>
                    
                </div>
				
			</nav>
		</div>
		<!-- banner -->
		<div class="banner-main">
			<div class="owl-carousel owl-theme">
				<div class="item">
					<a href=""> <img
						src="${base}/img/khachhang/banner/banner-1.jpg" alt="">
					</a>
				</div>
				<div class="item">
					<a href=""> <img
						src=".${base}/img/khachhang/banner/banner-2.jpg" alt="">
					</a>
				</div>
				<div class="item">
					<a href=""> <img
						src="${base}/img/khachhang/banner/banner-3.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
		<div class="content container">
			<div class="row certi pd-48">
				<div class="col-12 col-sm-3 text-center">
					<img src="${base}/img/khachhang/giaohang.png" alt="delivery">
					<h3>Free shipping nationwide</h3>
					<p>With order value from 5,000,000 VND or more</p>
				</div>
				<div class="col-12 col-sm-3 text-center">
					<img src="${base}/img/khachhang/authentic.png" alt="delivery">
					<h3>Genuine Sellers</h3>
					<p>Committed to 300% REFUND when detecting fake goods, poor
						quality goods</p>
				</div>
				<div class="col-12 col-sm-3 text-center">
					<img src="${base}/img/khachhang/thanhtoan-1.png" alt="delivery">
					<h3>Flexible Payments</h3>
					<p>Payment on delivery (COD) or bank transfer via Techcombank,
						MBbank</p>
				</div>
				<div class="col-12 col-sm-3 text-center">
					<img src="${base}/img/khachhang/dathang-1.png" alt="delivery">
					<h3>Order Online</h3>
					<p>24/7 consultant available. Receiving orders Hotline:
						1900.6789</p>
				</div>

			</div>
			<div class="new-product ">
				<div class="headline text-center ">
					<h2 class="align-items-center d-flex">
						<b></b> <span class="font-weight-bold ">NEW ARRIVALS</span> <b></b>
					</h2>

				</div>
				<ul class="products d-flex">
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-1.jpeg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-2.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-3.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-3.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-6.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-8.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-3.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-8.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>

				</ul>
				<div class="footerline text-center ">
					<a href="">
						<h4 class="align-items-center font-weight-bold">Xem thêm</h4>
					</a>

				</div>
			</div>
			<div class="new-product ">
				<div class="headline text-center ">
					<h2 class="align-items-center d-flex">
						<b></b> <span class="font-weight-bold ">Best Seller</span> <b></b>
					</h2>

				</div>
				<ul class="products d-flex">
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-1.jpeg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-2.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-3.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-3.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-6.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-8.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-3.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
					<li>
						<div class="product-item">
							<div class="product-top">
								<a href="" class="product-thumb d-block"> <img
									src="./asset/img/product-8.jpg" alt="">
								</a>
								<!-- mua ngay -->
								<a href="" class="buy-now">Buy now</a>
							</div>
							<div class="product-infor">
								<a href="" class="product-cate">Nike</a> <a href=""
									class="product-name">Nike Air Force 1</a>
								<div class="product-price">3,199,000đ</div>
							</div>
						</div>
					</li>
				</ul>
				<div class="footerline text-center ">
					<a href="">
						<h4 class="align-items-center font-weight-bold">Xem thêm</h4>
					</a>
				</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>

	</div>
	<!-- js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

</body>

</html>