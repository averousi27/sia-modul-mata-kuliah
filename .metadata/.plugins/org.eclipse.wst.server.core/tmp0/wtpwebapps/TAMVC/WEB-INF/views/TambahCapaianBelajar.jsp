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
		<title>Tambah Capaian Belajar</title>
	</head>
	<body style="background:url(${pageContext.servletContext.contextPath}/resources/img/wild_flowers.png) repeat 0 0">
		<div class="container">
			<div class="wrapper">
				 <%@include file="header.jsp" %> 
		
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
					
					<p>Menambahkan capaian belajar untuk satuan manajemen ${satManObj.nmSatMan} pada kurikulum ${kurikulumObj.thnAwal} - ${kurikulumObj.nmKurikulum } </p>
					<form role="form" id="formdetail" action="satuanmanajemen/tambah/aksi" method="post">  
							 <div class="form-group">
							      <label>Tahun Mulai - Nama Kurikulum</label> 
							        <input type="text" class="form-control" id="inputDefault" name="idKurikulumTxt" 
							        	placeholder="${kurikulumObj.thnAwal} - ${kurikulumObj.nmKurikulum}" value="${kurikulumObj.idKurikulum }" disabled>
							 </div>
							 <div class="form-group">
							      <label>Satuan Manajemen</label> 
							        <input type="text" class="form-control" id="inputDefault" name="idSatManTxt" 
							        	placeholder="${satManObj.nmSatMan}" value="${satManObj.idSatMan}" disabled>
							 </div>
							 <div class="form-group">
							      <label>Satuan Manajemen Induk</label>
							        <select class="form-control" id="select" name="idSatManTxt">
							        <option value="" >---Tidak Ada Satuan Manajemen---</option>
							        <c:forEach items="${satmans}" var="satman">
							        	<c:if test="${selectedSatMan == satman.idSatMan}">
							        		<option selected="selected" value="${satman.idSatMan}">${satman.nmSatMan}</option>
							        	</c:if>
							          	<c:if test="${selectedSatMan != satman.idSatMan}">
							        		<option value="${satman.idSatMan}">${satman.nmSatMan}</option>
							        	</c:if>
							        </c:forEach>
							        </select>
						     </div>
						     <p>Tabel capaian pembelajaran satuan manajemen induk yang dipilih</p>
						     <table class="table table-striped table-hovertable table-striped table-bordered table-hover table-checkable table-colvis datatable ">
								  <thead>
								    <tr>
									      <td>Nama Capaian Pembelajaran</td>
									      <td>Deskripsi Capaian Pembelajaran</td>
								    </tr>
								  </thead>
								  <tbody>
								  	<tr>
								  		<td> </td>
								  	</tr>
								  </tbody>
						     </table>
							    <div class="form-group">
							      <label>Nama Capaian Pembelajaran</label>
							        <input type="text" class="form-control" id="inputDefault" name="nmCapPembTxt" placeholder="Masukkan nama capaian pembelajaran"	required>
							    </div>
							    <div class="form-group">
							      <label>Deskripsi Capaian Pembelajaran</label> 
							      	<textarea class="form-control" rows="3" id=textArea" placeholder="Masukkan deskripci capaian pembelajaran"></textarea>
							        <!-- <input type="text" class="form-control" id="inputDefault" name="deskripsiCapPembTxt" placeholder="Masukkan deskripsi capaian pembelajaran"	required> -->
							    </div>
							    <div class="form-group"> 
							        <a type="reset" class="btn btn-default" href="kurikulum">Cancel</a>
							        <button type="submit" class="btn btn-primary">Submit</button>
							      
							    </div>  
						</form>
				</div>
			</div>
		</div>
			<script src="${pageContext.servletContext.contextPath}/resources/jquery-validation/jquery.validate.min.js" rel="stylesheet" type="text/javascript"></script>
			
		<!-- footer -->
		 <%@include file="footer.jsp" %>
			</div>
			</div>
			</body>
</html>