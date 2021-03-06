<div class="container">
	<div class="row">
		<!-- display sidebar -->
		<div class="col-lg-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>
		<!-- display products -->
		<div class="col-lg-9">
			<!-- bread crumb -->
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${userClickAllProducts==true}">
						<script>
							window.categoryId = '';
						</script>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
							<li class="breadcrumb-item active">All Products</li>
						</ol>
					</c:if>
					<c:if test="${userClickCategoryProducts==true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
							<li class="breadcrumb-item active">Category</li>
							<li class="breadcrumb-item active">${category.name}</li>
						</ol>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<table id="productListTable"
						class="display nowrap" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th></th>
								<th>Name</th>
								<th>Brand</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Views</th>
								<th></th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th></th>							
								<th>Name</th>
								<th>Brand</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Views</th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>