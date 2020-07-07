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
 
    <style>
        .dataTables_length {
            display:none;
        }
        .dataTables_filter {
            display:none;
        }
        .dataTables_info {
            display:none;
        }
        #dataTable_paginate {
            display: none;
        }
    </style>
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
              <h6 class="m-0 font-weight-bold text-primary">온라인 발주신청서</h6>
            </div>
            <div class="card-body">
                
                <div class="card mb-4" style="display:inline-block; float:left;">
                <div class="card-header">
                  수급인
                </div>
                <div class="card-body">
                    <table class="table">
                        <tbody>
                            <tr>
                            <td>발주번호</td>
                            <td><input type="text" style="border:none; background-color:transparent;width:10rem"></td>
                                <td>창고명</td>
                                <td><input type="text" style="border:none; background-color:transparent;width:10rem"></td>
                            </tr>
                            <tr>
                            <td>신청일</td>
                            <td><input type="date" id="currentDate" style="border:none; background-color:transparent;width:10rem"></td>
                                <td>납기일</td>
                                <td><input type="date" id="currentDate" style="border:none; background-color:transparent; width:10rem" ></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
              </div>
                
                <div class="card mb-4" style="display:inline-block; float:right; ">
                <div class="card-header">
                  발주자
                </div>
                <div class="card-body">
                    <table class="table">
                        <tbody>
                            <tr>
                            <td>발주담당</td>
                            <td>점주</td>
                                <td>TEL</td>
                                <td>${branch.b_phone1}-${branch.b_phone2}-${branch.b_phone3}</td>
                            </tr>
                            <tr>
                            <td>지점번호</td>
                            <td>${userinfo.b_no}</td>
                                <td>지점명</td>
                                <td>${branch.b_name}</td>
                            </tr>
                        </tbody>
                    </table>
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
                    	
                    
                    </tbody>
                </table>
                 
              </div>
                
                 <button class="btn btn-primary btn-icon-split" id="itemAdd" onclick="myfunc();">
                    <span class="icon text-white-50">
                      <i class="fas fa-plus"></i>
                    </span>
                    <span class="text">항목 추가</span>
                  </button>
                
                <button class="btn btn-success btn-icon-split" onclick="submit();">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                    <span class="text">작성 완료</span>
                </button>
            </div>
          </div>

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

    <!-- Add Date Picker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
     //발주 신청일 현재 날짜로 설정
    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
    //$('#datePicker1).datepicker({
    //    format : "yyyy-mm-dd",
    //});
        $(document).ready(function() {
    var t = $('#dataTable').DataTable();
   
    $('#itemAdd').on( 'click', function () {
        t.row.add( [
            "<td>${stockinfo.s_no}</td>",
            "<select size='1' id='name' name='name' style='border:none; background-color:transparent;width:6rem;'><option value='A'  selected>A</option><option value='B'>B</option><option value='C'>C</option><option value='D'>D</option></select>",
            "<input type='text' id='ea' name='ea' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='text' id='qu' name='qu' style='border:none; background-color:transparent;width:6rem;'>",
            "<td>${stockinfo.s_price}</td>",
            "<input type='text' id='price' name='supval' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='text' id='other' name='other' style='border:none; background-color:transparent;width:6rem;'>"
        ] ).draw( false );
    } );
    $('#itemAdd').click();
} );
        
    
    
        
    function submit() {
        alert('작성완료 -> 매니저에게 전달될 기능');
        
        var l = $('#dataTable tbody tr').length;
        
        //alert(ids);
        l *= 1;
        for(var i = 0; i < l; i++) {
            alert($("input[name=code]:eq(" + i + ")").val() + ", " + $("select[name=name]:eq(" + i + ")").val());
            
        }
        
        
    }

	
    
    </script>
</body>

</html>