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
				 <%@include file="header.jsp" %>
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
					
					<p>Menambahkan matakuliah </p>
					<form role="form" id="formdetail" action="matakuliah/satuanmanajemen/aksi" method="get"> 
						<div class="form-group">
					      <label>Pilih Satuan Manajemen</label>
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
					