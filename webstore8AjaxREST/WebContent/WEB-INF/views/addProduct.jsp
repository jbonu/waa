<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resource/js/cart.js"/>"></script>
<style type="text/css">@import url("<spring:url value="/resource/css/rest.css"/>");</style>
<title>Products</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Products</h1>
				<p>Add products</p>
			</div>
 			<div class="pull-right" style="padding-right:50px">
				<a href="?language=en" >English</a>|<a href="?language=nl" >Dutch</a>					
			</div>
			
		</div>
	</section>
	<section class="container">
		<form:form  modelAttribute="newProduct" class="form-horizontal" enctype="multipart/form-data">
			<fieldset>
				<legend>Add new product</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div"/>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="productId"><spring:message code="addProduct.form.productId.label"/></label>
					<div class="col-lg-10">
						<form:input id="productId" path="productId" type="text" class="form:input-large"/>
						<form:errors path="productId" cssClass="text-danger"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="name"><spring:message code="addProduct.form.name.label"/></label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type="text" class="form:input-large"/>
						<form:errors path="name" cssClass="text-danger"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="unitPrice"><spring:message code="addProduct.form.unitPrice.label"/></label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="unitPrice" path="unitPrice" type="text" class="form:input-large"/>
							<form:errors path="unitPrice" cssClass="text-danger"/>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="description"><spring:message code="addProduct.form.description.label"/></label>
					<div class="col-lg-10">
						<form:textarea id="description" path="description" rows = "2"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="description">
					checkbox1text</label>
					
					<div class="col-lg-10">
						<input type="checkbox" id="checkbox1"  onclick="oncheck1()" />
						<textarea id="checkbox1text" rows = "1"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="description">
					checkbox1text</label>
					
					<div class="col-lg-10">
						<input type="checkbox" id="checkbox2" onclick="oncheck2()" />
						<textarea id="checkbox2text" rows = "1"></textarea>
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="manufacturer">
					<spring:message code="addProduct.form.manufacturer.label"/></label>
					<div class="col-lg-10">
				 		 	<form:select id="manufacturer" path="manufacturer" onchange="getCategoriesAJAX('${manufacturer}')">
						    	<form:option value="dell">dell</form:option>
						    	<form:option value="google">google</form:option>
						    	<form:option value="amazon">amazon</form:option>
						    </form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="category"><spring:message code="addProduct.form.category.label"/></label>
					<div class="col-lg-10">
						<form:select id="category" path="category" class="form:input-large">
							<form:option value="-">-Please select-</form:option>
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="unitsInStock"><spring:message code="addProduct.form.unitsInStock.label"/></label>
					<div class="col-lg-10">
						<form:input id="unitsInStock" path="unitsInStock" type="text" class="form:input-large"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="condition"><spring:message code="addProduct.form.condition.label"/></label>
					<div class="col-lg-10">
						<form:radiobutton path="condition" value="New" />New 
						<form:radiobutton path="condition" value="Old" />Old 
						<form:radiobutton path="condition" value="Refurbished" />Refurbished
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="productImage"><spring:message code="addProduct.form.productImage.label"/></label>
					<div class="col-lg-10">
						<form:input id="productImage" path="productImage" type="file"
							class="form:input-large" />
					</div>
				</div>


				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary" value ="Add"/>
					</div>
				</div>
				
			</fieldset>
		</form:form>
	</section>
</body>
</html>
