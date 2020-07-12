<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="master_sidebar.jsp"%>
		<script>
		document.getElementById("collapse3").classList.toggle("show");
		document.getElementById("menu5").classList.toggle("active");
	</script>
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

					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
								<div class="col-lg-7">
									<div class="p-5">
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-4">Manager Registration</h1>
										</div>
										<form class="user">
											<div class="form-group row">
												<input type="text" class="form-control form-control-user"
													placeholder="기본 정보:" readonly onfocus="this.blur();"
													style="background-color: transparent; border-color: transparent;">
												<div class="col-sm-4 mb-3 mb-sm-0">
													<input type="text" class="form-control form-control-user"
														name="Name" placeholder="이름">
												</div>
												<div class="col-sm-4 mb-3 mb-sm-0">
													<input type="text" class="form-control form-control-user"
														name="BranchNo" value='${branch.b_name}' readonly
														style="background-color: transparent;">
												</div>
												<div class="col-sm-4 mb-3 mb-sm-0">
													<input type="date" class="form-control form-control-user"
														name="HireDate" placeholder="근무시작예정일">
												</div>
											</div>

											<div class="form-group row">

												<input type="text" class="form-control form-control-user"
													placeholder="전화번호:" readonly onfocus="this.blur();"
													style="background-color: transparent; border-color: transparent;">

												<div class="col-sm-3 mb-3 mb-sm-0">
													<input type="number" class="form-control form-control-user"
														name="Phone1" placeholder="000">
												</div>
												<span style="padding-top: 10px;">ㅡ</span>
												<div class="col-sm-3 mb-3 mb-sm-0">
													<input type="number" class="form-control form-control-user"
														name="Phone2" placeholder="0000">
												</div>
												<span style="padding-top: 10px;">ㅡ</span>
												<div class="col-sm-3">
													<input type="number" class="form-control form-control-user"
														name="Phone3" placeholder="0000">
												</div>
											</div>


											<hr>
											<div style="text-align: right;">
												<button class="btn btn-success btn-icon-split" id="submit">
													<span class="icon text-white-50"> <i
														class="fas fa-check"></i>
													</span> <span class="text">등록</span>
												</button>
												<button class="btn btn-danger btn-icon-split" id="removeall">
													<span class="icon text-white-50"> <i
														class="fas fa-trash"></i>
													</span> <span class="text">지우기</span>
												</button>
											</div>

										</form>
										<hr>
									</div>
								</div>
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
	<!-- Add Date Picker -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript">
        $('#HireDate').datepicker({
            format: "yyyy-mm-dd",
        });

        $('#submit').click(function() {
        	alert("submit..");
        	
        	var e_name = $('input[name=Name]').val();
        	var hire = $('input[name=HireDate]').val();
        	var p1 = $('input[name=Phone1]').val();
        	var p2 = $('input[name=Phone2]').val();
        	var p3 = $('input[name=Phone3]').val();
            	
			//기입한 정보를 db에 저장
			if(e_name == "") {
				alert("이름을 입력해주세요.");
				return false;
				}
			else if(hire == "") {
				alert("근무 시작 예정일을 입력해주세요.");
				return false;
				}
			
			else if(p1 == "" || p2 == "" || p3 == "") {
				//전화번호 입력 안했을때
				alert("전화번호를 입력해주세요.");
				return false;
			}
			else {
				alert("이제 데이터베이스에 값을 저장하겠습니다.");
				alert(${branch.b_no});
			}
			
        });

        $('#removeall').click(function() {
        	alert("페이지를 초기화합니다");
        	
			//기입한 정보를 db에 저장
			$('input[name=Name]').val() = "";
			$('input[name=HireDate]').val() = "";
			
			$('input[name=Phone1]').val() == "";
			$('input[name=Phone2]').val() == "";
			$('input[name=Phone3]').val() == "";
			
        });
    </script>
</body>
</html>