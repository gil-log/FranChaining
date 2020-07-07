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

  <title>재고관리-수량조정</title>

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
        
        input {
            border: none;
            background-color: transparent;
            width: 6rem;
            color: #858796;
       }

        select {
            border: none;
            background-color: transparent;
            width: 6rem;
            color: #858796;
        }
        .selected {
            background-color: gainsboro;
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

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">재고 수량 조정</h6>
            </div>
            <div class="card-body">

              <div class="table-responsive">
                <table class="table table-bordered" id="listTable" width="100%" cellspacing="0">
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
              

              
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>품목명</th>
                      <th>규격</th>
                      <th>원가</th>
                      <th>공급가</th>
                      <th>공급처</th>
                    </tr>
                  </thead>

                </table>
                 
              </div>
              
                  <div style="display:none;">
                    <input type="number" class="form-control form-control-user" id="s_no">                                      
                  </div>
                  
                 <button class="btn btn-info btn-icon-split" id="itemModulation" onclick="modulation();">
					<span class="icon text-white-50"> <i class="fas fa-info"></i>
					</span> <span class="text">수정</span>
				</button>                  
                  
                  <button class="btn btn-danger btn-icon-split" id="itemDel" onclick="remove();">
					<span class="icon text-white-50"> <i class="fas fa-trash"></i>
					</span> <span class="text">삭제</span>
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
    $(document).ready(function() {
    //테이블 row 선택
    $('#dataTable tbody').on('click', 'tr', function() {
        $(this).toggleClass('selected');
    });
    $('#listTable tbody').on('click', 'tr', function() {
    	
    	$('.selected').toggleClass('selected');
    	
        $(this).toggleClass('selected');

        var lt = $('#listTable').DataTable();
        var dt = $('#dataTable').DataTable();
        
        
        dt.clear().draw(false);
        
        
        var this_row = lt.rows(this).data();
        $("#s_no").val(this_row[0].s_no);
        
        console.log("s_no : " + $("#s_no").val());
        
        dt.row.add([
        	
            "<input type='text' id='s_name' name='s_name' value="+this_row[0].s_name+" style='border:none; background-color:transparent;width:6rem'>",
            "<input type='number' id='s_size' name='s_size' value="+this_row[0].s_size+" style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='s_cost' name='s_cost' value="+this_row[0].s_cost+" style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='s_price' name='s_price' value="+this_row[0].s_price+" style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='text' id='s_origin' name='s_origin' value="+this_row[0].s_origin+" style='border:none; background-color:transparent;width:6rem;'>"
            
        ]).draw(false);
        
    });

    });
    
    
    
    $('#datePicker1, #datePicker2').datepicker({
        format : "yyyy-mm-dd",
    });
    
    function listtable(){
    	
    	if ( $.fn.DataTable.isDataTable('#listTable') ) {
    		  $('#listTable').DataTable().destroy();
    		}
    	
   	 $('#listTable').dataTable({
         pageLength: 10,
         bPaginate: true,
         bLengthChange: true,
         lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
         bAutoWidth: false,
         processing: true,
         ordering: true,
         serverSide: false,
         searching: true,
         ajax : {
             "url":"stocklist",
             "type":"POST",
             "data": function (d) {
                 d.s_no = "0010";
             }
         },
         columns : [
             {data: "s_no"},
             {data: "s_name"},
             {data: "s_size"},
             {data: "s_cost"},
             {data: "s_price"},
             {data: "s_origin"}
         ]

     });
    	
    }
        $(document).ready(function() {

            var t = $('#dataTable').DataTable();
            t.clear().draw(false);
        	listtable();
        	
        	

    var t = $('#dataTable').DataTable();

} );
        

    function modulation() {
     
        var l = $('#dataTable tbody tr').length;
        
        l *= 1;

        var url = "modulation";    // Controller로 보내고자 하는 URL

        const sendVar = new Array(l);
        
        for(var i = 0; i < sendVar.length; i++){
        	sendVar[i] = new Array(6);
        }
        
        console.log("l 길이 : " + l + "sendVar 길이 : " + sendVar.length);
        
        for(var i = 0; i < l; i++) {
        	
        	sendVar[i][0] = $("input[name=s_name]:eq(" + i + ")").val();
        	sendVar[i][1] = $("input[name=s_size]:eq(" + i + ")").val();
        	sendVar[i][2] = $("input[name=s_cost]:eq(" + i + ")").val();
        	sendVar[i][3] = $("input[name=s_price]:eq(" + i + ")").val();
        	sendVar[i][4] = $("input[name=s_origin]:eq(" + i + ")").val();
        	sendVar[i][5] = $("#s_no").val();
 
        }

        $.ajax({
            url : url,                    // 전송 URL
            type : 'PUT',                // GET or POST 방식
            traditional : true,
            data : {
                stockmodul : sendVar        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(msg){
            	var t = $('#dataTable').DataTable();
            	t.rows().remove().draw(false);
                listtable();
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });

    }
    
    function remove() {
        
        var l = $('#dataTable tbody tr').length;
        
        l *= 1;

        var url = "modulation";    // Controller로 보내고자 하는 URL

        const sendVar = new Array(l);
        
        for(var i = 0; i < sendVar.length; i++){
        	sendVar[i] = new Array(6);
        }
        
        console.log("l 길이 : " + l + "sendVar 길이 : " + sendVar.length);
        
        for(var i = 0; i < l; i++) {
        	
        	sendVar[i][0] = $("input[name=s_name]:eq(" + i + ")").val();
        	sendVar[i][1] = $("input[name=s_size]:eq(" + i + ")").val();
        	sendVar[i][2] = $("input[name=s_cost]:eq(" + i + ")").val();
        	sendVar[i][3] = $("input[name=s_price]:eq(" + i + ")").val();
        	sendVar[i][4] = $("input[name=s_origin]:eq(" + i + ")").val();
        	sendVar[i][5] = $("#s_no").val();
 
        }

        $.ajax({
            url : url,                    // 전송 URL
            type : 'DELETE',                // GET or POST 방식
            traditional : true,
            data : {
                stockmodul : sendVar        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(msg){
            	var t = $('#dataTable').DataTable();
            	t.rows().remove().draw(false);
                listtable();
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