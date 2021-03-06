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

		 <!-- -------------------------Payment---------------- -->
        <section class="payment">
            <div class="container">
                <div class="step--top--wrap d-flex justify-content-center text-center">
                    <div class="step--top d-flex text-center">
                        <div style="border: 1px solid #dddddd;" class="step--top__cart step--top__icon d-flex justify-content-center">
                            <i style="color: #dddddd;" class="fas fa-shopping-cart "></i>
                        </div>
                        <div style="border: 1px solid #dddddd;" class="step--top__address step--top__icon d-flex justify-content-center">
                            <i style="color: #dddddd;" class="fas fa-map-marker-alt "></i>
                        </div>
                        <div class="step--top__pay step--top__icon d-flex justify-content-center">
                            <i class="far fa-credit-card "></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="payment-content row">
                    <div class="payment-content-left">
                        <div class="payment-content-left-method-delivery">
                            <p style="font-weight: bold;">Ph????ng th???c giao h??ng</p>
                            <div class="payment-content-left-method-delivery-item">
                                <input checked type="radio">
                                <label for="">Giao h??ng chuy???n ph??t nhanh</label>
                            </div>
                        </div>
                        <div class="payment-content-left-method-payment">
                            <p style="font-weight: bold;">Ph????ng th???c thanh to??n</p>
                            <p>M???i giao d???ch ?????u ???????c b???o m???t v?? m?? h??a. Th??ng tin th??? t??n d???ng s??? kh??ng bao gi??? ???????c l??u l???i.</p>
                            <div class="payment-content-left-method-payment-item">
                                <input name="method-payment" type="radio">
                                <label for="">Thanh to??n b???ng th??? t??n d???ng(OnePay)</label>
                            </div>
                            <div class="payment-content-left-method-payment-item-img">
                                <img src="${base}/img/khachhang/visa.png" alt="">
                            </div>
                            <div class="payment-content-left-method-payment-item">
                                <input checked name="method-payment" type="radio">
                                <label for=""> Thanh to??n b???ng th??? ATM(OnePay)</label>
                            </div>
                            <div class="payment-content-left-method-payment-item-img">
                                <img src="${base}/img/khachhang/vcb.png" alt="">
                            </div>
                            <div class="payment-content-left-method-payment-item">
                                <input name="method-payment" type="radio">
                                <label for="">  Thanh to??n Momo</label>
                            </div>
                            <div class="payment-content-left-method-payment-item-img">
                                <img src="${base}/img/khachhang/momo.png" alt="">
                            </div>
                            <div class="payment-content-left-method-payment-item">
                                <input name="method-payment" type="radio">
                                <label for="">  Thu ti???n t???n n??i</label>
                            </div>
                        </div>

                    </div>
                    <div class="payment-content-right">
                        <div class="payment-content-right-button">
                            <input type="text" placeholder="M?? gi???m gi??/Qu?? t???ng">
                            <button><i class="fas fa-check"></i></button>
                        </div>
                        <div class="payment-content-right-button">
                            <input type="text" placeholder="M?? c???ng t??c vi??n">
                            <button><i class="fas fa-check"></i></button>
                        </div>
                        <div class="payment-content-right-mnv">
                            <select name="" id="">
                           <option value="">Ch???n m?? nh??n vi??n th??n thi???t</option>
                           <option value="">D345</option>
                       </select>
                        </div>
                    </div>
                </div>
                <div class="payment-content-right-payment">
                    <button>TI???P T???C THANH TO??N</button>
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