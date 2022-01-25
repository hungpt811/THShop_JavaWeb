product = function(baseUrl) {
	// tạo javascript object.  
	// data là dữ liệu cùng kiểu với RequestMapping
	let data = {
		name: jQuery("#name").val(), // lay theo id, name là lấy từ obj Contact
		amount: jQuery("#amount").val(), // lay theo id
		/*img: jQuery("#img").val(),
		cate: jQuery("#cate").val(),
		feature: jQuery("#feature").val(),*/
	};
	
	// $ === jQuery
	// json == javascript object
	jQuery.ajax({
		url: baseUrl + "/ajax/product", //->action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json", // kieu du lieu tra ve tu controller la json vì controlelr action trả về kiểu Map
		success: function(jsonResult) {
		/*	alert(JSON.stringify(jsonResult));
			alert(jsonResult.message);*/
			jQuery("#TB_PRODUCT").html(jsonResult.message);
		},
		error: function(jqXhr, textStatus, errorMessage) {
			
		}
	});
	
}
	
