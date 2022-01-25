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
<!-- css -->
<jsp:include page="/WEB-INF/views/khachhang/layout/css.jsp"></jsp:include>

</head>

<body>
	<div id="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/header2.jsp"></jsp:include>

		<section class="acontact">
			<div class="container contact--title">
				<h4>Liên hệ</h4>
			</div>
			<div class="container">
				<div class="row contact--content">
					<div class="contact--content__left flex-1 col-md-6 col-sm-6">
						<div class="contact--content__left-title">
							<h4 class="art-h4">Dịch vụ khách hàng</h4>
						</div>
						<ul class="contact--content__left-info list-unstyle">
							<li class="li-parent">
								<div class="left-info-phone font-weight-bold">
									<i class='bx bxs-paper-plane'></i> <span>Liên hệ</span>
								</div>
								<div class="left-info-content">
									<ul class="list-unstyle">
										<li><strong>Địa chỉ: </strong> 147 Phố Mai Dịch, Mai
											Dịch, Cầu Giấy, Hà Nội</li>
										<li><strong>Email: </strong> info@company.vn</li>
										<li><strong>Đặt hàng online: </strong> 0912.345.678</li>
										<li><strong>CSKH: </strong> cskh@company.vn</li>
									</ul>
									<p>&nbsp; &nbsp; &nbsp; &nbsp;Thứ Hai đến Thứ Bảy, từ 8:00
										đến 17:30&nbsp;</p>
								</div>
							</li>
							<li class="li-parent" style="border-bottom: none"></li>
							<li class="li-parent">
								<div class="left-info-formTitle font-weight-bold">
									<i class='bx bxs-envelope'></i> <span>Email</span>
								</div>
								<div class="left-info-form">
									<sf:form id="contact_form" modelAttribute="contact"
										action="${base}/contact" method="POST">
										<script type="text/javascript">
										 document.querySelector('#contact_form').onsubmit = function(e){
											 var form = this;
											 e.preventDefault();
											 Swal.fire({
													title: 'Cảm ơn bạn!',
													text: 'Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất',
													icon: 'success',
													confirmButtonText: 'Đồng ý'
												}).then(function(isConfirmed) {
													if(isConfirmed){
														 form.submit();
													}									             
									            });									
											}
										</script>

										<div class="form-namel row">
											<div class="col-md-6 col-sm-6 flex-1">
												<label class="font-weight-bold" for="inputName">Tên:<span
													style="color: red;">*</span></label>
												<sf:input path="first_name" id="first_name" type="text"
													placeholder="First Name" name="first_name" />
											</div>
											<div class="col-md-6 col-sm-6 flex-1">
												<label class="font-weight-bold" for="inputName">Họ
													đệm:<span style="color: red;">*</span>
												</label>
												<sf:input path="last_name" id="last_name" type="text"
													placeholder="Last Name" name="last_name" />
											</div>

										</div>
										<div class="form-email row">
											<div class="col-md-12 flex-1">
												<label class="font-weight-bold" for="inputName">Email:<span
													style="color: red;">*</span></label>
												<sf:input path="email" type="email" placeholder="Email"
													name="email" id="email" />
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 flex-1">
												<label class="font-weight-bold" for="inputName">Message:<span
													style="color: red;">*</span></label>
												<sf:textarea path="message" name="message" id="message"
													type="text" placeholder="Message" rows="8"></sf:textarea>

											</div>
										</div>
										<div class="row form-btn">
											<div class="col-md-12">
												<button type="submit" class="btn btn-success">Gửi</button>

											</div>
										</div>
									</sf:form>
								</div>
							</li>
						</ul>
					</div>
					<div class="contact--content__right flex-1 col-md-6 col-sm-6">
						<div class="contact--content__right-map">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.808871869981!2d105.7722778149119!3d21.04033218599205!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b5534fb3bf%3A0x70d71b071349fa94!2zQ8O0bmcgVHkgQ-G7lSBQaOG6p24gRGV2cHJvIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1640404916110!5m2!1svi!2s"
								width="100%" height="350" style="border: 0;" allowfullscreen=""
								loading="lazy"></iframe>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer2.jsp"></jsp:include>
		<!-- end footer -->

		<!-- app js -->
		<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>
</body>

</html>