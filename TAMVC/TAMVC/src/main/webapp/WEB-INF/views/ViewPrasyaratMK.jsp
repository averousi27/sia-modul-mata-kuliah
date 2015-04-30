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
			var context_path = "${pageContext.servletContext.contextPath}/";
		</script>
		<title>Kelola Prasyarat Mata Kuliah</title>
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
			<link href="${pageContext.servletContext.contextPath}/resources/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css" />
			<script src="${pageContext.servletContext.contextPath}/resources/gritter/js/jquery.gritter.js" rel="stylesheet" type="text/javascript"></script>
			<script src="${pageContext.servletContext.contextPath}/resources/jquery-validation/jquery.validate.min.js" rel="stylesheet" type="text/javascript"></script>
			<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.blockui.js" type="text/javascript" ></script>
			<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.masterpage.sia.js" type="text/javascript" ></script>
		
				<div class="row" id="masterpage">
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
							
							<p>Tabel menampilkan prasyarat mata kuliah</p>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Status Aktif</label>
										<select id="filter" name="filter">
											<option value="">Aktif</option>
											<option value="true">Semua</option>
										</select>
									</div>
								</div>
								<div class="col-md-8 masteractions">
									<div class="btn-action pull-right"> </div>
								</div> 
							</div>
							<form class="tableform">
								<table class="table table-striped table-bordered table-hover table-checkable table-colvis datatable">
									<thead>
										<tr>
											<td>
												<div class="checkbox">
													<input class="checkbox-all" type="checkbox" id="flat-checkbox-1">
												</div>
											</td> 
											<td>Kode MK</td> 
											<td>Nama MK</td> 
											<td>Kode Prasyarat MK</td> 
											<td>Nama Prasyarat MK</td> 
											<td>Status hapus</td>
											<td>Aksi</td>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="row" id="master-detail" style="display:none;">
					<div class="container">
						<div class="col-md-6" style="margin-bottom:10px;">
							<h4 id="title">Prasyarat Mata Kuliah</h4>
							<form:form role="form" action="login" commandName="rumpunMK" class="formdetail">
								<div class="form-group">
									<label>Kode dan Nama Mata Kuliah</label>
									<select id="idMK" name="idMK" class="form-control">
											<option value="">Pilih kode dan nama mata kuliah</option> 
										<c:forEach items="${mkList}" var="mk"> 
											<option value="${mk.idMK}}">${mk.kodeMK} - ${mk.nmMK}</option>
										</c:forEach> 
									<select>
								</div> 
								<div class="form-group">
									<label>Kode dan Nama Mata Kuliah Prasyarat</label>
									<select id="mkIdMK" name="mkIdMK" class="form-control">
											<option value="">Pilih kode dan nama mata kuliah prasyarat</option> 
											
										<c:forEach items="${mkList}" var="mk"> 
											<option value="${mk.idMK}}">${mk.kodeMK} - ${mk.nmMK}</option>
										</c:forEach>  
									<form:hidden path="idPrasyaratMK" class="form-control" />
									<select>
								</div>
								<div class="form-group detailcontrol">
								</div>
					        </form:form>
						</div>
					</div>
				</div> 
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script>
					$(document).ready(function(){
						$('#masterpage').masterPage(
						{
							detailFocusId: '#idRumpunMK',
							dataUrl: context_path+'matakuliah/rumpun/json',
							detailUrl: context_path+'matakuliah/rumpun/edit',
							addUrl: context_path+'matakuliah/rumpun/simpan',
							editUrl: context_path+'matakuliah/rumpun/simpan',
							deleteUrl: context_path+'matakuliah/rumpun/deletemany',
							primaryKey: 'idRumpunMK',
					        order: [[1,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<div class="checkbox-data"><input type="checkbox" name="idRumpunMK[]" value="'+data+'"></div>';
									}
								},
								/* Nama rumpun mata kuliah */
								{ "bVisible":    true }, 
								/*status kurikulum*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[2] == 'true') return "Aktif";
										else return "Non Aktif";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[2]=='true') action += ' <button type="button" class="btn btn-danger deleterow">Non-Aktif</button>'
										return action;
									}
								}
							],
							validationRules: {idKurikulum:{required: false},nmRumpunMK:{required: true}},
							filters: [{id:'#filter', name:'aStatusRumpunMK'}],
							callOnFillForm : function(response,options){ 
								$("#idRumpunMK").val(response.data.idRumpunMK);
							}
						});
					});
				</script>
				<!-- akhir script custom pada halaman -->
				
				<!-- akhir dari content content -->
				
				<!-- footer -->
				<%@include file="footer.jsp" %>
			</div>
		</div> 
	</body>
</html>
		