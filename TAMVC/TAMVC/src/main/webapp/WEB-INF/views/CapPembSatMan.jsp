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
		<script type="text/javascript">
		   function getIdKurikulum(){
		     var valKurikulum = $('#selectKurikulum').val();
		   }
		   function getIdSatMan(){
			     var valSatMan = $('#selectSatMan').val();
			}
		   function getCapPemb(){
			   $.ajax({
				   url : 'satuanmanajemen/view',
				   method : 'get',
				   ContentType : 'json',
				   data : {
					   valKurikulum : val,
					   valSatMan : val 
				   }
			   },
			   success : function(response){
				   var result="";
				   if(response!=null){
					   $(response).each(function(index, value){
						   result = result + '<tr><td>' + value + '</td><td>' + value + '</td></tr>';
					   });
					   $('#tabelCapPemb').html(options);
				   }
			   }));
		   }
		 </script>
		<title>Kelola Capaian Pembelajaran Satuan Manajemen</title>
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
							<p>Menu pengelolaan capaian pembelajaran untuk satuan manajemen akademik</p> 
							<!--<form role="form" id="formdetail" action="satuanmanajemen/view" method="post"> -->
							  <div class="form-group">
							  	 <label>Pilih Tahun Kurikulum</label>
							  	 <select class="form-control" id="selectKurikulum" name="idKurikulumTxt" required onchange="getIdKurikulum();">
							        <c:forEach items="${kurikulums}" var="kurikulum">
							        	<c:if test="${selectedKurikulum == kurikulum.idKurikulum}">
							        		<option selected="selected" value="${kurikulum.idKurikulum}">${kurikulum.thnMulai} - ${kurikulum.nmKurikulum }</option>
							        	</c:if>
							          	<c:if test="${selectedKurikulum != kurikulum.idKurikulum}">
							        		<option value="${kurikulum.idKurikulum}">${kurikulum.thnMulai} - ${kurikulum.nmKurikulum }</option>
							        	</c:if>
							        </c:forEach>
							      </select>
							      <label>Pilih Satuan Manajemen</label>
								  	 <select class="form-control" id="selectSatMan" name="idSatManTxt" onchange="getIdSatMan();">
								        <c:forEach items="${satmans}" var="satman">
								        	<c:if test="${selectedSatMan == satman.idSatMan}">
								        		<option selected="selected" value="${satman.idSatMan}">${satman.nmSatMan}</option>
								        	</c:if>
								          	<c:if test="${selectedSatMan != satman.idSatMan}">
								        		<option value="${satman.idSatMan}">${satman.nmSatMan}</option>
								        	</c:if>
								        </c:forEach>
								      </select><br />
									<button type="submit" class="btn btn-primary" onclick="getCapPemb">Tampilkan</button>
							  </div>
							<!--</form>-->
							<br /> 
						 <!-- <a href="satuanmanajemen/tambah/${kurikulumObj.idKurikulum }/${satManObj.idSatMan}" class="btn btn-success">Tambah Capaian Belajar</a>-->
							<table id="tabelCapPemb" class="table table-striped table-hovertable table-striped table-bordered table-hover table-checkable table-colvis datatable">
							  <thead>
							    <tr>
								    <td>
										<div class="checkbox">
											<input type="checkbox" id="flat-checkbox-1">
										</div>
									</td>
									  <td>Tahun Kurikulum</td>
									  <td>Nama Satuan Manajemen</td>
								      <td>Nama Capaian Pembelajaran</td>
								      <td>Deskripsi Capaian Pembelajaran</td>
								      <td>Aksi</td>
							    </tr>
							  </thead>
							   <tbody>	
								  <c:forEach items="${cappembs}" var="capPembObj">
								    <tr>
								      <td>
										<div class="checkbox">
											<input type="checkbox" id="flat-checkbox-1">
										</div>
									  </td>
									  <td>${capPembObj.kurikulum.nmKurikulum}</td>
									  <td>${capPembObj.satMan.nmSatMan}</td>
									  <td>${capPembObj.nmCapPemb}</td>
									  <td>${capPembObj.deskripsiCapPemb}</td>
									  <td>
						      			<a href="ubah/${capPembObj.idCapPemb}" class="btn btn-warning">Ubah</a>
									  </td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>	
</html>