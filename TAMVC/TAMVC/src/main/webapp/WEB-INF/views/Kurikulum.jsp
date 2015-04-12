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
<title>Datatable</title>
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
    </head>
    
    <body> 
    	<h1>Menu Kurikulum</h1>
    	<a href="tambahkurikulum" class="btn btn-success">Tambah Kurikulum</a>
    	<form id="myObject" action="showKurikulum" method="get">
    	<table class="table table-striped table-hover ">
			  <thead>
			    <tr>
			      <th>Nama Kurikulum</th>
			      <th>Nama Satuan Manajemen</th>
			      <th>Tahun Mulai</th>
			      <th>Tahun Akhir</th>
			      <th>Status Kurikulum</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${kurikulums}" var="kurikulum">
			    <tr>
			      <td>${kurikulum.nmKurikulum}</td>
			      <td>${kurikulum.satMan.nmSatMan}</td>
			      <td>${kurikulum.thnMulai}</td>
			      <td>${kurikulum.thnAkhir}</td>
			      <td>${kurikulum.aStatusKurikulum}</td>
			      <td><a href="ubahkurikulum/${kurikulum.idKurikulum}" class="btn btn-success">Ubah</a></td>
			      <td><a href="ubahkurikulum/${kurikulum.idKurikulum}" class="btn btn-danger">Non-Aktif</a></td>
			    </tr>
			    </c:forEach>
			  </tbody>
		</table>
		</form>
	</body>
</html>
