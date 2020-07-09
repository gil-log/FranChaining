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
	document.getElementById("item2").classList.toggle("active");
	
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
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">

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
											<td><a onclick="showpage();">200622-1</a></td>
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
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
				
				
				
				<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
				<div class="modal-content">
				<%@include file="manager_orderpage.jsp"%>
				
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
    function showpage() {
		$('#myModal').modal();
    };
    
    
    </script>


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