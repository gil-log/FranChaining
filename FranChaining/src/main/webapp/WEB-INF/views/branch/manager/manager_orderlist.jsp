<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
	
	<!-- Add Date Picker -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
		
			<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="manager_sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- 해당하는 page의 메뉴 highlight -->

		<script>
	//메뉴리스트 열기
	document.getElementById("collapse2").classList.toggle("show");
	document.getElementById("menu3").classList.toggle("active");
	//document.getElementById("item2").classList.toggle("active");
	
	</script>


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

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">발주 내역</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

									<thead>
										<tr>
											<th>발주 번호</th>
											<th>품목</th>
											<th>발주일</th>
											<th>납기일</th>
											<th>상태</th>
										</tr>
									</thead>
								</table>
							</div>
							
							<button class="btn btn-danger btn-icon-split" onclick="listRemove();">
								<span class="icon text-white-50"> <i class="fas fa-trash"></i>
								</span> <span class="text">발주 삭제</span>
							</button>

							<button class="btn btn-success btn-icon-split" onclick="listAccept();">
								<span class="icon text-white-50"> <i class="fas fa-check"></i>
								</span> <span class="text">승인 신청</span>
							</button>
							
							
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->



				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content" style="width: max-content;">
							<div class="modal-header"></div>
							<div class="modal-body">
							
							
							<%@include file="manager_orderpage.jsp"%>
								
								
								
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- End of Main Content -->

			<!-- 하단바 -->
			<%@include file="../../nav/footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


	<script type="text/javascript">
	
	$(document).ready(function() {
    	
		console.log("실행?");
		listtable();   
		
	});
    

	
    function listtable(){
    	
    	if ( $.fn.DataTable.isDataTable('#dataTable') ) {
    		  $('#dataTable').DataTable().destroy();
    		}
    	
   	 $('#dataTable').dataTable({
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
             "url":"orderlist",
             "type":"POST",
             "data": function (d) {
                 d.s_no = "0010";
             }
         },
         columns : [
             {
            	 data: "o_no",
            	 render: function(data, type, row, meta){             
                         data = '<a href="#" onclick="javascript:showpage('+ data +');">' + data + '</a>';
                     return data;
            	 }
            	 
             },
             {data: "s_name"},
             {data: "o_date"},
             {data: "o_deadline"},
             {data: "o_flag"}
             
         ],
         initComplete: function () {
             this.api().columns([4]).every( function () {
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

     });
    	
    }
    

    function showpage(data) {
		$('#myModal').modal();
    };
    
    
    </script>
    
    
    
    
    <!-- modal js -->
    
	<script type="text/javascript">

    
	function test(){
		console.log("modal 싫앵");
	}
	
	
    	
        var t = $('#orderdataTable').DataTable();
        t.clear().draw(false);
    	//orderlisttable();
    	
        //테이블 row 선택
        $('#orderdataTable tbody').on('click', 'tr', function() {
            $(this).toggleClass('selected');
        });
        $('#orderlistTable tbody').on('click', 'tr', function() {
        	
        	$('.selected').toggleClass('selected');
        	
            $(this).toggleClass('selected');
            var lt = $('#orderlistTable').DataTable();
            var dt = $('#orderdataTable').DataTable();
            
            
            dt.clear().draw(false);
            
            
            var this_row = lt.rows(this).data();
            $("#s_no").val(this_row[0].s_no);
            
            console.log("s_no : " + $("#s_no").val());
            
            dt.row.add([
            	
                "<input type='text' id='s_name' name='s_name' value="+this_row[0].s_name+" style='border:none; background-color:transparent;width:6rem'>",
                "<input type='number' id='s_size' name='s_size' value="+this_row[0].s_size+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='number' id='o_amount' name='o_amount' value="+this_row[0].o_amount+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='number' id='s_price' name='s_price' value="+this_row[0].s_price+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='number' id='s_cost' name='s_cost' value="+this_row[0].s_cost+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='text' id='s_origin' name='s_origin' value="+this_row[0].s_origin+" style='border:none; background-color:transparent;width:6rem;'>"
                
            ]).draw(false);
            
        });
     
        
        
        
        
        
        
        
        
    
    function orderlisttable(){
    	
    	if ( $.fn.DataTable.isDataTable('#orderlistTable') ) {
    		  $('#orderlistTable').DataTable().destroy();
    		}
    	
   	 $('#orderlistTable').dataTable({
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
             "url":"orderlist",
             "type":"POST",
             "data": function (d) {
                 d.s_no = "0010";
             }
         },
         columns : [
             {data: "s_name"},
             {data: "s_size"},
             {data: "o_amount"},
             {data: "s_price"},
             {data: "s_cost"},
             {data: "s_origin"}
         ],
         initComplete: function () {
             this.api().columns([5]).every( function () {
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

          
     });
    	
    }




	









	
	window.onload=function() {
		window.focus();
	}
	
    $('#datePicker1, #datePicker2').datepicker({
        format : "yyyy-mm-dd",
    });
    
    
        //도큐레디
        	//테이블 row 선택
            $('#orderdataTable tbody').on('click', 'tr', function() {
                $(this).toggleClass('selected');
            });
            $('#itemDel').click(function() {
                var t = $('#dataTable').DataTable();
                t.rows('.selected').remove().draw(false);
                
            });
            
    var t = $('#orderdataTable').DataTable();
   
    $('#itemAdd').on( 'click', function () {
        
        t.row.add( [
            "<select size='1' id='s_name' name='s_name'><option value='A'  selected>A</option><option value='B'>B</option><option value='C'>C</option><option value='D'>D</option></select>",
            "<input type='number' id='s_size' name='s_size' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='o_amount' name='o_amount' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='s_price' name='s_price' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='number' id='s_cost' name='s_cost' style='border:none; background-color:transparent;width:6rem;'>",
            "<input type='text' id='s_origin' name='s_origin' style='border:none; background-color:transparent;width:6rem;'>"
        ] ).draw( false );


        $('#itemDel').click(function() {
            var t = $('#orderdataTable').DataTable();
            t.rows('.selected').remove().draw(false);
            
        });
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


    $('#order_num').text(setNumber);

    function setNumber() {
    	var dt = new Date();
   	 
        var recentYear = dt.getFullYear() % 100;
        var recentMonth = dt.getMonth() + 1;
        var recentDay = dt.getDate();
     
        if(recentMonth < 10) recentMonth = "0" + recentMonth;
        if(recentDay < 10) recentDay = "0" + recentDay;

		var branchNum = 11;
        if (branchNum < 10) branchNum = "000" + branchNum;
        else if (branchNum < 100) branchNum = "00" + branchNum;
        else if (branchNum < 1000) branchNum = "0" + branchNum;
        return result = recentYear + recentMonth + recentDay + branchNum;
    }
    
    $('#today').text(getToday);

    function getToday() {
    	var dt = new Date();
   	 
        var recentYear = dt.getFullYear();
        var recentMonth = dt.getMonth() + 1;
        var recentDay = dt.getDate();
     
        if(recentMonth < 10) recentMonth = "0" + recentMonth;
        if(recentDay < 10) recentDay = "0" + recentDay;
     
        return result = recentYear + "-" + recentMonth + "-" + recentDay;
    }
    </script>
    
    
    
    


	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Add Date Picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
		
	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>