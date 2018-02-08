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
	case 'Manage Products':
		$('#manageProducts').addClass('active');
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
											+ '.jpg" class="dataTableImg"/>';
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
									return "&#36; " + data;
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

	/* for fading out the alert message after 5 seconds */
	$alert = $('.alert');
	if ($alert.length) {
		setTimeout(function() {
			$alert.fadeOut('slow');
		}, 5000);
	}

	// list of all products for admin
	var $productsTable = $('#adminProductsTable');

	if ($productsTable.length) {

		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
		console.log(jsonUrl);

		$productsTable
				.DataTable({
					lengthMenu : [ [ 10, 30, 50, -1 ],
							[ '10 ', '30 ', '50 ', 'ALL' ] ],
					pageLength : 30,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [
							{
								data : 'id'
							},
							{
								data : 'code',
								bSortable : false,
								mRender : function(data, type, row) {
									return '<img src="'
											+ window.contextRoot
											+ '/resources/images/'
											+ data
											+ '.jpg" class="adminDataTableImg"/>';
								}
							},
							{
								data : 'name'
							},
							{
								data : 'brand'
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
								data : 'unitPrice',
								mRender : function(data, type, row) {
									return '&#36; ' + data
								}
							},
							{
								data : 'active',
								bSortable : false,
								mRender : function(data, type, row) {
									var str = '';
									if (data) {
										str += '<label class="switch"> <input type="checkbox" value="'
												+ row.id
												+ '" checked="checked">  <div class="slider round"> </div></label>';

									} else {
										str += '<label class="switch"> <input type="checkbox" value="'
												+ row.id
												+ '">  <div class="slider round"> </div></label>';
									}

									return str;
								}
							},
							{
								data : 'id',
								bSortable : false,
								mRender : function(data, type, row) {

									var str = '';
									str += '<a href="'
											+ window.contextRoot
											+ '/manage/'
											+ data
											+ '/product" class="btn btn-warning"><i	class="fa fa-edit fa-sm"></i></a> &#160;';

									return str;
								}
							} ],

					initComplete : function() {
						var api = this.api();
						api
								.$('.switch input[type="checkbox"]')
								.on(
										'change',
										function() {
											var dText = (this.checked) ? 'You want to activate the Product?'
													: 'You want to de-activate the Product?';
											var checked = this.checked;
											var checkbox = $(this);
											debugger;
											bootbox
													.confirm({
														size : 'medium',
														title : 'Product Activation/Deactivation',
														message : dText,
														callback : function(
																confirmed) {
															if (confirmed) {
																$
																		.ajax({
																			type : 'POST',
																			url : window.contextRoot
																					+ '/manage/product/'
																					+ checkbox
																							.prop('value')
																					+ '/activation',
																			timeout : 100000,
																			success : function(
																					data) {
																				bootbox
																						.alert(data);
																			},
																			error : function(
																					e) {
																				bootbox
																						.alert('ERROR: '
																								+ e);
																				// display(e);
																			}
																		});
															} else {
																checkbox
																		.prop(
																				'checked',
																				!checked);
															}
														}
													});
										});
					}
				});
	}

	var $categoryForm = $('#categoryForm');
	if ($categoryForm.length) {
		$categoryForm.validate({
			rules : {
				name : {
					required : true,
					minlength : 2
				},
				description : {
					required : true
				}
			},
			messages : {
				name : {
					required : 'Please enter a category name',
					minlength : 'Category name must be at least 2 characters'
				},
				description : {
					required : 'Please enter category description'
				}
			},
			errorElement : 'em',
			errorPlacement : function(error,element){
				error.addClass('help-block'); // add error block
				error.insertAfter(element); // add after input element
			}
		});
	}

});

/*
 * // Disabling form submissions if there are invalid fields $(function() { 'use
 * strict'; window.addEventListener('load', function() { // Fetch all the forms
 * we want to apply custom Bootstrap validation // styles to var forms =
 * document.getElementsByClassName('needs-validation'); // Loop over them and
 * prevent submission var validation = Array.prototype.filter.call(forms,
 * function(form) { form.addEventListener('submit', function(event) { if
 * (form.checkValidity() === false) { event.preventDefault();
 * event.stopPropagation(); } form.classList.add('was-validated'); }, false);
 * }); }, false); })();
 */
