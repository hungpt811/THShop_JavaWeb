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

		<section class="product">
			<div class="container">
				<div class="product-top row">
					<p>Home</p>
					<span>/</span>
					<p>Nike</p>
					<span>/</span>
					<p>Men</p>
					<span>/</span>
					<p>${product.title}</p>
				</div>
				<div class="product-content row">
					<div class="product-content-left row">
						<div class="product-content-left__avatar">
							<img src="${base}/upload/${product.avatar}" alt="">
						</div>
						<div class="product-content-left__picture">
							<c:forEach items="${product.productImages}" var="picture">
								<img src="${base}/upload/${picture.path}" alt="">
							</c:forEach>

						</div>
					</div>
					<div class="product-content-right">
						<div class="product-content-right__title ">
							<h1 class="font-weight-bold">${product.title}</h1>
							<p>PC: CK6649-100</p>
						</div>
						<div class="product-content-right__price font-weight-bold">
							<p>
								<fmt:setLocale value="vi_VN" scope="session" />
								<fmt:formatNumber value="${product.price}" type="currency" />
							</p>
						</div>

						<div class="product-shortDes">${product.shortDes}</div>
						<div class="product-content-right__size">
							<p class="font-weight-bold">Size:</p>
							<div class="pd--size">
								<select name="" id="">
									<option value="">Select an option</option>
									<option value="">40</option>
								</select>
							</div>
						</div>
	
						<div class="pd--quantity d-flex">
							<button value="-"
								onclick="javascript:ReduceInput('${base }');">-</button>
							<input id="pd_quantity" name="pd_quantity" type="text"  min="1" value="1">
							<button value="+"
								onclick="javascript:UpdateInput('${base }');">+</button>
						</div>
						<div class="pd--button">
							<button
								onclick="javascript:AddToCart('${base }', ${product.id}, 1);">Add
								to cart</button>
						</div>


						<div class="product-content-right-bottom">
							<div class="product-content-right-bottom-top">
								<i class="fas fa-angle-down"></i>
							</div>
							<div class="product-content-right-bottom-content-big">
								<div class="product-content-right-bottom-content-title row">
									<div
										class="product-content-right-bottom-content-title-item chitiet">
										<p>Chi tiết</p>
									</div>
									<div
										class="product-content-right-bottom-content-title-item thamkhaosize">
										<p>Tham khảo size</p>
									</div>
								</div>
								<div class="product-content-right-bottom-content">
									<div class="product-content-right-bottom-content-chitiet">
										${product.detailDes}</div>
									<div class="product-content-right-bottom-content-thamkhaosize">
										
									</div>
								</div>
								<div class="modal hide">
                                            <div class="modal__content">
                                                <div class="modal__header">
                                                    <p>Size Chart</p>
                                                    <i class="fas fa-times"></i>
                                                </div>
                                                <div class="modal__body">
                                                    <img src="${base}/img/khachhang/size.jpg" alt="size">
                                                </div>
                                                <div class="modal__footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>

                                        </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>
	</div>

	<!-- js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

</body>

</html>