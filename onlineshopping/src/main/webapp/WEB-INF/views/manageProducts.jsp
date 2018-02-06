<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container py-5">

	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-12 col-md-6 offset-md-3">
				<div class="alert alert-info alert-dismissable">
					<button type="button" class="close" data-dismiss="alert">&times;</button>${message}</div>
			</div>
		</div>
	</c:if>

	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-6 offset-md-3">

					<div class="card">
						<div class="card-block m-2">
							<h3 class="text-center">Product Management</h3>
							<hr>
							<sf:form class="needs-validation" modelAttribute="product"
								action="${contextRoot}/manage/products" method="POST"
								enctype="multipart/form-data">
								<div class="form-group">
									<label for="name">Enter Product Name</label>
									<sf:input type="text" class="form-control" path="name"
										id="name" title="Product Name" placeholder="Product Name" />
									<sf:errors path="name" cssClass="help-block" element="em" />
								</div>
								<div class="form-group">
									<label for="brand">Enter Brand Name</label>
									<sf:input type="text" class="form-control" path="brand"
										id="brand" title="Brand Name" placeholder="Brand Name" />
									<sf:errors path="brand" cssClass="help-block" element="em" />

								</div>
								<div class="form-group">
									<label for="description">Enter Product Description</label>
									<sf:textarea rows="4" path="description" id="description"
										class="form-control" title="Product Description"
										placeholder="Product Description"></sf:textarea>
									<sf:errors path="description" cssClass="help-block"
										element="em" />
								</div>
								<div class="form-group">
									<label for="unitPrice">Enter Unit Price</label>
									<sf:input type="number" class="form-control" path="unitPrice"
										id="unitPrice" title="Unit Price" placeholder="0" />
									<sf:errors path="unitPrice" cssClass="help-block" element="em" />
								</div>
								<div class="form-group">
									<label for="quantity">Enter Quantity Available</label>
									<sf:input type="number" class="form-control" path="quantity"
										id="quantity" title="Quantity Available" placeholder="0" />
								</div>
								<div class="form-group">
									<label for="file">Select an Image</label>
									<sf:input type="file" class="form-control" path="file"
										id="file" title="Select an Image for Product" />
									<sf:errors path="file" cssClass="help-block" element="em" />
								</div>
								<div class="form-group">
									<label for="categoryId">Select Category</label>
									<sf:select path="categoryId" items="${categories}"
										itemLabel="name" itemValue="id" class="form-control" />
								</div>

								<hr>
								<div class="form-group row">
									<div class="col-md-6">
										<button type="reset" class="btn btn-default btn-lg btn-block">Cancel</button>
									</div>
									<div class="col-md-6">
										<button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>
										<!-- hidden fields for product -->
										<sf:hidden path="id" />
										<sf:hidden path="code" />
										<sf:hidden path="supplierId" />
										<sf:hidden path="purchases" />
										<sf:hidden path="views" />
										<sf:hidden path="active" />
									</div>
								</div>
							</sf:form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class='col-12'>
			<h1>Available Products</h1>
			<hr />
		</div>

		<div class='col-12'>
			<div style="overflow: auto">
				<table id="adminProductsTable"
					class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>							
							<th>Qty. Avail</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Qty. Avail</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>