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
				<div class="row">
					<div class="col-md-12">
						<img class="img-responsive" src="${pageContext.servletContext.contextPath}/resources/img/logo.png"></img>
					</div>
				</div>
				<nav class="navbar navbar-default navbar-sia" role="navigation" style="background-color: #3bafda;border-radius:0;border-color:#3bafda;">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> 
								<span class="icon-bar"></span> 
								<span class="icon-bar"></span> 
								<span class="icon-bar"></span>
							</button> 
							<a class="navbar-brand" href="index.html">
								Beranda
							</a>
						</div>
						<div class="collapse navbar-collapse">
							<ul class="nav navbar-nav">
								<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Mata Kuliah <b class="caret">
								</b>
								</a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="#">Kelola Kurikulum</a>
										</li>
										<li class="dropdown-submenu">
											<a href="#">Kelola Capaian Pembelajaran</a>
											<ul class="dropdown-menu">
												<li><a href="#">Kelola Capaian Pembelajaran Kurikulum</a></li>
												<li><a href="#">Kelola Capaian Pembelajaran Satuan Manajemen</a></li>
												<li><a href="#">Kelola Capaian Pembelajaran Mata Kuliah</a></li>
											</ul>
										</li>
										<li class="dropdown-submenu">
											<a href="#">Kelola Mata Kuliah</a>
											<ul class="dropdown-menu">
												<li><a href="#">Kelola Mata Kuliah Prasyarat</a></li>
												<li><a href="#">Kelola Hubungan Mata Kuliah</a></li>
											</ul>
										</li>
										<li>
											<a href="#">Kelola Rencana Pembelajaran</a>
										</li>
										<li class="dropdown-submenu">
											<a href="#">Laporan</a>
											<ul class="dropdown-menu">
												<li><a href="#">Prasyarat Mata Kuliah</a></li>
												<li><a href="#">Kurikulum Tiap Periode</a></li>
												<li><a href="#"></a></li>
											</ul>
										</li>
									</ul>
								</li>	
							</ul>
							<ul  class="nav navbar-nav navbar-right">				
								<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Akun <b class="caret">
								</b>
								</a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="#">Profil</a>
										</li>
										<li>
											<a href="#">Pilih hak akses</a>
										</li>
										<li>
											<a href="#">Keluar</a>
										</li>
									</ul>
								</li>	
							</ul>
						</div>
					</div>
				</nav>
			<!-- akhir dari header -->
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
						<a href="tambahkurikulum" class="btn btn-success" action="tambahkurikulum">Tambah Kurikulum</a>
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
									      			<a href="ubahkurikulum/${kurikulum.idKurikulum}" class="btn btn-warning">Ubah</a>
													<a href="ubahkurikulum/hapus/${kurikulum.idKurikulum}" class="btn btn-danger">Hapus</a>
									      			
												</td>
									      </c:if>
									      <c:if test="${kurikulum.aStatusKurikulum == 'false' }">
									      		<td>
									      			<a href="ubahkurikulum/${kurikulum.idKurikulum}" class="btn btn-warning">Ubah</a>
													<a href="ubahkurikulum/aktif/${kurikulum.idKurikulum}" class="btn btn-primary">Aktifkan</a>
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
			
			<!-- footer -->
			<div class="site-footer">
					<div class="container">		
						<div class="copyright clearfix">
						<p>&copy; 2015 <b>SIA UNIVERSITAS X</b> | Powered By <a href="#" target="_blank">SE ITS</a></p>
						</div>
					</div>
			</div>
			</div>
		</div>
	</body>
</html>
