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

	<!-- profile content -->
	<div class="bg-main">
		<div class="profile-title">
			<h3>Thông tin khách hàng</h3>
		</div>
		<div class="container profile-content">
			<div>
				<h2>Bảng thông tin của tôi</h2>
			</div>
			<sf:form modelAttribute="userInfo" action="${base}/user/info"
				method="post">
				<div class="row">
					<div class="col-sm-12">
						<p style="font-weight: 600;">Xin chào, ${userInfo.name}</p>
						<p>Lựa chọn dưới đấy để xem hoặc chỉnh sửa thông tin</p>

						<div class="form-group field">
							<label>Họ và tên:</label>
							<sf:input path="fullname" type="text" class="form-control"
								name="userFullName" value="${userInfo.fullname}" />
						</div>
						<sf:input path="name" type="hidden" class="form-control"
							name="name" value="${userInfo.name}" />
						<sf:input path="id" type="hidden" class="form-control"
							name="id" value="${userInfo.id}" />
						<div class="form-group field">
							<label>Email:</label>
							<sf:input type="email" path="email" class="form-control"
								name="userEmail" value="${userInfo.email}" />
						</div>
						<div class="form-group field">
							<label>Số điện thoại:</label>
							<sf:input path="phonenumber" type="text" class="form-control"
								name="userPhone" value="${userInfo.phonenumber}" />
						</div>
						<div class="form-group field">
							<label>Địa chỉ:</label>
							<sf:input type="text" path="address" class="form-control"
								name="userAddress" value="${userInfo.address}" />
						</div>
						<div class="form-group field">
							<label>Mật khẩu hiện tại:</label>
							<sf:input path="password" value="${userInfo.password}"
								type="password" class="form-control" name="password" />
						</div>
					</div>
					 <%-- <div class="col-sm-12">						
						<div class="form-group field">
							<label>Mật khẩu mới:</label>
							<sf:input path=""  type="password" id="password" class="form-control"
								name="" />
						</div>
						<div class="form-group field">
							<label>Nhập lại mật khẩu mới:</label>
							<sf:input path="" type="password" id="confirmPassword" class="form-control"
								name="" />
						</div>
					</div>  --%>

				</div>
				<div class="row">
					<div class="col-md-12">
						<button style="font-size: 13px" type="submit"
							class="btn-flat btn-hover btn-shop-now">Cập nhật</button>
					</div>
				</div>
			</sf:form>
		</div>
	</div>
	<!-- end profile content -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/footer2.jsp"></jsp:include>
	<!-- end footer -->

	<!-- app js -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

</body>

</html>