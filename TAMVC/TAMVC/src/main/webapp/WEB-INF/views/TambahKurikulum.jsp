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
		<title>Tambah Kurikulum</title>
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
		<link href="${pageContext.servletContext.contextPath}/resources/datepicker/bootstrap-datepicker-master/css/datepicker.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.servletContext.contextPath}/resources/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
	
		<link href="${pageContext.servletContext.contextPath}/resources/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css" />
		
		
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
					
					<p>Menambahkan kurikulum </p>
					<form role="form" id="formdetail" action="tambahkurikulum/aksi" method="post"> 
						  <div class="form-group">
						      <label>Nama Kurikulum</label>
						      <input type="text" class="form-control" id="inputDefault" name="nmKurikulumTxt" placeholder="Nama Kurikulum">
						    </div>
						    <div class="form-group">
						      <label>Satuan Manajemen</label>
						        <select class="form-control" id="select" name="idSatManTxt" required>
						        <c:forEach items="${satMans}" var="satman">
						        	<c:if test="${selectedSatMan == satman.idSatMan}">
						        		<option selected="selected" value="${satman.idSatMan}">${satman.nmSatMan}</option>
						        	</c:if>
						          	<c:if test="${selectedSatMan != satman.idSatMan}">
						        		<option value="${satman.idSatMan}">${satman.nmSatMan}</option>
						        	</c:if>
						        </c:forEach>
						        </select>
						     </div>
							 <div class="form-group">
							      <label>Tahun Mulai</label> 
							        <input type="text" class="form-control" id="inputDefault" name="tahunMulaiTxt" placeholder="Tahun Mulai Kurikulum">
							 </div>
							    <div class="form-group">
							      <label>Tahun Akhir</label>
							        <input type="text" class="form-control" id="inputDefault" name="tahunAkhirTxt" placeholder="Tahun Akhir Kurikulum"	>
							      
							    </div>
							    <div class="form-group">
							      <label>Status Kurikulum</label> 
							        <div class="radio">
							          <label>
							            <input type="radio" name="statusKurikulumOpt" id="optionsRadios1" value="1">
							           Aktif
							          </label>
							        </div>
							        <div class="radio">
							          <label>
							            <input type="radio" name="statusKurikulumOpt" id="optionsRadios1" value="0">
							           Non-Aktif
							          </label>
							        </div> 
							    </div>
							    <div class="form-group"> 
							        <a href="kurikulum" class="btn btn-default">Cancel</a>
							        <button type="submit" class="btn btn-primary">Submit</button>
							      
							    </div>  
						</form>
				</div>
			</div>
		</div>
			<script src="${pageContext.servletContext.contextPath}/resources/jquery-validation/jquery.validate.min.js" rel="stylesheet" type="text/javascript"></script>
			<script src="${pageContext.servletContext.contextPath}/resources/gritter/js/jquery.gritter.js" rel="stylesheet" type="text/javascript"></script>
			 <script src="${pageContext.servletContext.contextPath}/resources/ckeditor/ckeditor.js" type="text/javascript" ></script>
		<script src="${pageContext.servletContext.contextPath}/resources/ckeditor/adapters/jquery.js" type="text/javascript"></script>
		
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
