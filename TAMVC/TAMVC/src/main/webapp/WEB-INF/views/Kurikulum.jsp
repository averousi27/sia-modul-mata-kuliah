<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="shortcut icon" href="${pageContext.servletContext.contextPath}/resources/favicon_16.ico">
		<link rel="bookmark" href="${pageContext.servletContext.contextPath}/resources/favicon_16.ico">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/site.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/sia.css">
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/site.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js">
		</script>
			  <script src="assets/js/respond.min.js">
		</script>
		<![endif]-->
		<script>
			var context_path = "${pageContext.servletContext.contextPath}";
		</script>
		<title>Kelola Kurikulum</title>
	</head>
	<body style="background:url(${pageContext.servletContext.contextPath}/resources/img/wild_flowers.png) repeat 0 0">
		<div class="container">
			<div class="wrapper">
				 <%@include file="header.jsp" %>
			<!-- Content -->
			
			<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/jquery.datatables/media/css/jquery.dataTables.min.css">
			<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/jquery.datatables/media/js/jquery.dataTables.min.js"></script>
			<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/jquery.datatables/extensions/TableTools/css/dataTables.tableTools.min.css"> <!-- optional -->
			<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/jquery.datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
			<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/jquery.datatables/extensions/ColVis/css/dataTables.colVis.min.css"> <!-- optional -->
			<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/jquery.datatables/extensions/ColVis/js/dataTables.colVis.min.js"></script> <!-- optional -->
			
			<div class="row">
				<div class="container">
					<div class="col-md-12" style="margin-bottom:10px;">
						<ol class="breadcrumb">
							<li>
								<a href="#">Beranda</a>
							</li>
							<li>
								<a href="#">Kelola Kalender Akademik</a>
							</li>
							<li class="active">Kelola Tahun Ajaran</li>
						</ol>
						<p>Menu pengelolaan kurikulum (tambah dan ubah kurikulum)</p>
						<a href="kurikulum/tambah" class="btn btn-success">Tambah Kurikulum</a>
						<table class="table table-striped table-hovertable table-striped table-bordered table-hover table-checkable table-colvis datatable ">
							  <thead>
							    <tr>
								    <td>
										<div class="checkbox">
											<input type="checkbox" id="flat-checkbox-1">
										</div>
									</td>
								      <td>Nama Kurikulum</td>
								      <td>Nama Satuan Manajemen</td>
								      <td>Tahun Mulai</td>
								      <td>Tahun Akhir</td>
								      <td>Status Kurikulum</td>
								      <td>Aksi</td>
							    </tr>
							  </thead>
							  <tbody>	
								  <c:forEach items="${kurikulums}" var="kurikulum">
								    <tr>
								      <td>
										<div class="checkbox">
											<input type="checkbox" id="flat-checkbox-1">
										</div>
									  </td>
								      <td>${kurikulum.nmKurikulum}</td>
								      <td>${kurikulum.satMan.nmSatMan}</td>
								      <td>${kurikulum.thnMulai}</td>
								      <td>${kurikulum.thnAkhir}</td>
								      <c:if test="${kurikulum.aStatusKurikulum == 'true' }">
								      	<td>Aktif</td>
								      </c:if>
								      <c:if test="${kurikulum.aStatusKurikulum == 'false' }">
								      	<td>Non-Aktif</td>
								      </c:if>
									      <c:if test="${kurikulum.aStatusKurikulum == 'true'}">
									      		<td>
									      			<a href="kurikulum/ubah/${kurikulum.idKurikulum}" class="btn btn-warning">Ubah</a>
													<a href="kurikulum/ubah/hapus/${kurikulum.idKurikulum}" class="btn btn-danger">Hapus</a>
									      			
												</td>
									      </c:if>
									      <c:if test="${kurikulum.aStatusKurikulum == 'false' }">
									      		<td>
									      			<a href="kurikulum/ubah/${kurikulum.idKurikulum}" class="btn btn-warning">Ubah</a>
													<a href="kurikulum/ubah/aktif/${kurikulum.idKurikulum}" class="btn btn-primary">Aktifkan</a>
												</td>
									      </c:if>
								     </tr>
								    </c:forEach>
							  </tbody>
						</table>
					</div>
				</div>
			</div>
			<script>
				$('.datatable').dataTable({
					"sDom": "<'row'<'dataTables_header clearfix'<'col-md-3'<l>><'col-md-9'f<'pull-right'CT>>r>>t<'row-fluid'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
					tableTools: {
						"sSwfPath": context_path+"/resources/jquery.datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
					},
					"oColVis": {
						"buttonText": "Columns <i class='icon-angle-down'></i>",
						"iOverlayFade": 0,
						"aiExclude": [0]
					},
					"sScrollX": "100%",
					"aoColumns":[

									/* nama satuanmanajemen */
									{ "bVisible":    true },
						/* namakurikulum */
						{ 
							"bVisible":    true,
							bSortable: false,
							bSearchable: false
						},
						/* nama satuanmanajemen */
						{ "bVisible":    true },
						/* tahun mulai*/
						{ "bVisible":    true },
						/* tahun akhir*/
						{ "bVisible":    true },
						/* Status kurikulum */
						{ "bVisible":    true },
						/* Aksi */
						{ 
							"bVisible":    true,
							bSortable: false,
							bSearchable: false						
						}
					]
				});
			</script>
			<!-- akhir script custom pada halaman -->
			<!-- akhir dari content content -->
			
			<%@include file="footer.jsp" %>
			</div>
		</div>
	</body>
</html>
