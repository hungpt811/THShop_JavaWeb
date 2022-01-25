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
<title>THShop</title>
<jsp:include page="/WEB-INF/views/khachhang/layout/css.jsp"></jsp:include>
</head>

<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/header2.jsp"></jsp:include>
	<!-- hero section -->
	<div class="hero">
		<div class="slider">
			<div class="container">
				<!-- slide item -->
				<div class="slide active">
					<div class="info">
						<div class="info-content">
							<h3 class="top-down">Nike Air Force 1</h3>
							<h2 class="top-down trans-delay-0-2">New Release</h2>
							<p class="top-down trans-delay-0-4">Nike AF1 vẫn chưa hề có
								dấu hiệu “hạ nhiệt” vẫn luôn là sự lựa chọn hàng đầu của các
								tuyển thủ bóng rổ, các bạn trẻ và các tín đồ thời trang hàng
								hiệu.</p>
							<div class="top-down trans-delay-0-6">
								<button class="btn-flat btn-hover">
									<span>shop now</span>
								</button>
							</div>
						</div>
					</div>
					<div class="img top-down">
						<img src="${base}/img/khachhang/product-1.png" alt="">
					</div>
				</div>
				<!-- end slide item -->
				<!-- slide item -->
				<div class="slide">
					<div class="info">
						<div class="info-content">
							<h3 class="top-down">Adidas Tie Dye Pack</h3>
							<h2 class="top-down trans-delay-0-2">New Release</h2>
							<p class="top-down trans-delay-0-4">Các sản phẩm giày dép của
								thương hiệu Adidas luôn được lòng người dùng bởi thiết kế tinh
								tế, độc đáo, dễ kết hợp với quần áo.</p>
							<div class="top-down trans-delay-0-6">
								<button class="btn-flat btn-hover">
									<span>shop now</span>
								</button>
							</div>
						</div>
					</div>
					<div class="img right-left">
						<img src="${base}/img/khachhang/addidas.png" alt="">
					</div>
				</div>
				<!-- end slide item -->
				<!-- slide item -->
				<div class="slide">
					<div class="info">
						<div class="info-content">
							<h3 class="top-down">MLB Big Ball Chunky</h3>
							<h2 class="top-down trans-delay-0-2">New Release</h2>
							<p class="top-down trans-delay-0-4">Giày MLB Big Ball Chunky
								được làm từ chất liệu da cao cấp, bền đẹp, thời gian sử dụng lâu
								dài. Form giày với các đường chỉ khâu vô cùng tỉ mỉ, sắc sảo.</p>
							<div class="top-down trans-delay-0-6">
								<button class="btn-flat btn-hover">
									<span>shop now</span>
								</button>
							</div>
						</div>
					</div>
					<div class="img left-right">
						<img src="${base}/img/khachhang/mlb.png" alt="">
					</div>
				</div>
				<!-- end slide item -->
			</div>
			<!-- slider controller -->
			<button class="slide-controll slide-next">
				<i class='bx bxs-chevron-right'></i>
			</button>
			<button class="slide-controll slide-prev">
				<i class='bx bxs-chevron-left'></i>
			</button>
			<!-- end slider controller -->
		</div>
	</div>
	<!-- end hero section -->

	<!-- promotion section -->
	<div class="promotion">
		<div class="row">
			<div class="col-4 col-md-12 col-sm-12">
				<div class="promotion-box">
					<div class="text">
						<h3>Nike Sneaker</h3>
						<button class="btn-flat btn-hover">
							<span>shop collection</span>
						</button>
					</div>
					<img src="${base}/img/khachhang/product/nike-1.png" alt="">
				</div>
			</div>
			<div class="col-4 col-md-12 col-sm-12">
				<div class="promotion-box">
					<div class="text">
						<h3>Addidas Sneaker</h3>
						<button class="btn-flat btn-hover">
							<span>shop collection</span>
						</button>
					</div>
					<img src="${base}/img/khachhang/product/addidas-3.png" alt="">
				</div>
			</div>
			<div class="col-4 col-md-12 col-sm-12">
				<div class="promotion-box">
					<div class="text">
						<h3>MLB Sneaker</h3>
						<button class="btn-flat btn-hover">
							<span>shop collection</span>
						</button>
					</div>
					<img src="${base}/img/khachhang/banner/mlb4.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- end promotion section -->
	
	
	<!-- product list -->
	<div class="section">
		<div class="container">
			<div class="section-header">
				<h2>newest products</h2>
			</div>

			<div class="row">
				<c:forEach items="${newestProduct}" var="np">
					<div class="col-3 col-md-6 col-sm-12">
						<div class="product-card">
							<div class="product-card-img">
								<img src="${base}/upload/${np.avatar}" alt=""> <img
									src="${base}/upload/${np.avatar}" alt="">
							</div>
							<div class="product-card-info">
								<div class="product-btn">
									<a href="${base }/product/${np.seo}">
										<button class="btn-flat btn-hover btn-shop-now">shop
											now</button>
									</a>

									<button class="btn-flat btn-hover btn-cart-add">
										<i class='bx bxs-cart-add'></i>
									</button>
									<button class="btn-flat btn-hover btn-cart-add">
										<i class='bx bxs-heart'></i>
									</button>
								</div>

								<div class="product-card-name">${np.title}</div>
								<div class="product-card-price">
									<span><del>4.000.000đ</del></span> <span class="curr-price">
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${np.price}" type="currency" />		
									</span>
								</div>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>

			<div class="section-footer">
				<a href="${base}/category" class="btn-flat btn-hover">view all</a>
			</div>
		</div>
	</div>
	<!-- end product list -->

	<!-- product list -->
	<div class="section">
		<div class="container">
			<div class="section-header">
				<h2>best selling</h2>
			</div>

			<div class="row">
				<c:forEach items="${featuredProduct}" var="fp">
					<div class="col-3 col-md-6 col-sm-12">
						<div class="product-card">
							<div class="product-card-img">
								<img src="${base}/upload/${fp.avatar}" alt=""> <img
									src="${base}/upload/${fp.avatar}" alt="">
							</div>
							<div class="product-card-info">
								<div class="product-btn">
									<a href="${base }/product/${fp.seo}">
										<button class="btn-flat btn-hover btn-shop-now">shop
											now</button>
									</a>

									<button class="btn-flat btn-hover btn-cart-add">
										<i class='bx bxs-cart-add'></i>
									</button>
									<button class="btn-flat btn-hover btn-cart-add">
										<i class='bx bxs-heart'></i>
									</button>
								</div>

								<div class="product-card-name">${fp.title}</div>
								<div class="product-card-price">
									<span><del>4.000.000đ</del></span> <span class="curr-price">
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${fp.price}" type="currency" />		
									</span>
								</div>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>

			<div class="section-footer">
				<a href="${base}/category" class="btn-flat btn-hover">view all</a>
			</div>
		</div>
	</div>
	<!-- end product list -->


	<!-- special product -->
	<div class="bg-second">
		<div class="section container">
			<div class="row">
				<div class="col-4 col-md-4">
					<div class="sp-item-img">
						<img src="${base}/img/khachhang/banner/specialnike.png" alt="">
					</div>
				</div>
				<div class="col-7 col-md-8">
					<div class="sp-item-info">
						<div class="sp-item-name">G-Dragon x Nike Air Force 1
							Para-Noise 2.0</div>
						<p class="sp-item-description">Đôi giày làm mưa làm gió tại
							Việt nam cũng như toàn Châu Á. Đây là đôi giày mà nó không còn
							nằm trong pham vi của thể thao nữa mà bao gồm cả nghệ thuật ẩn
							mình bên trong. Một trong những đôi giày không thể bỏ qua của
							giới mộ điệu thời trang</p>
						<button class="btn-flat btn-hover">shop now</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end special product -->


	<!-- product list -->
	<div class="section">
		<div class="container">
			<div class="section-header">
				<h2>Instagram</h2>
			</div>
			<div class="row">
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta1.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta1.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta2.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta2.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta3.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta3.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta4.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta4.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta5.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta5.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta6.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta6.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta7.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta7.jpg" alt="">
						</div>

					</div>
				</div>
				<div class="col-3 col-md-6 col-sm-12">
					<div class="product-card">
						<div class="product-card-img">
							<img src="${base}/img/khachhang/insta/insta8.jpg" alt=""> <img
								src="${base}/img/khachhang/insta/insta8.jpg" alt="">
						</div>

					</div>
				</div>
			</div>
			<div class="section-footer">
				<a href="https://www.instagram.com/" class="btn-flat btn-hover">Follow
					on Instagram</a>
			</div>
		</div>
	</div>
	<!-- end product list -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/footer2.jsp"></jsp:include>
	<!-- end footer -->

	<!-- app js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>
</body>

</html>