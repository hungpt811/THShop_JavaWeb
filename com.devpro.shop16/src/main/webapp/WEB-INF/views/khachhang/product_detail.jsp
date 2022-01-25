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
	<!-- product-detail content -->
	<div class="bg-main">
		<div class="container">
			<div class="box">
				<div class="breadcumb">
					<a href="./index.html">home</a> <span><i
						class='bx bxs-chevrons-right'></i></span> <a href="./products.html">all
						products</a> <span><i class='bx bxs-chevrons-right'></i></span> <a
						href="./product-detail.html">${product.title}</a>
				</div>
			</div>
			<div class="row product-row">
				<div class="col-5 col-md-12">
					<div class="product-img" id="product-img">
						<img src="${base}/upload/${product.avatar}" alt="">
					</div>
					<div class="box">
						<div class="product-img-list">
							<div class="product-img-item">
								<img src="${base}/upload/${product.avatar}" alt="">
							</div>
							<c:forEach items="${product.productImages}" var="picture">
								<div class="product-img-item">
									<img src="${base}/upload/${picture.path}" alt="">
								</div>

							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-7 col-md-12">
					<div class="product-info">
						<h1>${product.title}</h1>
						<div class="product-info-detail">
							<span class="product-info-detail-title">Brand:</span> <a href="#">${product.categories.name}</a>
						</div>
						<div class="product-info-detail">
							<span class="product-info-detail-title">Rated:</span> <span
								class="rating"> <i class='bx bxs-star'></i> <i
								class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
								class='bx bxs-star'></i> <i class='bx bxs-star'></i>
							</span>
						</div>
						<p class="product-description">${product.shortDes}</p>
						<div class="product-info-price">
							<fmt:setLocale value="vi_VN" scope="session" />
							<fmt:formatNumber value="${product.price}" type="currency" />
						</div>
						<div class="product-quantity-wrapper">
							<span id="minus_quantity"
								onclick="javascript:ReduceInput('${base }');"
								class="product-quantity-btn"> <i class='bx bx-minus'></i>
							</span> <input style="width: 50px; text-align: center;"
								class="product-quantity" id="pd_quantity" name="pd_quantity"
								type="text" min="1" value="1"> <span id="pd_quantity"
								class="product-quantity"></span> <span
								onclick="javascript:UpdateInput('${base }');"
								class="product-quantity-btn"> <i class='bx bx-plus'></i>
							</span>
						</div>
						<div>
							<button
								onclick="javascript:AddToCart('${base }', ${product.id}, 1);"
								class="btn-flat btn-hover">add to cart</button>
						</div>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="box-header">description</div>
				<div class="product-detail-description">
					<button class="btn-flat btn-hover btn-view-description"
						id="view-all-description">view all</button>
					<div class="product-detail-description-content">
						${product.detailDes}</div>
				</div>
			</div>
			<div class="box">
				<div class="box-header">review</div>
				<div>
					<div class="user-rate">
						<div class="user-info">
							<div class="user-avt">
								<img src="${base}/img/ava.jpg" alt="">
							</div>
							<div class="user-name">
								<span class="name">thanh hung</span> <span class="rating">
									<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
									class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
									class='bx bxs-star'></i>
								</span>
							</div>
						</div>
						<div class="user-rate-content">Dep xuat sac! 5 sao cho shop
							<3</div>

					</div>
					<div class="user-rate">
						<div class="user-info">
							<div class="user-avt">
								<img src="${base}/img/ava.jpg" alt="">
							</div>
							<div class="user-name">
								<span class="name">thanh hung</span> <span class="rating">
									<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
									class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
									class='bx bxs-star'></i>
								</span>
							</div>
						</div>
						<div class="user-rate-content">San pham chat luong!</div>

					</div>
					<div class="user-rate">
						<div class="user-info">
							<div class="user-avt">
								<img src="${base}/img/ava.jpg" alt="">
							</div>
							<div class="user-name">
								<span class="name">thanh hung</span> <span class="rating">
									<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
									class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
									class='bx bxs-star'></i>
								</span>
							</div>
						</div>
						<div class="user-rate-content">Qua dep a!</div>

					</div>

					<div class="box">
						<ul class="pagination">
							<li><a href="#"><i class='bx bxs-chevron-left'></i></a></li>
							<li><a href="#" class="active">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class='bx bxs-chevron-right'></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="box-header">related products</div>
				<div class="row">
					<c:forEach items="${relatedProduct}" var="rp">
						<div class="col-4 col-md-6 col-sm-12">
							<div class="product-card">
								<div class="product-card-img">
									<img
										src="${base}/upload/${rp.avatar}"
										alt=""> <img
										src="${base}/upload/${rp.avatar}"
										alt="">
								</div>
								<div class="product-card-info">
									<div class="product-btn">
										<a href="${base }/product/${rp.seo}"
											class="btn-flat btn-hover btn-shop-now">shop now</a>
										<button class="btn-flat btn-hover btn-cart-add">
											<i class="bx bxs-cart-add"></i>
										</button>
										<button class="btn-flat btn-hover btn-cart-add">
											<i class="bx bxs-heart"></i>
										</button>
									</div>
									<div class="product-card-name">${rp.title}</div>
									<div class="product-card-price">
										<span><del>4.000.000đ</del></span> <span class="curr-price">
											<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${rp.price}" type="currency" />	
										</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- end product-detail content -->




	<!-- footer -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/footer2.jsp"></jsp:include>
	<!-- end footer -->

	<!-- app js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>
</body>

</html>