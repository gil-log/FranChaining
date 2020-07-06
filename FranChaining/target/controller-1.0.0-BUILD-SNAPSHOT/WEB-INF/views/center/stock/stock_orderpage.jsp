<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <%@include file="stock_sidebar.jsp"%>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
           <%@include file="../../nav/topbar.jsp"%>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">온라인수발주신청서</h6>
            </div>
            <div class="card-body">
                
                <div class="card mb-4" style="display:inline-block; float:left;">
                <div class="card-header">
                  수급인
                </div>
                <div class="card-body">
                  발주번호: 200630-1-1<br>
                    납기일: 2020/07/02
                </div>
              </div>
                <div class="card mb-4" style="display:inline-block; float:right;">
                <div class="card-header">
                  발주자
                </div>
                <div class="card-body">
                    발주담당: 지점장 &emsp;
                    지점명: 고양화정점<br>
                    지점번호: 1 &emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    전화번호: 031-999-6642<br>
                </div>
              </div>
               
                <br>
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>품목코드</th>
                      <th>품목명</th>
                      <th>규격</th>
                      <th>수량</th>
                      <th>공급가</th>
                      <th>금액</th>
                      <th>비고</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>품목코드</th>
                      <th>품목명</th>
                      <th>규격</th>
                      <th>수량</th>
                      <th>공급가</th>
                      <th>금액</th>
                      <th>비고</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>10001</td>
                      <td>A</td>
                      <td>10</td>
                      <td>60</td>
                      <td>3,000KRW</td>
                      <td>180,000KRW</td>
                    </tr>
                    <tr>
                      <td>10002</td>
                      <td>B</td>
                      <td>12</td>
                      <td>30</td>
                      <td>1,000KRW</td>
                      <td>30,000KRW</td>
                    </tr>
                    <tr>
                      <td>10003</td>
                      <td>C</td>
                      <td>100</td>
                      <td>70</td>
                      <td>250KRW</td>
                      <td>17,500KRW</td>
                    </tr>
                    <tr>
                      <td>10004</td>
                      <td>D</td>
                      <td>20</td>
                      <td>50</td>
                      <td>50,000KRW</td>
                      <td>1,000,000KRW</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
         <%@include file="../../nav/footer.jsp"%>
      <!-- End of Footer -->

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
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>