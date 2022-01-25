
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<footer class="bg-second">
	<div class="container">
		<div class="row">
			<div class="col-3 col-md-6">
				<h3 class="footer-head">Products</h3>
				<ul class="menu">
					<li><a href="#">Help center</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#">product help</a></li>
					<li><a href="#">warranty</a></li>
					<li><a href="#">order status</a></li>
				</ul>
			</div>
			<div class="col-3 col-md-6">
				<h3 class="footer-head">services</h3>
				<ul class="menu">
					<li><a href="#">Help center</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#">product help</a></li>
					<li><a href="#">warranty</a></li>
					<li><a href="#">order status</a></li>
				</ul>
			</div>
			<div class="col-3 col-md-6">
				<h3 class="footer-head">support</h3>
				<ul class="menu">
					<li><a href="#">Help center</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#">product help</a></li>
					<li><a href="#">warranty</a></li>
					<li><a href="#">order status</a></li>
				</ul>
			</div>
			<div class="col-3 col-md-6 col-sm-12">
				<div class="contact">
					<h3 class="contact-header">THShop</h3>
					<ul class="contact-socials">
						<li><a href="#"> <i class='bx bxl-facebook-circle'></i>
						</a></li>
						<li><a href="#"> <i class='bx bxl-instagram-alt'></i>
						</a></li>
						<li><a href="#"> <i class='bx bxl-youtube'></i>
						</a></li>
						<li><a href="#"> <i class='bx bxl-twitter'></i>
						</a></li>
					</ul>
				</div>
				<div class="subscribe">
					<form id="subcribe_form" action="${base}/index" method="POST">
						<input type="email" name="subEmail" id="subEmail"
							placeholder="ENTER YOUR EMAIL">
						<button type="button" onclick="subcribe('${base}')">subscribe</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</footer>