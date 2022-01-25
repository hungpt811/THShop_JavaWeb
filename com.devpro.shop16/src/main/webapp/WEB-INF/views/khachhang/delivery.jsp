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
<
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

		<section class="delivery">
			<div class="container">
				<div class="delivery--content row">

					<div class="delivery--content__left">
						<div class="container" style="padding-bottom: 20px">
							<div class="payment-content row">
								<div>
									<div class="payment-content-method-delivery">
										<p style="font-weight: bold;">Phương thức giao hàng</p>
										<div class="payment-content-method-delivery-item">
											<input checked type="radio"> <label for="">Giao
												hàng chuyển phát nhanh</label>
										</div>
									</div>
									<div class="payment-content-method-payment">
										<p style="font-weight: bold;">Phương thức thanh toán</p>
										<p>Mọi giao dịch đều được bảo mật và mã hóa. Thông tin thẻ
											tín dụng sẽ không bao giờ được lưu lại.</p>
										<div class="payment-content-method-payment-item">
											<input checked name="method-payment" type="radio"> <label
												for=""> Thanh toán bằng thẻ ATM(OnePay)</label>
										</div>
										<div class="payment-content-method-payment-item-img">
											<img src="${base}/img/khachhang/vcb.png" alt="">
										</div>
										<div class="payment-content-method-payment-item">
											<input name="method-payment" type="radio"> <label
												for=""> Thanh toán Momo</label>
										</div>
										<div class="payment-content-method-payment-item-img">
											<img src="${base}/img/khachhang/momo.png" alt="">
										</div>
										<div class="payment-content-method-payment-item">
											<input name="method-payment" type="radio"> <label
												for=""> Thu tiền tận nơi</label>
										</div>
									</div>


								</div>


							</div>
						</div>

						<!-- Da login -->
						<c:choose>
							<c:when test="${isLogined}">
								<form action="${base }/cart/delivery" method="post"
									id="payment_form">
									<script type="text/javascript">
									 document.querySelector('#payment_form').addEventListener('submit', function(e) {
									      var form = this;
									      
									      e.preventDefault();
									      
									      Swal.fire({
									          title: "Are you sure?",
									          text: "Bạn có chắc chắn muốn đặt hàng!",
									          icon: "warning",
									          showCloseButton: true,
								              showCancelButton: true,
								              focusConfirm: false,									        
								              cancelButtonText: 'Không',
									          confirmButtonText: 'Đồng ý',									          
									          reverseButtons: true
									        }).then(function(result) {
									          if (result.isConfirmed) {
									            Swal.fire({
									            	title: 'Thành công!',
													text: 'Đặt hàng thành công, quay trở lại trang chủ',
													icon: 'success',
													confirmButtonText: 'Đồng ý'
									            }).then(function() {
									              form.submit();
									            });
									          }
									        });
									    }); 
									   /*  document.querySelector('#payment_form').addEventListener('submit', function(e) {
											 var form = this;
											 e.preventDefault();
											Swal.fire({
												title: 'Thành công!',
												text: 'Đặt hàng thành công, quay trở lại trang chủ',
												icon: 'success',
												confirmButtonText: 'Đồng ý'
											
											});	
										}; */
									</script>
									<p>Chọn địa chỉ giao hàng</p>
									<input type="hidden" id="totalCart" name="totalCart"
										value="${cart.totalPrice}">
									<div style="margin: 0;"
										class="delivery--content__left-input--top row">
										<div class="input--top__item">
											<label for="">Họ tên:<span style="color: red">*</span></label>
											<input type="text" id="customerFullName"
												name="customerFullName" value="${userLogined.fullname}">
										</div>
										<div class="input--top__item">
											<label for="">Số điện thoại:<span
												style="color: red">*</span></label> <input type="text"
												id="customerPhone" name="customerPhone"
												value="${userLogined.phonenumber}">
										</div>
									</div>
									<div class="input--top__item--bottom">
										<label for="">Email:<span style="color: red">*</span></label>
										<input type="text" id="customerEmail" name="customerEmail"
											value="${userLogined.email}"> <label for="">Địa
											chỉ:<span style="color: red">*</span>
										</label> <input type="text" id="customerAddress"
											name="customerAddress" value="${userLogined.address}">

									</div>
									<div style="margin: 0;"
										class="delivery--content__left-input--button row">
										<a class="back-to-cart" href="${base}/cart">
											<p>&#171;</p>
											<p>Back to cart</p>
										</a>
										<button>Thanh toán</button>

									</div>
								</form>

							</c:when>
							<c:otherwise>
								<!-- Chua dang nhap -->
								<form action="${base }/cart/delivery" method="post">
									<p>Chọn địa chỉ giao hàng</p>
									<a style="text-decoration: none; color: #C90;"
										href="${base}/login" class="delivery--content__left-login">
										<i class='bx bx-log-in'></i>
										<p>Đăng nhập (Nếu bạn đã có tài khoản THShop)</p>
									</a>
									<div style="margin: 0;"
										class="delivery--content__left-input--top row">
										<div class="input--top__item">
											<label for="">Họ tên:<span style="color: red">*</span></label>
											<input type="text" id="customerFullName"
												name="customerFullName">
										</div>
										<div class="input--top__item">
											<label for="">Số điện thoại:<span
												style="color: red">*</span></label> <input type="text"
												id="customerPhone" name="customerPhone">
										</div>
									</div>
									<div class="input--top__item--bottom">
										<label for="">Email:<span style="color: red">*</span></label>
										<input type="text" id="customerEmail" name="customerEmail">

										<label for="">Địa chỉ:<span style="color: red">*</span></label>
										<input type="text" id="customerAddress" name="customerAddress">

									</div>
									<div style="margin: 0;"
										class="delivery--content__left-input--button row">
										<a class="back-to-cart" href="${base}/cart">
											<p>&#171;</p>
											<p>Quay lại giỏ hàng</p>
										</a>
										<button type="submit">Thanh toán</button>

									</div>
								</form>
							</c:otherwise>
						</c:choose>


					</div>

					<div class="delivery--content__right">
						<table>
							<tr>
								<th>Tên sản phẩm</th>
								<th class="text-center">Giảm giá</th>
								<th class="text-center">Số lượng</th>
								<th class="text-center">Giá</th>
							</tr>
							<c:forEach items="${cart.cartItems }" var="ci">
								<tr class="delivery-pd">
									<td>${ci.productName }</td>
									<td class="text-center">30%</td>
									<td class="text-center">${ci.quantity }</td>
									<td class="text-center"><fmt:setLocale value="vi_VN"
											scope="session" /> <fmt:formatNumber value="${ci.priceUnit}"
											type="currency" /></td>
								</tr>
							</c:forEach>
							<tfoot>
								<tr>
									<td class="font-weight-bold" colspan="3">Tổng</td>
									<td class="font-weight-bold text-center"><fmt:setLocale
											value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${cart.totalPrice}" type="currency" /></td>
								</tr>
								<tr>
									<td class="font-weight-bold" colspan="3">Phí ship</td>
									<td class="font-weight-bold text-center">0đ</td>
								</tr>
								<tr>
									<td class="font-weight-bold" colspan="3">Tạm tính</td>
									<td class="font-weight-bold text-center"><fmt:setLocale
											value="vi_VN" scope="session" /> <fmt:formatNumber
											value="${cart.totalPrice}" type="currency" /></td>
								</tr>
							</tfoot>

						</table>

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