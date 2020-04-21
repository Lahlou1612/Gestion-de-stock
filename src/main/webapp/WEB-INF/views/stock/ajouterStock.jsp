<%@ include file="/WEB-INF/views/includes/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>GLOBAL BUSINESS APPLICATION</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/css/adminlte.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- DataTables -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
<style type="text/css">
#hover:hover {
	color: white;
}
</style>


   
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

     
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/menu_top/menu_top.jsp"%>
		<%@ include file="/WEB-INF/views/menu_left/menu_left.jsp"%>
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>
								<fmt:message code="common.stock.gestion" />
							</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#"><fmt:message
											code="common.stock.gestion" /></a></li>
								<li class="breadcrumb-item active"><fmt:message
										code="common.ajouter.stock" /></li>
							</ol>
						</div>
					</div>
				</div>
			</section>
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">
							<fmt:message code="common.ajouter.stock" />
						</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" data-toggle="tooltip"
								title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<section class="content">
							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">
										
										<c:url value="/stock/enregistrer" var="enregisterStock" />
											<f:form modelAttribute="stock" action="${enregisterStock}" method="post" >
											<f:hidden path="idMvtStock"/>
												<div class="form-group">
													<label><fmt:message code="common.article" /></label> 
													<f:select path="article.idArticle" class="form-control" items="${articles}" itemLabel="designation" itemValue="idArticle"/>
												</div>
												
												<div class="form-group">
														<label><fmt:message code="common.stock.type" /></label> 
														<f:select path="typeMvt" class="form-control form-control-sm" id="typeMvt">
														<f:option value="-1"><fmt:message code="common.type.selectionner" /></f:option>
																<f:option value="Achat">Achat</f:option>
																<f:option value="Vente">Vente</f:option>
														</f:select>
													</div>
						
												<div class="form-group">
												<label><fmt:message code="common.stock.date" /></label> 
												 <f:input path="dateMvt" id="datepicker"  class="form-control" />
												</div>
												
												<div class="form-group">
													<label><fmt:message code="common.achat.ligne.quantite" /></label> 
													<f:input path="quantite" class="form-control form-control-sm" type="text" placeholder="Entrez la quantit�..." />
												</div>
											
												
													<button type="submit" class="btn btn-info" style="font-size: 14px !important;">
														<i class="fa fa-save"> <fmt:message code="common.enregistrer" /></i>
													</button>
													<a href="<c:url value="/stock/" />" class="btn btn-danger" style="font-size: 14px !important;"><i class="fa fa-times"> 
													<fmt:message code="common.annuler" /></i></a>
											</f:form>
											
										</div>
										
									</div>
								</div>
							</div>
						</section>
					</div>
			</section>
		</div>
		<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
		<aside class="control-sidebar control-sidebar-dark"></aside>
	</div>
	<script
		src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>

	<!-- DataTables -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/datatables/jquery.dataTables.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/javascript/article.js"></script>
	<!-- page script -->	

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
	
    	<script>
	$( function() {
		$( "#datepicker" ).datepicker({
            uiLibrary: 'bootstrap4'
        });
	} );
	</script>
</body>
</html>
