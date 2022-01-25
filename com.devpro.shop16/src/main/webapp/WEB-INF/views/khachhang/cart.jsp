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
	<div id="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/header2.jsp"></jsp:include>

		<section class="cart">

			<div class="container">
				<div class="cart--content row">
					<div class="cart--content__left">
						<table>
							<tr>
								<th>Sản phẩm</th>
								<th>Tên sản phẩm</th>
								<th>Size</th>
								<th>Số lượng</th>
								<th>Giá</th>
								<th>Xóa</th>
							</tr>

							<c:forEach items="${cart.cartItems }" var="ci">
								<tr id="cart-pd_${ci.productId}">
									<td class="cart--avatar"><img
										src="${base}/upload/${ci.avatar}" alt=""></td>
									<td>${ci.productName }</td>
									<td>
										<p style="margin: auto;">42</p>
									</td>
									<td>
										<div class="quantityProductCart">
											<button value="-"
												onclick="javascript:ReduceProductQuantity('${base }', ${ci.productId});">-</button>
											<span id="quantity_${ci.productId}">${ci.quantity }</span>
											<%-- <input type="text" id="quantity_${ci.productId}" value="${ci.quantity }"> --%>
											<button value="+"
												onclick="javascript:UpdateProductQuantity('${base }', ${ci.productId});">+</button>
										</div>
									</td>
									<td>

										<p style="margin: auto;">
											<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${ci.priceUnit}" type="currency" />
										</p>
									</td>
									<td><a  style="cursor: pointer;"
										onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng không?')"
										href="${base}/cart/deleteProduct/${ci.productId}"
										class="delete-btn" title="Xóa">x</a></td>										
								</tr>
							</c:forEach>

						</table>
					</div>
					<div class="cart--content__right">
						<table>

							<tr>
								<th class="font-weight-bold text-center" colspan="2">Tổng
									tiền giỏ hàng</th>
							</tr>
							<tr>
								<td>Tổng sản phẩm</td>
								<td id="totalQuantity">${totalItems}</td>
							</tr>
							<tr>
								<td>Thành tiền</td>
								<td>
									<p class="totalPrice">
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${cart.totalPrice}" type="currency" />
									</p>
								</td>
							</tr>
							<tr>
								<td>Tạm tính</td>
								<td>
									<p class="totalPrice" class="font-weight-bold">
										<fmt:setLocale value="vi_VN" scope="session" />
										<fmt:formatNumber value="${cart.totalPrice}" type="currency" />
									</p>
								</td>
							</tr>

						</table>
						<div class="cart--content__right-text text-center">
							<p>Bạn sẽ được miễn phí ship khi đơn hàng của bạn có tổng giá
								trị trên 3.000.000 đ</p>
						</div>
						<div
							class="cart--content__right-button text-center align-items-center">
							<a href="${base}/category" class="keep-shopping"><button>Tiếp
									tục mua sắm</button></a> <a href="${base}/cart/delivery" class="check-out"><button>Thanh
									toán</button></a>

						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer2.jsp"></jsp:include>
		<!-- end footer -->
	</div>
	
	
	<!-- app js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

</body>

</html>