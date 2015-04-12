<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Tambah Kurikulum</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css"/>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css"/>
    </head>
    
    <body> 
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">Brand</a>
		    </div>
		
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
		          </ul>
		        </li>
		      </ul>
		      <form class="navbar-form navbar-left" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">Link</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<h1>Tambah Kurikulum</h1>
    	<form class="form-horizontal" action="tambahkurikulum/aksi" method="post">
		  <fieldset>
		  <div class="form-group">
		      <label for="inputEmail" class="col-lg-2 control-label">Nama Kurikulum</label>
		      <div class="col-lg-10">
		        <input type="text" class="form-control" id="inputDefault" name="nmKurikulumTxt">
		      </div>
		    </div>
		    <div class="form-group">
		      <label for="select" class="col-lg-2 control-label">Satuan Manajemen</label>
		      <div class="col-lg-10">
		        <select class="form-control" id="select" name="idSatManTxt">
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
		    </div>
		    <div class="form-group">
		      <label for="inputEmail" class="col-lg-2 control-label">Tahun Mulai</label>
		      <div class="col-lg-10">
		        <input type="text" class="form-control" id="inputDefault" name="tahunMulaiTxt">
		      </div>
		    </div>
		    <div class="form-group">
		      <label for="inputEmail" class="col-lg-2 control-label">Tahun Akhir</label>
		      <div class="col-lg-10">
		        <input type="text" class="form-control" id="inputDefault" name="tahunAkhirTxt">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="col-lg-2 control-label">Status Kurikulum</label>
		      <div class="col-lg-10">
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
		    </div>
		    <div class="form-group">
		      <div class="col-lg-10 col-lg-offset-2">
		        <button type="reset" class="btn btn-default" a href="kurikulum">Cancel</button>
		        <button type="submit" class="btn btn-primary">Submit</button>
		      </div>
		    </div>
		  </fieldset>
		</form>
	</body>
</html>
