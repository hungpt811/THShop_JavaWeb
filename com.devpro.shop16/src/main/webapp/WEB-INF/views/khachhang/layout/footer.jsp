<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div id="footer">
	<div class="container">
		<div class="footer-content d-flex">
			<div class="footer-col block-menu">
				<p class="title">
					<span style="font-size: 18px;"> <strong>CANDLES</strong>
					</span>
				</p>
				<ul>
					<li><a href="">118 Hà Đông</a></li>
					<li><a href="">info@company.vn</a></li>
					<li><a href="">0912.345.678</a></li>
				</ul>
			</div>
			<div class="footer-col block-menu  ">
				<p class="title font-weight-bold">SUPPORT</p>
				<ul>
					<li><a href="">Check your order</a></li>
					<li><a href="">Login</a></li>
					<li><a href="">Register</a></li>
				</ul>
			</div>
			<div class="footer-col block-menu  ">
				<p class="title font-weight-bold">POLICY</p>
				<ul>
					<li><a href="">Privacy Policy</a></li>
					<li><a href="">Return Policy</a></li>
					<li><a href="">Shipping Policy</a></li>
					<li><a href="">Usage rules</a></li>
				</ul>
			</div>
			<div class="footer-col block-menu form-sub">
				<p class="title font-weight-bold">SUBCRIBE</p>
				<p class="font-weight-bold">Send email to receive promotion</p>
				<div class="position-relative">
					<form id="subcribe_form" action="${base}/index" method="POST">
						<input type="email" name="subEmail" id="subEmail"
							class="form-control" placeholder="Email..">
						<button class="position-absolute" type="button" 
								onclick="subcribe('${base}')">
							<i class="fas fa-chevron-right"></i>
						</button>
					</form>
				</div>
				<p class="font-weight-bold" id="TB_SUBCRIBE"></p>

			</div>
			<div class="footer-col block-menu">
				<p class="title font-weight-bold">CONNECTION</p>
				<a href="/"><i class="fab fa-facebook-f"></i></a> <a href=""><i
					class="fab fa-youtube"></i></a> <a href=""><i
					class="fab fa-instagram"></i></a>
			</div>
		</div>
		<div class="copy-right">
			<div class="container">
				<p class="text-center font-weight-bold">
					<span style="font-size: 12px; color: #b11010;">CANDLES
						STUDIO 2021</span> <span style="font-size: 12px;">© ALL RIGHTS
						RESERVED</span>
				</p>
			</div>
		</div>
	</div>
</div>