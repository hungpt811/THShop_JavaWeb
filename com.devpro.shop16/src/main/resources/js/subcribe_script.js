
subcribe = function(baseUrl) {
	// tạo javascript object.  
	// data là dữ liệu cùng kiểu với RequestMapping
	let data = {
		/*name: jQuery("#name").val(), // lay theo id, name là lấy từ obj Contact*/
		email: jQuery("#subEmail").val(), // lay theo id
	};

	// $ === jQuery
	// json == javascript object

	jQuery.ajax({
		url: baseUrl + "/ajax/index", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json vì controller action trả về kiểu Map
		success: function(jsonResult) {
			if (validateEmail(data.email)) {
				document.getElementById('subcribe_form').reset();
				Swal.fire({
					title: jsonResult.message,
					text: 'Chúng tôi sẽ gửi thông tin sale mới nhất vào địa chỉ: '+ jsonResult.mail,
					icon: 'success',
					confirmButtonText: 'Đồng ý'
				})
			} else {
				Swal.fire({
					title: 'Lỗi!',
					text: jsonResult.message2,
					icon: 'error',
					confirmButtonText: 'Đồng ý'
				})
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
