<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="header" style="background-color: var(--black);">
	<nav class="d-flex">
		<div class="logo align-items-center text-left d-flex">
			<a href="" class="d-block"> <img
				src="${base}/img/khachhang/logo.png" alt="Candles">
			</a>
		</div>
		<div
			class="block-menu justify-content-center menu-content position-relative d-flex">
			<ul class="d-flex">
				<li class="lv_1 position-relative"><a
					class="d-block font-weight-bold" href="${base}/index">Home</a></li>
				<li class="lv_1 position-relative"><a
					class="d-block font-weight-bold" href="">About</a></li>
				<li class="lv_1 position-relative"><a
					class="d-block font-weight-bold" href="${base}/category">Shop</a>
					<ul style="background-color: var(--black);">
						<li class="lv_2"><a class="d-block font-weight-bold" href="">Nike</a></li>
						<li class="lv_2"><a class="d-block font-weight-bold" href="">Addidas</a></li>
						<li class="lv_2"><a class="d-block font-weight-bold" href="">MLB</a></li>
						<li class="lv_2"><a class="d-block font-weight-bold" href="">Others</a></li>
					</ul></li>
				<li class="lv_1 position-relative"><a
					class="d-block font-weight-bold" href="${base}/contact">Contact</a></li>
			</ul>

		</div>
		<div class="top-menu-icons">
				<c:choose>
					<c:when test="${isLogined}"> 						
						<ul>
	                        <li class="icons_lv1 position-relative">
	                            <input style="color: #fff" type="text" placeholder="search..">
	                            <i class="fas fa-search"></i>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                            <i class="fas fa-user"></i>
	                            <ul style="background-color: #000" class="dropdown_icons position-absolute">
	                                <li class="icons_lv2 "><a class="d-block font-weight-bold" href="">${userLogined.fullname}</a></li>
	                                <li class="icons_lv2 "><a class="d-block font-weight-bold" href="">Your Order</a></li>
	                                <li class="icons_lv2 "><a class="d-block font-weight-bold" href="${base}/logout">Log out</a></li>
	                            </ul>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                        	<a href="${base}/cart">
	                        		<i class="fas fa-shopping-cart"></i>
	                        		<span id="iconShowTotalProductsInCart" style="font-size: 14px;">${totalProducts}</span>
	                        	</a>
	                       
	                        </li>
	                    </ul>
					</c:when>
					<c:otherwise>
						<ul>
	                        <li class="icons_lv1 position-relative">
	                            <input style="color: #fff" type="text" placeholder="search..">
	                            <i class="fas fa-search"></i>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                            <i class="fas fa-user"></i>
	                            <ul style="background-color: #000" class="dropdown_icons position-absolute">
	                                <li class="icons_lv2 "><a href="${base}/login" class="d-block font-weight-bold" >Login</a></li>
	                                <li class="icons_lv2 "><a href="${base}/register" class="d-block font-weight-bold" >Join us</a></li>
	                            </ul>
	                        </li>
	                        <li class="icons_lv1 position-relative">
	                            <a href="${base}/cart">
	                        		<i class="fas fa-shopping-cart"></i>
	                        		<span id="iconShowTotalProductsInCart" style="font-size: 14px;">${totalProducts}</span>
	                        	</a>
	                        </li>
	                    </ul>
					</c:otherwise>
				</c:choose>
                    
                </div>
	</nav>
</div>