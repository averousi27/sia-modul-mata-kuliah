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
		<title>Kelola Mata Kuliah</title>
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
							
							<p>Tabel menampilkan mata kuliah</p>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Status Aktif</label>
										<select id="filter" name="filter">
											<option value="true">Aktif</option>
											<option value="">Semua</option>
										</select>
									</div> 
								</div>
								<div class="col-md-8 masteractions">
									<div class="btn-action pull-right">  
									</div>
									
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
											<td>Tahun Kurikulum</td>
											<td>Nama Rumpun MK</td> 
											<td>Tingkat Pembelajaran</td> 
											<td>Jumlah SKS</td>   
											<td>Sifat MK</td>
											<td>Deskripsi MK</td>  
											<td>Status Aktif</td>
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
							<h4 id="title">Mata Kuliah</h4>
							<form:form role="form" action="login" commandName="mk" class="formdetail">
								<div class="form-group">
									<label>Kode Mata Kuliah</label>
									<form:input path="kodeMK" class="form-control" placeholder="Berisi kode mata kuliah" required="true" />
									<form:hidden path="idMK" class="form-control" />
								</div>
								<div class="form-group">
									<label>Nama Mata Kuliah</label>
									<form:input path="namaMK" class="form-control" placeholder="Berisi nama mata kuliah" required="true" /> 
								</div>
								<div class="form-group">
									<label>Tahun Kurikulum</label>
									<select id="idKurikulum" name="idKurikulum" class="form-control">
											<option value="">Pilih kurikulum untuk mata kuliah</option> 
										<c:forEach items="${kurikulumList}" var="kurikulum"> 
											<option value="${kurikulum.idKurikulum}">${kurikulum.thnMulai} - ${kurikulum.namaKurikulum}</option>
										</c:forEach> 
									</select>
								</div>
								<div class="form-group">
									<label>Nama Rumpun Mata Kuliah</label>
									<select id="idRumpunMK" name="idRumpunMK" class="form-control">
											<option value="">Pilih rumpun untuk mata kuliah</option> 
										<c:forEach items="${rumpunMKList}" var="rumpunMK"> 
											<option value="${rumpunMK.idRumpunMK}">${rumpunMK.namaRumpunMK }</option>
										</c:forEach> 
									</select>
								</div>
								<div class="form-group">
									<label>Tingkat Pembelajaran</label>
									<form:input path="tingkatPemb" class="form-control" placeholder="Berisi angka tingkat pembelajaran mata kuliah (semester)" required="true" digits="true"/>
								</div>
								<div class="form-group">
									<label>Jumlah SKS</label>
									<form:input path="jumlahSKS" class="form-control" placeholder="Berisi angka jumlah SKS mata kuliah" required="true" digits="true"/>
								</div>
								<div class="form-group">
									<label>Sifat Mata Kuliah</label>
									<select id="sifatMK" name="sifatMK" class="form-control" required="true">
											<option value="">Pilih sifat untuk mata kuliah</option>
											<option value="true">Wajib</option>
											<option value="false">Pilihan</option>
									</select>
								</div>
								<div class="form-group">
									<label>Deskripsi Mata Kuliah</label>
									<form:input path="deskripsiMK" class="form-control" placeholder="Berisi deskripsi mata kuliah"/>
								</div>
								<div class="form-group">
									<label>Status Keaktifan Mata Kuliah</label>
									<select id="statusMK" name="statusMK" class="form-control">
											<option value="">Pilih status keaktifan mata kuliah</option>
											<option value="true">Aktif</option>
											<option value="false">Non-aktif</option>
									</select>
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
							detailFocusId: '#idMK',
							dataUrl: context_path+'matakuliah/json',
							detailUrl: context_path+'matakuliah/edit',
							addUrl: context_path+'matakuliah/simpan',
							editUrl: context_path+'matakuliah/simpan',
							deleteUrl: context_path+'matakuliah/deletemany',
							primaryKey: 'idMK',
					        order: [[1,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<div class="checkbox-data"><input type="checkbox" name="idMK[]" value="'+data+'"></div>';
									}
								},
								/* kode mata kuliah */
								{ "bVisible":    true }, 
								/* nama mata kuliah */
								{ "bVisible":    true }, 
								/* tahun kurikulum */
								{ "bVisible":    true }, 
								/* nama rumpun mk */
								{ "bVisible":    true }	, 
								/* tingkat pembelajaran */
								{ "bVisible":    true }, 
								/* jumlah sks */
								{ "bVisible":    true }, 
								/* sifat MK */
								{ "bVisible":    true, 
									mRender: function(data,type,full){
										if(full[7] == 'true') return "Wajib";
										else return "Pilihan";
									}	
								}, 
								/* deskripsi MK */
								{ "bVisible":    true }, 
								/*status kurikulum*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[9] == 'true') return "Aktif";
										else return "Non-Aktif";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[9]=='true') action += ' <button type="button" class="btn btn-danger deleterow">Non-Aktif</button>'
										return action;
									}
								}
							],
							validationRules: {idMK:{required: false},kodeMK:{required: true}, idKurikulum:{required:true},
								namaMK:{required: true},tingkatPemb: {required:true, digits:true}, 
								jumlahSKS: {required: true, digits: true}, sifatMK: {required:true}, rumpunMK:{required:true}},
							filters: [{id:'#filter', name:'statusMK'}],
							callOnFillForm : function(response,options){ 
								$("#idMK").val(response.data.idMK);
								$("#idKurikulum").val(response.data.kurikulum.idKurikulum);
								$("#idRumpunMK").val(response.data.rumpunMK.idRumpunMK);
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
		