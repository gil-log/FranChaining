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
					
                  <div style="display:none;">
                    <input type="number"id="nowO_no">
                  </div>
                  
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
							<div id="masterControlorderlist">
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
		/*//점장만 발주 삭제,승인기능, 발주 목록 눌렀을때 추가 삭제 수정 버튼 사용 가능
		if(${userinfo.p_no} != 1){
			$('#masterControlorderlist').hide();
			$('#masterControlorderpage').hide();
		}
		*/
		
		
		listtable();   
		
	    var t = $('#orderdataTable').DataTable();
	    
		   
	    $('#itemAdd').on( 'click', function () {
	        
	        t.row.add( [
	        	"<input type='number' id='s_no' name='s_no' style='border:none; background-color:transparent;width:6rem;'>",
	            "<select size='1' id='s_name' name='s_name' style='border:none; background-color:transparent;width:6rem;'><c:forEach var='s_name_info' items='${s_name_info}' varStatus='i'><option value='${s_name_info.s_name}'>${s_name_info.s_name}</option></c:forEach></select>",
	            "<input type='number' id='s_size' name='s_size' style='border:none; background-color:transparent;width:6rem;'>",
	            "<input type='number' id='o_amount' name='o_amount' style='border:none; background-color:transparent;width:6rem;'>",
	            "<input type='number' id='s_price' name='s_price' style='border:none; background-color:transparent;width:6rem;'>",
	            "<input type='number' id='s_cost' name='s_cost' style='border:none; background-color:transparent;width:6rem;'>",
	            "<input type='text' id='s_origin' name='s_origin' style='border:none; background-color:transparent;width:6rem;'>"
	        ] ).draw( false );



	    } );

	    $('#itemDel').click(function() {
	        var t = $('#orderdataTable').DataTable();
	        t.rows('.selected').remove().draw(false);
	        
	    }); 
 
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
                         data = '<a href="#" onclick="javascript:showpage('+ data +');">' + setNumber(data) + '</a>';
                     return data;
            	 }
            	 
             },
             {data: "s_name"},
             {data: "o_date"},
             {data: "o_deadline"},
             {
            	 data: "o_flag",
            	 render: function(data, type, row, meta){
            		 if(data == 1){
            			 data = "대기중";
            			return data;
            		 } else if(data == 2){
            			 data = "심사중";
             			return data;
            		 } else if(data == 3){
            			 data = "거절됨";
             			return data;
            		 } else if(data == 4){
            			 data = "삭제됨";
              			return data;
             		 }
                     
        	 }
            	 }
             
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
                	 if(d==1){
                     select.append( '<option value="'+'대기중'+'">'+'대기중'+'</option>' )
                	 } else if(d==2){
                         select.append( '<option value="'+'심사중'+'">'+'심사중'+'</option>' )
                	 } else if(d==3){
                         select.append( '<option value="'+'거절됨'+'">'+'거절됨'+'</option>' )
                	 } else if(d==4){
                         select.append( '<option value="'+'삭제됨'+'">'+'삭제됨'+'</option>' )
                	 }
                 } );
             } );
         }

     });
   	 
     //테이블 row 선택
     $('#dataTable tbody').on('click', 'tr', function() {
    	$('.selected').toggleClass('selected');
        $(this).toggleClass('selected');
     });
    	
    }
    

    function showpage(data) {
    	
    	if ( $.fn.DataTable.isDataTable('#orderlistTable') ) {
    		  $('#orderlistTable').DataTable().destroy();
    		}
    	
    	if ( $.fn.DataTable.isDataTable('#orderdataTable') ) {
  		  $('#orderdataTable').DataTable().destroy();
  		}
    	
    	$("#nowO_no").val(data);

        $.ajax({     	
            url : 'showorder',                    // 전송 URL
            type : 'POST',                // GET or POST 방식
            traditional : true,
            data : {
                o_no : data        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(jsonArray){
		
            	orderlisttable(jsonArray);
            	
            	$('#order_num').text(setNumber(data));
            	$('#o_date').text(jsonArray[0].o_date);
            	$('#o_deadline').text(jsonArray[0].o_deadline);

            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
            
        });
  	
		$('#myModal').modal();
    };
    

    function orderlisttable(showlist){
    	
        var t = $('#orderdataTable').DataTable();
        t.clear().draw(false);
    	
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
         data: showlist,
         columns : [
        	 {data: "s_no"},
             {data: "s_name"},
             {data: "s_size"},
             {data: "o_amount"},
             {data: "s_price"},
             {
            	 data: "",
            	 render: function(data, type, row, meta){  
                     data = row.o_amount * row.s_price;
                 return data;
                 }
             },
             {data: "s_origin"}
         ]
     });   	
    }
    
    function listAccept(){
        var t = $('#dataTable').DataTable();
        var this_row = t.rows('.selected').data();
        
        var this_o_flag = this_row[0].o_flag;
        var this_o_no = this_row[0].o_no;

        if(this_o_flag == 1){
        	
        	
        	
            $.ajax({     	
                url : 'orderlist',                    // 전송 URL
                type : 'PUT',                // GET or POST 방식
                traditional : true,
                data : {
                    o_no : this_o_no        // 보내고자 하는 data 변수 설정
                },
                //Ajax 성공시 호출 
                success : function(msg){
                	alert(msg);
                	listtable();
                },
             
                //Ajax 실패시 호출
                error : function(jqXHR, textStatus, errorThrown){
                    console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
                }
                
            });
        	
        	
        } else if(this_o_flag == 2){
        	alert("이미 심사 중인 발주 입니다.");
        } else if(this_o_flag == 3){
        	alert("이미 거절된 발주 입니다.");
        } else if(this_o_flag == 4){
        	alert("이미 삭제된 발주 입니다.");
        }
        
        
    }
   
    </script>
    
    
    
    
    <!-- modal js -->
    
	<script type="text/javascript">

	
    	
        //var t = $('#orderdataTable').DataTable();
        //t.clear().draw(false);
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
            	"<input type='number' readonly id='s_no' name='s_no' value="+this_row[0].s_no+" style='border:none; background-color:transparent;width:6rem'>",
                "<input type='text' id='s_name' readonly name='s_name' value="+this_row[0].s_name+" style='border:none; background-color:transparent;width:6rem'>",
                "<input type='number' id='s_size' readonly name='s_size' value="+this_row[0].s_size+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='number' id='o_amount' name='o_amount' value="+this_row[0].o_amount+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='number' id='s_price' readonly name='s_price' value="+this_row[0].s_price+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='number' readonly value="+this_row[0].o_amount * this_row[0].s_price+" style='border:none; background-color:transparent;width:6rem;'>",
                "<input type='text' id='s_origin' readonly name='s_origin' value="+this_row[0].s_origin+" style='border:none; background-color:transparent;width:6rem;'>"
                
            ]).draw(false);
            
        });
    
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
      
            
     
        
        function modulation() {
            
            var l = $('#orderdataTable tbody tr').length;
            
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
            
            var l = $('#orderdataTable tbody tr').length;
            
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


    function setNumber(data) {
    	var dt = new Date();
   	 
        var recentYear = dt.getFullYear() % 100;
        var recentMonth = dt.getMonth() + 1;
        var recentDay = dt.getDate();
     
        if(recentMonth < 10) recentMonth = "0" + recentMonth;
        if(recentDay < 10) recentDay = "0" + recentDay;

		var branchNum = ${userinfo.b_no};
		
        if (branchNum < 10) branchNum = "000" + branchNum;
        else if (branchNum < 100) branchNum = "00" + branchNum;
        else if (branchNum < 1000) branchNum = "0" + branchNum;
        return result = recentYear + recentMonth + recentDay + '-' +branchNum + '-' +data;
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