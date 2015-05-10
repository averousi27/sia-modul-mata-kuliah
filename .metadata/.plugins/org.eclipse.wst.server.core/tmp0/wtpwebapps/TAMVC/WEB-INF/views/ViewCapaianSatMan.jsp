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
		<title>Kelola Capaian Belajar Kurikulum</title>
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
							
							<p>Tabel menampilkan capaian pembelajaran</p>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Status Aktif</label>
										<select id="filter" name="filter">
											<option value="false">Aktif</option>
											<option value="">Semua</option>
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
											<td>Tahun Kurikulum</td>   
											<td>Nama Kurikulum</td> 
											<td>Nama Satuan Manajemen</td> 
											<td>Nama Capaian Induk</td>
											<td>Nama Capaian Utama</td> 
											<td>Deskripsi Capaian</td>
											<td>Status Hapus</td>
											<td>Aksi</td>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</form>
							<div class="row">
								<div class="col-md-8 masteractions">
									<div class="pull-right">  
										<button type="button" class="btn btn-primary btn-block" onclick="location.href='/modul/matakuliah/'">
											  Selanjutnya >>
										</button>
									</div>
									&nbsp;
									<div class="pull-right"> 
										<button type="button" class="btn btn-primary btn-block" onclick="location.href='/modul/kurikulum/'">
											 << Kembali
										</button>
									</div>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="master-detail" style="display:none;">
					<div class="container">
						<div class="col-md-6" style="margin-bottom:10px;">
							<h4 id="title">Capaian Belajar untuk Satuan Manajemen</h4>
							<form:form role="form" commandName="capPemb" class="formdetail"> 
								<div class="form-group">
									<label>Tahun Kurikulum</label>
									<select id="idKurikulum" name="idKurikulum" class="form-control">
											<option value="">Pilih tahun dan nama kurikulum</option> 
										<c:forEach items="${kurikulumList}" var="kurikulum"> 
											<option value="${kurikulum.idKurikulum}">${kurikulum.thnMulai} - ${kurikulum.namaKurikulum}</option>
										</c:forEach> 
									</select>
								</div> 
								<div class="form-group">
									<label>Nama Satuan Manajemen</label>
