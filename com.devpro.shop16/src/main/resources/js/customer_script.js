// giảm số lượng sản phẩm vào trong giỏ hàng
function ReduceProductQuantity(baseUrl, productId) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/reduceProductQuantity", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$("#quantity_" + productId).html(jsonResult.curentProductQuantity);
			$("#totalQuantity_" + productId).html(jsonResult.totalItems);
			$(".totalPrice_" + productId).html(jsonResult.totalPrice);

			$("#quantity").html(jsonResult.curentProductQuantity);
			$("#totalQuantity").html(jsonResult.totalItems);
			$(".totalPrice").html(jsonResult.totalPrice);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}

// cập nhật số lượng sản phẩm vào trong giỏ hàng
function UpdateProductQuantity(baseUrl, productId) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/updateProductQuantity", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon	
			$("#quantity_" + productId).html(jsonResult.curentProductQuantity);
			$("#totalQuantity_" + productId).html(jsonResult.totalItems);
			$(".totalPrice_" + productId).html(jsonResult.totalPrice);

			$("#quantity").html(jsonResult.curentProductQuantity);
			$("#totalQuantity").html(jsonResult.totalItems);
			$(".totalPrice").html(jsonResult.totalPrice);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}

function UpdateInput(baseUrl) {
	var value = parseInt(document.getElementById('pd_quantity').value, 10);
	value = isNaN(value) ? 1 : value;
	value++;
	document.getElementById('pd_quantity').value = value;
}


function ReduceInput(baseUrl) {
	var value = parseInt(document.getElementById('pd_quantity').value, 10);
	value = isNaN(value) ? 1 : value;
	value--;
	if (value < 1) {
		value == 1;

		Swal.fire({
			title: 'Lỗi!',
			text: 'Bạn chỉ có thể mua ít nhất 1 sản phẩm',
			icon: 'error',
			confirmButtonText: 'Đồng ý'
		})


	} else {
		document.getElementById('pd_quantity').value = value;
	}
}


/*function deleteProduct(baseUrl, productId) {
	option = confirm('Bạn có chắc chắn muốn xóa sản phẩm này không');
	if (!option) {
		return;
	}
	let data = {
		productId: productId,
	};

	jQuery.ajax({
		url: baseUrl + "/ajax/deleteProduct",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json",
		success: function(jsonResult) {
			alert(jsonResult.message);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}*/


// Thêm sản phẩm vào trong giỏ hàng
function AddToCart(baseUrl, productId, quantity) {
	// javascript object.  data la du lieu ma day len action cua controller
	let data = {
		productId: productId, // lay theo id
		quantity: jQuery("#pd_quantity").val(), // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/addToCart", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json
		success: function(jsonResult) {
			// tăng số lượng sản phẩm trong giỏ hàng trong icon
			$("#iconShowTotalProductsInCart").html(jsonResult.totalProducts);
			$("#totalQuantity").html(jsonResult.totalItems);
			$([document.documentElement, document.body]).animate({
				scrollTop: $("#iconShowTotalProductsInCart").offset().top
			}, 1000);
		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}


contact = function(baseUrl) {
	// tạo javascript object.  
	// data là dữ liệu cùng kiểu với RequestMapping
	let data = {
		name: jQuery("#name").val(), // lay theo id, name là lấy từ obj Contact
		email: jQuery("#email").val(), // lay theo id
	};

	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/contact", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json vì controlelr action trả về kiểu Map
		success: function(jsonResult) {
			if (validateEmail(data.email)) {
				document.getElementById('contact_form').reset();
				/*alert(JSON.stringify(jsonResult));
				alert(jsonResult.message);*/
			} else {
				jQuery("#TB_CONTACT").html(jsonResult.message);


			}

		},
		error: function(jqXhr, textStatus, errorMessage) {

		}
	});
}
function validateEmail(email) {
	const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(String(email).toLowerCase());
}