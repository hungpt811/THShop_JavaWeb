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
		<jsp:include page="/WEB-INF/views/khachhang/layout/header.jsp"></jsp:include>

		<section class="category">
			<div class="container">
				<div class="category-top row">
					<p>Home</p>
					<span>/</span>
					<p>Nike</p>
					<span>/</span>
					<p>Men</p>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="category-left">
						<ul>
							<li class="category-left-li"><a href="#">Nike</a>
								<ul class="category-sub">
									<li class="category-sub-li" class="category-sub-li"><a
										href="">Men</a></li>
									<li class="category-sub-li"><a href="">Women</a></li>
								</ul></li>
							<li class="category-left-li"><a href="#">Addidas</a>
								<ul class="category-sub">
									<li class="category-sub-li"><a href="">Men</a></li>
									<li class="category-sub-li"><a href="">Women</a></li>
								</ul></li>
							<li class="category-left-li"><a href="#">MLB</a>
								<ul class="category-sub">
									<li class="category-sub-li"><a href="">Men</a></li>
									<li class="category-sub-li"><a href="">Women</a></li>
								</ul></li>
							<li class="category-left-li"><a href="#">Others</a></li>

						</ul>
					</div>
					<div class="category-right row">
						<div class="category-right-top-item font-weight-bold">
							<p>Men</p>
						</div>
						<div class="category-right-top-item block-menu">
							<button>
								<span>Filter</span><i class="fas fa-sort-down"></i>
							</button>
						</div>
						<div class="category-right-top-item block-menu">
							<select name="" id="">
								<option value="">Sort</option>
								<option value="">Price: Low to High</option>
								<option value="">Price: High to Low</option>
								<option value="">Newest Arrivals</option>
							</select>
						</div>

						<div class="category-right-content row">
							<c:forEach items="${productsWithPaging.data }" var="p">
								<div class="category-right-content-item text-center">
									<img src="${base}/upload/${p.avatar}" alt=""> <a
										href="${base }/product/${p.seo}"><h1>${p.title }</h1></a>

									<p>
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${p.price}" type="currency" />
									</p>
								</div>
							</c:forEach>
						</div>


						<!-- paging -->
						<div class="category-right-bottom row">

							<div class="category-right-bottom-items">
								<p>
									<span>1 2 3 4</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Category -->

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>
	</div>

	<!-- js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

</body>

</html>