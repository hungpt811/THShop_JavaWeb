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

	<!-- products content -->
	<div class="bg-main">
		<div class="container">
			<div class="box">
				<div class="breadcumb">
					<a href="./index.html">home</a> <span><i
						class='bx bxs-chevrons-right'></i></span> <a href="./products.html">all
						products</a>
				</div>
			</div>
			<div class="box">
				<div class="row">
					<div class="col-3 filter-col" id="filter-col">
						<div class="box filter-toggle-box">
							<button class="btn-flat btn-hover" id="filter-close">close</button>
						</div>
						<div class="box">
							<span class="filter-header"> Categories </span>
							<ul class="filter-list">
								<c:forEach items="${categories}" var="cate">
									<li><a href="#">${cate.name }</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="box">
							<span class="filter-header"> Price </span>
							<div class="price-range">
								<input type="text"> <span>-</span> <input type="text">
							</div>
						</div>
						<div class="box">
							<ul class="filter-list">
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="status1"> <label
											for="status1"> On sale <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="status2"> <label
											for="status2"> In stock <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="status3"> <label
											for="status3"> Featured <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
							</ul>
						</div>
						<div class="box">
							<span class="filter-header"> Brands </span>
							<ul class="filter-list">
								<c:forEach items="${categories}" var="cate">
									<li>
										<div class="group-checkbox">
											<input type="checkbox" id="remember1"> <label
												for="remember1"> ${cate.name}<i class='bx bx-check'></i>
											</label>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="box">
							<span class="filter-header"> Colors </span>
							<ul class="filter-list">
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember1"> <label
											for="remember1"> Red <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember2"> <label
											for="remember2"> Blue <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember3"> <label
											for="remember3"> White <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember4"> <label
											for="remember4"> Black <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember5"> <label
											for="remember5"> Yellow <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
							</ul>
						</div>
						<div class="box">
							<span class="filter-header"> rating </span>
							<ul class="filter-list">
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember1"> <label
											for="remember1"> <span class="rating"> <i
												class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
												class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
												class='bx bxs-star'></i>
										</span> <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember1"> <label
											for="remember1"> <span class="rating"> <i
												class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
												class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
												class='bx bx-star'></i>
										</span> <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember1"> <label
											for="remember1"> <span class="rating"> <i
												class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
												class='bx bxs-star'></i> <i class='bx bx-star'></i> <i
												class='bx bx-star'></i>
										</span> <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember1"> <label
											for="remember1"> <span class="rating"> <i
												class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
												class='bx bx-star'></i> <i class='bx bx-star'></i> <i
												class='bx bx-star'></i>
										</span> <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
								<li>
									<div class="group-checkbox">
										<input type="checkbox" id="remember1"> <label
											for="remember1"> <span class="rating"> <i
												class='bx bxs-star'></i> <i class='bx bx-star'></i> <i
												class='bx bx-star'></i> <i class='bx bx-star'></i> <i
												class='bx bx-star'></i>
										</span> <i class='bx bx-check'></i>
										</label>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-9 col-md-12">
						<form class="form-inline" action="${base }/category" method="get">
							<div class="box filter-toggle-box">
								<button class="btn-flat btn-hover" id="filter-toggle">filter</button>
							</div>
							<div class="box search-pd" style="display: flex; justify-content: flex-end;">
								<input type="hidden" id="page" name="page" class="form-control">
								<input type="text" id="keyword" name="keyword"
									value="${searchModel.keyword }"
									class="form-control float-right" placeholder="Search">
								<button type="submit" class="btn btn-default" id="btnSearch"
									name="btnSearch" value="Search">
									<i class="bx bx-search-alt"></i>
								</button>
							</div>
							<div class="box">
								<div class="row" id="products">
									<c:forEach items="${productsWithPaging.data }" var="p">
										<div class="col-4 col-md-6 col-sm-12">
											<div class="product-card">
												<div class="product-card-img">
													<img src="${base}/upload/${p.avatar}" alt=""> <img
														src="${base}/upload/${p.avatar}" alt="">
												</div>
												<div class="product-card-info">
													<div class="product-btn">
														<a href="${base }/product/${p.seo}"
															class="btn-flat btn-hover btn-shop-now">shop now</a>
														<button class="btn-flat btn-hover btn-cart-add">
															<i class="bx bxs-cart-add"></i>
														</button>
														<button class="btn-flat btn-hover btn-cart-add">
															<i class="bx bxs-heart"></i>
														</button>
													</div>
													<div class="product-card-name">${p.title }</div>
													<div class="product-card-price">
														<span><del>4.000.000đ</del></span> <span
															class="curr-price"> <fmt:setLocale value="vi_VN"
																scope="session" /> <fmt:formatNumber value="${p.price}"
																type="currency" />
														</span>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>

							</div>
							<div class="col-12 d-flex justify-content-center"></div>
							<div class="box">
								<div class="pagination" id="paging"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end products content -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/footer2.jsp"></jsp:include>
	<!-- end footer -->

	<!-- app js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
			$( document ).ready(function() {
				$("#categoryId").val(${searchModel.categoryId});
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalItems},
			        itemsOnPage: 8,
			        prevText: "Trước",
			        nextText: "Sau",
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
		</script>
</body>

</html>