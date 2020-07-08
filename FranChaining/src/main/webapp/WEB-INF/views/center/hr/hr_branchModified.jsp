<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>

  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>지점관리</title>

<!-- Custom fonts for this template-->

  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">


</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">


			<%@include file="hr_sidebar.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

			<%@include file="../../nav/topbar.jsp"%>
		
        <!-- Begin Page Content -->
        <div class="container-fluid">
        
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">지점 목록</h1>
          <p class="mb-4"></p>
          
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">지점 목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>지점 번호</th>
                      <th>지점 이름</th>
                      <th>점장 이름</th>
                      <th>연락처</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach items="${branchlist}" var="branchlist">
                  
                    <tr>
                    <td><c:out value="${branchlist.b_no}"/></td>
                    <td><c:out value="${branchlist.b_name}"/></td>
                    <td><c:out value="${branchlist.e_name}"/></td>
                    <td><c:out value="${branchlist.addPhoneNum()}"/></td>
                  	</tr>
                  
                  </c:forEach>
                    
                  </tbody>
                </table>
                		<div class="col-lg-12" id="ex2_Result1" ></div> 
		<div class="col-lg-12" id="ex2_Result2" ></div>    
                    
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

		<%@include file="../../nav/footer.jsp"%>

		
    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->


  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
  </body>

</html>