<!-- 									setelah dia milih satuan manajemen yang mana, di trace induknya siapa buat ngedapetin capaian belajar dari induknya -->
									<select id="idSatMan" name="idSatMan" class="form-control"> 
											<option value="">Pilih nama satuan manajemen</option> 
											<c:forEach items="${satManList}" var="satman"> 
												<option value="${satman.idSatMan}">${satman.nmSatMan }</option>
											</c:forEach> 
									</select>
								</div> 
								<div class="form-group">
									<label>Induk Capaian Pembelajaran</label> 
									<br />
									<button class="btn btn-primary" onclick="showModal()">Tambah induk capaian pembelajaran</button>
								</div> 
								 <div id="parentCapPemb"> 
								 	<input type="hidden" name="idIndukCapPemb[]" ></input>
								 </div> 
								<div class="form-group">
									<label>Nama Capaian Belajar</label>
									<form:input path="namaCapPemb" class="form-control" placeholder="Berisi nama capaian pembelajaran" required="true" />
									<form:hidden path="idCapPemb" class="form-control" />
								</div> 
								<div class="form-group">
									<label>Deskripsi Capaian Belajar</label>
									<form:input path="deskripsiCapPemb" class="form-control" placeholder="Berisi deskripsi capaian pembelajaran" />
								</div>
								
								<div class="form-group detailcontrol">
								</div>
					        </form:form>
						</div>
					</div>
				</div> 
				<div id="myModal" class="modal fade">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title">Induk Capaian Pembelajaran</h4>
				      </div>
				      <div class="modal-body">
				      	<div id="masterpageCapPemb" class ="col-md-12"> 
							<form class="tableform">
								<table class="table table-striped table-bordered table-hover table-checkable table-colvis datatable" style="width:100%">
									<thead>
										<tr>
											<td>
												#
											</td>
											<td>Tahun Kurikulum</td>
											<td>Nama Kurikulum</td>
											<td>Nama Satuan Manajemen</td>
											<td>Nama Capaian</td>
											<td>Deskripsi Capaian</td>  
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</form>
						</div>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
									
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script>
					var showModal;
					$(document).ready(function(){
						$('#masterpage').masterPage(
						{
							detailFocusId: '#idCapPemb',
							dataUrl: context_path+'capaianbelajar/satuanmanajemen/json',
							detailUrl: context_path+'capaianbelajar/satuanmanajemen/edit',
							addUrl: context_path+'capaianbelajar/satuanmanajemen/simpan',
							editUrl: context_path+'capaianbelajar/satuanmanajemen/simpan',
							deleteUrl: context_path+'capaianbelajar/satuanmanajemen/deletemany',
							primaryKey: 'idCapPemb',
					        order: [[3,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<div class="checkbox-data"><input type="checkbox" name="idCapPemb[]" value="'+data+'"></div>';
									}
								},
								/* tahun kurikulum */
								{ "bVisible":    false }, 
								/* nama kurikulum */
								{ "bVisible":    true }, 
								/* Nama satuan manajemen */
								{ "bVisible":    false }, 
								/* nama capaian induk */
								{ "bVisible":    true },
								/* nama capaian utama */
								{ "bVisible":    true },
								/* deskripsi capaian */
								{ "bVisible":    false },
								/*status hapus*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[7]=='false') return "Aktif";
										return "Terhapus";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[7]=='false') return action += ' <button type="button" class="btn btn-danger deleterow">Hapus</button>';
										return action;
									}
								}
							],
							validationRules: {idKurikulum:{required: true}, idSatMan:{required: true}, namaCapPemb:{required: true}},
							filters: [{id:'#filter', name:'statusHapusCapPemb'}],
							callOnFillForm : function(response,options){ 
								$("#idCapPemb").val(response.data.idCapPemb);
								$("#idKurikulum").val(response.data.kurikulum.idKurikulum);
								$("#idSatMan").val(response.data.satMan.idSatMan); 
							}
							
						});
						showModal = function (){
							$('#myModal').modal('show');
						}
						$('#myModal').on('shown.bs.modal', function (e) {
							$("#masterpageCapPemb").find('.dataTables_length select').change();
							  //if (!data) return e.preventDefault() // stops modal from being shown
						})
						$('#masterpageCapPemb').masterPage(
						{
							detailFocusId: '#idIndukCapPemb',
							dataUrl: context_path+'capaianbelajar/satuanmanajemen/subcapaian/json',
							detailUrl: context_path+'capaianbelajar/satuanmanajemen/subcapaian/edit',
							primaryKey: 'idCapPemb',
					        order: [[3,"asc"]],
							editOnClick: false,
							dialogDetail: '',
							editOnClickRow: true,
							cols: [
								/* id capaian pembelajaran */
								{ 
									"bVisible":    true,
									bSortable: false,
									bSearchable: false,
									mRender: function(data,type,full){
										return '<button type="button" class="btn btn-primary">Pilih</button>';
									}
								},
								/* tahun kurikulum */
								{ "bVisible":    false },
								/* nama kurikulum  */
								{ "bVisible":    true },
								/* nama satuan manajemen */
								{ "bVisible":    false },
								/* nama capaian */
								{ "bVisible":    true }, 
								/* deskripsi */
								{ "bVisible":    false }, 
							],
							callOnSelect:function(aData, options){
// 								$("#parentCapPemb").html(aData[4]);  
								$("#parentCapPemb").html(
										"<div class='alert alert-warning alert-dismissable'>"
											+"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>"
											+"<p>"+aData[4]+"<p>"
										+"</div>" 
// 										+"<input type='hidden' name='idIndukCapPemb[]' value='"+ aData[0] +"' />"
										);
								$("#idIndukCapPemb[]").val(aData[0]);
								$('#myModal').modal('toggle');
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
		