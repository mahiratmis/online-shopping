$(function() {
	switch (menu) {
	// active menu problem
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	default:
		if (menu == 'Home')
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}

	var $table = $('#productListTable');
	if ($table.length) { // execute only if that table is in the page

		var jsonUrl = '';
		if (window.categoryId == '') { // all products
			jsonUrl = window.contextRoot + "/json/data/all/products";
		} else {
			jsonUrl = window.contextRoot + "/json/data/category/"
					+ window.categoryId + "/products";
		}

		$table
				.DataTable({
					lengthMenu : [ [ 3, 5, 10, -1 ], [ '3', '5', '10', 'All' ] ],
					pageLength : 20,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'code',
								bSortable : false,
								mRender : function(data, type, raw) {
									return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.png" class="dataTableImg"/>';
								}
							},
							{
								data : 'name'
							},
							{
								data : 'brand'
							},
							{
								data : 'unitPrice',
								mRender : function(data, type, raw) {
									return "&#36;" + data;
								}
							},
							{
								data : 'quantity',
								mRender : function(data, type, row) {
									if (data < 1) {
										return '<span style="color:red">Out of Stock!</span>';
									}
									return data;
								}
							},
							{
								data : 'views'
							},
							{
								data : 'id',
								mRender : function(data, type, raw) {
									var str = '';
								
									str += '<a title="View Details" href="'
										+ window.contextRoot
										+ '/show/'
										+ data
										+ '/product" class="btn btn-primary btn-sm">';
								str += '<i class="fa fa-eye fa-sm"></i></a>&#160;';		
								
								if (raw.quantity < 1) {
									str += '<a title="Add to Cart" href="javascript:void(0)" class="btn btn-success btn-sm disabled">';
								str += '<i class="fa fa-cart-plus fa-sm"></i></a>';										

								} else {
									str += '<a title="Add to Cart" href="'
										+ window.contextRoot
										+ '/cart/add/'
										+ data
										+ '/product" class="btn btn-success btn-sm">';
								str += '<i class="fa fa-cart-plus fa-sm"></i></a>';										

								}								
								
									return str;
								}
							} ]
				});
	}

});