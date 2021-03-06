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
								<fmt:message code="common.fournisseur.commande" />
							</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#"><fmt:message code="common.fournisseur.commande" /></a></li>
								<li class="breadcrumb-item active"><fmt:message code="common.fournisseur.commande.list" /></li>
							</ol>
						</div>
					</div>
				</div>
			</section>
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">
							<button type="button" class="btn  btn-outline-primary btn-sm" style="margin-right: 5px;">
								<i class="fas fa-user-plus"></i> 
								<a href="<c:url value="/commandefournisseur/nouveau" />" id="hover"><fmt:message code="common.ajouter.commande" /></a>
							</button>
							<button type="button" class="btn  btn-outline-primary btn-sm" style="margin-right: 5px;">
								<i class="fa fa-upload"></i> 
								<a href="#" id="hover"> <fmt:message code="common.importer" /></a>
							</button>
							<button type="button" class="btn btn-outline-primary btn-sm" style="margin-right: 5px;">
								<i class="fas fa-download"></i> 
								<c:url value="/commandefournisseur/export/" var="export" />
								<a href="${export}" id="hover"> <fmt:message code="common.exporter" /></a>
							</button>
						</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<section class="content">
							<div class="row">
								<div class="col-12">
							
			
            
            	<div class="card">
              <div class="card-header" style="background-color: #bfdae0;">
                <h3 class="card-title"><fmt:message code="common.list.commande" /></h3>
              </div>
              <div class="card-body p-0">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <th><fmt:message code="common.fournisseur.commande.code" /></th>
                      <th><fmt:message code="common.fournisseur.commande.date" /></th>
                      <th><fmt:message code="common.fournisseur" /></th>
                      <th><fmt:message code="common.fournisseur.commande.total" /></th>
                      <th><fmt:message code="common.action" /></th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach items="${commandeFournisseur}" var="commandeFournisseur">
                  <tr>
                  		<td>${commandeFournisseur.getCode()}</td>
                  		<td>${commandeFournisseur.getDateCommande()}</td>
                  		<td>${commandeFournisseur.getFournisseur().getNom()}</td>
                  		<td>${commandeFournisseur.getTotalFournisseur()}</td>
                  		<td style="width: 250px !important;">
							<h3 class="card-title">
							
							<textArea id="json${commandeFournisseur.getIdCommandeFournisseur()}" style="display: none;">${commandeFournisseur.getLigneCommandeJson()}</textArea>
							<button type="button" class="btn btn-outline-primary btn-sm">
							<i class="fas fa-th-list"></i>
							<a href="javascript:void(0);" id="hover" onclick="updateDetailCommande(${commandeFournisseur.getIdCommandeFournisseur()});">
							<fmt:message code="common.list.detail" />
							</a>
							</button>
							
							<button type="button" class="btn btn-outline-primary btn-sm" style="margin-right: 5px;" data-toggle="modal"
									data-target="#suppressionModal${commandeFournisseur.getIdCommandeFournisseur()}" id="hover">
							<i class="fas fa-trash"></i><fmt:message code="common.supprimer" /></button>
							
							<!-- Modal validation de suppression-->
							<div class="modal fade" id="suppressionModal${commandeFournisseur.getIdCommandeFournisseur()}" tabindex="-1" role="dialog" 
							aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size: 14px !important;">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">
												<fmt:message code="common.confirmation" />
											</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span></button>
										</div>
											<div class="modal-body">
												<fmt:message code="common.confirmation.msg" /> ${commandeFournisseur.getIdCommandeFournisseur()} ??
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 13px !important;">
												<i class="fas fa-window-close"> <fmt:message code="common.annuler" /></i></button>
												<c:url value="/commandefournisseur/supprimer/${commandeFournisseur.getIdCommandeFournisseur()}" var="urlSupprimer" />
												<a href="${urlSupprimer}" class="btn btn-danger" style="font-size: 13px !important;">
												<i class="fas fa-trash"> <fmt:message code="common.confirmation.suppression" /></i></a>
											</div>
									</div>
								</div>
							</div>
						</h3>
					</td>
					</tr>
                  	 </c:forEach>
                  	 
                  </tbody>
                </table>
              </div>
            </div>
						
			<!-- D�tails Commande -->
			<div class="card">
              <div class="card-header" style="background-color: #bfdae0;">
                <h3 class="card-title"><fmt:message code="common.liste.detail.fournisseur" /></h3>
              </div>
              <div class="card-body p-0">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <th><fmt:message code="common.article" /></th>
                      <th><fmt:message code="common.qte" /></th>
                      <th><fmt:message code="common.article.prixTTC" /></th>
                      <th><fmt:message code="common.fournisseur.commande.total" /></th>
                    </tr>
                  </thead>
	                  <tbody id="detailCommande">
	                  </tbody>
                </table>
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
		src="<%=request.getContextPath()%>/resources/javascript/commandeFournisseur.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			$("#example1").DataTable();
		});
	</script>
</body>
</html>
