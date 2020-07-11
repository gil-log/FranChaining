<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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

<style>
.dataTables_length {
	display: none;
}
.dataTables_filter {
	display: none;
}
.dataTables_info {
	display: none;
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
		<%@include file="manager_sidebar.jsp"%>
		<!-- End of Sidebar -->
		<!-- 해당하는 page의 메뉴 highlight -->

		<script>
	//메뉴리스트 열기
	document.getElementById("collapse2").classList.toggle("show");
	document.getElementById("menu2").classList.toggle("active");
	
	//메뉴 버튼 하이라이트
	//document.getElementById("menu2").classList.toggle("active");
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
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>

					<!-- DataTales Example -->
					<form name="ordersForm">
                    <input type ="hidden" value="" id="s_name" name="s_name">                      
                    </form> 
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">온라인수발주신청서</h6>
						</div>
						<div class="card-body">

							<div class="card mb-4"
								style="display: inline-block; float: left;">
								<div class="card-header">수급인</div>
								<div class="card-body">
									<table class="table">
										<tbody>
											<tr>
												<td>발주번호</td>
												<td><span id="order_num"></span></td>
												<td>창고명</td>
												<td><select id='supplier' name='supplier'><option value='0' selected>본사</option></select></td>
											</tr>
											<tr>
												<td>신청일</td>
												<td><span id="o_date"></span></td>
												<td>납기일</td>
												<td><input type="text" id="o_deadline"
													style="border: none; background-color: transparent; width: 6rem"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="card mb-4"
								style="display: inline-block; float: right;">
								<div class="card-header">발주자</div>
								<div class="card-body">
									<table class="table">
										<tbody>
											<tr>
												<td>발주담당</td>
												<td>점주</td>
												<td>TEL</td>
												<td>0${branch.b_phone1}-${branch.b_phone2}-${branch.b_phone3}</td>
											</tr>
											<tr>
												<td>지점번호</td>
												<td id="user_b_no">${userinfo.b_no}</td>
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
											<th>공급처</th>
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
											<th>공급처</th>											
										</tr>						
									</tfoot>
									<tbody>

									</tbody>
									
								</table>

							</div>
							
							<button class="btn btn-danger btn-icon-split" id="itemDel">
								<span class="icon text-white-50"> <i class="fas fa-trash"></i>
								</span> <span class="text">선택 행 삭제</span>
							</button>
							
							<button class="btn btn-primary btn-icon-split" id="itemAdd">
								<span class="icon text-white-50"> <i class="fas fa-plus"></i>
								</span> <span class="text">항목 추가</span>
							</button>

							<button class="btn btn-success btn-icon-split"
								onclick="submit();">
								<span class="icon text-white-50"> <i class="fas fa-check"></i>
								</span> <span class="text">작성 완료</span>
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
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

	<!-- Add Date Picker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript">
    $('#o_deadline').datepicker({
        format : "yyyy-mm-dd",
    });
    $(document).ready(function() {
    	
        	//테이블 row 선택
       		$('#dataTable tbody').on('click', 'tr', function() {
                $(this).toggleClass('selected');
            });
            $('#itemDel').click(function() {
                var t = $('#dataTable').DataTable();
                t.rows('.selected').remove().draw(false);
                
            });
             
            var t = $('#dataTable').DataTable(); 
             $('#itemAdd').on('click', function () {
                t.row.add( [
                    "<input type='text' id='s_no' name='s_no' onfocus='this.blur()' readonly>",
                    "<select size='1' id='s_name' name='s_name' ><option value=''></option><c:forEach var='s_name_info' items='${s_name_info}' varStatus='i'><option value='${s_name_info.s_name}'>${s_name_info.s_name}</option></c:forEach></select>",
                    "<input type='text' id='s_size' name='s_size' onfocus='this.blur()' readonly>",
                    "<input type='text' id='o_amount' name='o_amount'>",
                    "<input type='text' id='s_price' name='s_price' onfocus='this.blur()' readonly>",
                    "<input type='text' name='totalcost' onfocus='this.blur()' readonly>",
                    "<input type='text' id='s_origin' name='s_origin' onfocus='this.blur()' readonly>"
                ] ).draw( false );
            } );

    } ); 
  
	$(function(){
		$(document).on('change', 'select[name=s_name]', function(){
			var s_name = $(this).val();		
			var tr = $(this).parent().parent();
			var td = tr.children();
			
			 
			//var l = $(this).children().length;
			//alert(l);
			//var tags = JSON.stringify("${s_name_info}");
			//var j = JSON.parse(tags);
			
			/*
			$.post("getstockinfo", {"s_name": s_name}, function(result) {
				
					alert(result);
				
			});
			*/
			
	        $.ajax({
	            url : "order",                    // 전송 URL
	            type : 'PUT',                // GET or POST 방식
	            traditional : true,
	            datatype: "json",
	            data : {
	                s_name : s_name       // 보내고자 하는 data 변수 설정
	            },
	            
	            //Ajax 성공시 호출 
	            success : function(msg){
	    			td.eq(0).children().val(msg.s_no);
	    			td.eq(2).children().val(msg.s_size);
	    			td.eq(4).children().val(msg.s_price);
	    			td.eq(6).children().val(msg.s_origin);
	            },
	         
	            //Ajax 실패시 호출
	            error : function(jqXHR, textStatus, errorThrown){
	                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
	            }
	        });
			
			/*
			for(var i = 0; i < l; i++) {
				if($('select[name=name]').val() == '${s_name_info.get(i).s_name}')
				var s_no = '${s_name_info.get(i).s_no}';
			}
			*/
			//alert(s_no);
			
			});
		//수량*공급가
		$(document).on('change', 'input[name=o_amount]', function(){
			var o_amount = $(this).val();
			var tr = $(this).parent().parent();
			var td = tr.children();
			var s_price = td.eq(4).children().val();
			s_price *= 1;
			o_amount *= 1;
			td.eq(5).children().val(o_amount * s_price);
			
	});
	});

	
    function submit() {
        var l = $('#dataTable tbody tr').length;
        
        //alert(ids);
        l *= 1;
      

        l *= 1;
        var url = "order";    // Controller로 보내고자 하는 URL
        const sendVar = new Array(l);
        
        for(var i = 0; i < sendVar.length; i++){
        	sendVar[i] = new Array(6);
        }
        
        console.log("l 길이 : " + l + "sendVar 길이 : " + sendVar.length);
        
        for(var i = 0; i < l; i++) {

            if($("input[name=o_amount]:eq(" + i + ")"). val()=="") {
                alert($("select[name=s_name]:eq(" + i + ")").val() + "의 수량을 입력해주세요")
                }
            else if($('#o_deadline').val()=="") {
                alert("납기일을 입력해주세요")
                }
            else {
            alert($("input[name=s_no]:eq(" + i + ")").val() + ", " + $("select[name=s_name]:eq(" + i + ")").val());
        	sendVar[i][0] = $('#user_b_no').text();
        	sendVar[i][1] = $("input[name=s_no]:eq(" + i + ")"). val(); 
        	sendVar[i][2] = $("input[name=o_amount]:eq(" + i + ")").val();
        	sendVar[i][3] = $('#o_date').text();
        	sendVar[i][4] = $('#o_deadline').val();
            	}
        }
        $.ajax({
            url : url,                    // 전송 URL
            type : 'POST',                // GET or POST 방식
            traditional : true,
            data : {
                orders : sendVar        // 보내고자 하는 data 변수 설정
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
     	var branchNum = ${userinfo.b_no};
     	
        if(recentMonth < 10) recentMonth = "0" + recentMonth;
        if(recentDay < 10) recentDay = "0" + recentDay;
		
        if (branchNum < 10) branchNum = "000" + branchNum;
        else if (branchNum < 100) branchNum = "00" + branchNum;
        else if (branchNum < 1000) branchNum = "0" + branchNum ;
        return result = recentYear + recentMonth + recentDay + "-" + branchNum;
    }
    
    $('#o_date').text(getO_date);
    function getO_date() {
    	var dt = new Date();
   	 
        var recentYear = dt.getFullYear();
        var recentMonth = dt.getMonth() + 1;
        var recentDay = dt.getDate();
     
        if(recentMonth < 10) recentMonth = "0" + recentMonth;
        if(recentDay < 10) recentDay = "0" + recentDay;
     
        return result = recentYear + "-" + recentMonth + "-" + recentDay;
    }
    </script>
</body>

</html>