<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
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
	<!-- 사이드바 -->
	<%@include file="master_sidebar.jsp"%>	
	
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
    	
      <!-- Main Content -->
      <div id="content">

        <%@include file="../../nav/topbar.jsp"%>

        <!-- Begin Page Content -->
        <div class="container-fluid">
        
         <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>
        
		<!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">발주 신청 목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive"> 
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>지점번호</th>
                      <th>품목번호</th>
                      <th>수량</th>
                      <th>신청날짜</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach items="${list}" var="list">
<c:set var="b_no" value="${list.b_no}"/>
<c:set var="s_no" value="${list.s_no}"/>
<c:set var="o_amount" value="${list.o_amount}"/>
<c:set var="o_date" value="${list.o_date}"/>
                 
                    <tr>
                    <td><c:out value="${list.b_no}"/></td>
                      <td><c:out value="${list.s_no}"/></td>
                      <td><c:out value="${list.o_amount}"/></td>
                      <td><c:out value="${list.o_date}"/></td>
                      </tr>
                  
                  </c:forEach>
                   
                  </tbody>
                 </table>
                 
                 
         
<!--           DataTales Example
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    
                  <thead>
                    <tr>
                      <th>발주 번호</th>
                      <th>품목</th>
                      <th>창고명</th>
                      <th>납기일</th>
                      <th>상태</th>
                      <th>수정/삭제</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>발주 번호</th>
                      <th>품목</th>
                      <th>창고명</th>
                      <th>납기일</th>
                      <th>상태</th>
                      <th>수정/삭제</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                        <td><a href="manager_orderpage.html">200530-1</a></td>
                      <td>A, B, C, D</td>
                      <td>본사</td>
                      <td>2020/07/09</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><a href="manager_orderpage.html">200530-1</a></td>
                      <td>B, C, D, E</td>
                      <td>본사</td>
                      <td>2020/07/09</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                    <tr>
                        <td><a href="manager_orderpage.html">200530-1</a></td>
                      <td>C, D</td>
                      <td>본사</td>
                      <td>2020/07/16</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><a href="manager_orderpage.html">200610-1</a></td>
                      <td>D, E, F</td>
                      <td>본사</td>
                      <td>2020/07/16</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                      <tr>
                        <td><a href="manager_orderpage.html">200611-1</a></td>
                      <td>A, C</td>
                      <td>본사</td>
                      <td>2020/07/09</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><a href="manager_orderpage.html">200615-1</a></td>
                      <td>B, F</td>
                      <td>본사</td>
                      <td>2020/07/09</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                    <tr>
                        <td><a href="manager_orderpage.html">200622-1</a></td>
                      <td>C, D, E, F</td>
                      <td>본사</td>
                      <td>2020/07/16</td>
                      <td style="color: limegreen">승인</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><a href="manager_orderpage.html">200624-1</a></td>
                      <td>D, E</td>
                      <td>본사</td>
                      <td>2020/07/16</td>
                      <td style="color: purple">거부됨</td>
                      <td></td>
                    </tr>
                      <tr>
                      <td><a href="manager_orderpage.html">200630-1</a></td>
                      <td>A, B</td>
                      <td>본사</td>
                      <td>2020/07/09</td>
                      <td style="color: dimgray">대기</td>
                      <td><a href="#">수정</a>/<a href="#">삭제</a></td>
                    </tr>
                    <tr>
                      <td><a href="manager_orderpage.html">200630-1</a></td>
                      <td>B, C, F</td>
                      <td>본사</td>
                      <td>2020/07/09</td>
                      <td style="color: orangered">심사중</td>
                      <td></td>
                    </tr>
                    <tr>
                        <td><a href="manager_orderpage.html">200701-1</a></td>
                      <td>C, D</td>
                      <td>본사</td>
                      <td>2020/07/16</td>
                      <td style="color: orangered">심사중</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td><a href="manager_orderpage.html">200701-1</a></td>
                      <td>D</td>
                      <td>본사</td>
                      <td>2020/07/16</td>
                      <td style="color: orangered">심사중</td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div> -->

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  

    
    

  <script>
    $(document).ready(function() {
    $('#dataTable').DataTable( {
         
        initComplete: function () {
            this.api().columns([2, 4]).every( function () {
                var column = this;
                var select = $('<select><option value=""></option></select>') 
                .appendTo($(column.header()))
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
        }      
        
    } );
} );
    
    
    </script> 
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