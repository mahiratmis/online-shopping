<div class="container">
	<div class="row">
		<div class="col-12">
			<script>
				window.categoryId = '';
			</script>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${contextRoot}/show/all/products">All Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>
			</ol>
		</div>
	</div>

	<div class="row">
		<!-- product image -->
		<div class="col-12 col-sm-4">
			<div class="thumbnail">
				<img src="${images}/${product.code}.png" class="img img-responsive" />
			</div>
		</div>
		<!-- product description -->
		<div class="col-12 col-sm-8">
			<h3>${product.name}</h3>
			<hr />
			<h4>${product.description}</h4>
			<hr />
			<h4>
				Price:<strong>&#36; ${product.unitPrice}</strong>
			</h4>
			<hr />
			<c:choose>
				<c:when test="${product.quantity < 1 }">
					<h6>
						Quantity Available: <span style="color:red;">Out of Stock!</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>Quantity Available: ${product.quantity}</h6>
				</c:otherwise>
			</c:choose>
			<hr />

			<c:choose>
				<c:when test="${product.quantity < 1 }">
					<a href="javascript:void(0)"
						class="btn btn-success disabled" title="Add to Cart"> <i
						class="fa fa-cart-plus fa-sm"></i>&nbsp;Add to Cart
					</a>
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/cart/add/${product.id}/product"
						class="btn btn-success btn-sm" title="Add to Cart"> <i
						class="fa fa-cart-plus fa-sm"></i>&nbsp;Add to Cart
					</a>
				</c:otherwise>
			</c:choose>

			<a href="${contextRoot}/show/all/products"
				class="btn btn-primary btn-sm" title="List All Products"><i
				class="fas fa-arrow-left"></i>&nbsp;Back</a>
		</div>
	</div>
</div>