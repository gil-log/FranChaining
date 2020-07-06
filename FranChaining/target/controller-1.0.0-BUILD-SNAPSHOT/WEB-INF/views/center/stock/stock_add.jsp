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

  <title>재고관리-품목추가</title>

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  
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

              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>품목코드</th>
                      <th>품목명</th>
                      <th>규격</th>
                      <th>원가</th>
                      <th>공급가</th>
                      <th>공급처</th>
                    </tr>
                  </thead>
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

    <!-- Add Date Picker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
    $('#datePicker1, #datePicker2').datepicker({
        format : "yyyy-mm-dd",
    });
        $(document).ready(function() {
    var t = $('#dataTable').DataTable();
   
    $('#itemAdd').on( 'click', function () {
        t.row.add( [
            "<input type='text' id='s_no' name='s_no' readonly style='border:none; background-color:transparent;width:6rem'>",
            "<input type='text' id='s_name' name='s_name' style='border:none; background-color:transparent;width:6rem'>",
            "<input type='number' id='s_size' name='s_size' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='s_cost' name='s_cost' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='s_price' name='s_price' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='text' id='s_origin' name='s_origin' style='border:none; background-color:transparent;width:6rem;'>"
        ] ).draw( false );
    } );
    $('#itemAdd').click();
} );
        

    function submit() {
        alert('항목이 추가 되었습니다.');
        
        var l = $('#dataTable tbody tr').length;
        
        //alert(ids);
        l *= 1;
        for(var i = 0; i < l; i++) {
            alert($("input[name=s_name]:eq(" + i + ")").val() + ", " + 
            		$("input[name=s_size]:eq(" + i + ")").val() + ", " + 
            		$("input[name=s_cost]:eq(" + i + ")").val() + ", " + 
            		$("input[name=s_price]:eq(" + i + ")").val() + ", " + 
            		$("input[name=s_origin]:eq(" + i + ")").val());
            
        }
        
        
        var url = "add";    // Controller로 보내고자 하는 URL

        const sendVar = new Array(Array(), Array());
        
        for(var i = 0; i < l; i++) {
        	
        	sendVar[i][0] = $("input[name=s_name]:eq(" + i + ")").val();
        	sendVar[i][1] = $("input[name=s_size]:eq(" + i + ")").val();
        	sendVar[i][2] = $("input[name=s_cost]:eq(" + i + ")").val();
        	sendVar[i][3] = $("input[name=s_price]:eq(" + i + ")").val();
        	sendVar[i][4] = $("input[name=s_origin]:eq(" + i + ")").val();

        }

        var list = []; //ArrayList 값을 받을 변수를 선언
        
        $.ajax({
            url : url,                    // 전송 URL
            type : 'POST',                // GET or POST 방식
            traditional : true,
            data : {
                sendMsg : sendVar        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(stockVO){
            	list = stockVO;
                $.each(list, function( index, value ) {
                    console.log( index + " : " + list.s_name ); //Book.java 의 변수명을 써주면 된다.
                 });
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });

        
        
    }
    
    
    </script>
</body>

</html>