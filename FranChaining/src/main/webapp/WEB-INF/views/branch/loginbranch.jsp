<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인</title>

<!-- Custom fonts for this template-->
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


</head>

<script type="text/javascript">


	$(document).ready(function(){
		$("#submit").on("click", function(){
			if($("sex").val()=="man"){
				alert("회원 정보를 확인 해주세요");
				$("#id").focus();
				return false;
			}
			    
		    window.alert("로그인에 성공 하였습니다!");
		    
			window.close();
		});
	})
</script>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">

							<c:if test="${type eq 'center'}">
								<div class="col-lg-6 d-none d-lg-block bg-center-image"></div>
							</c:if>

							<c:if test="${type eq 'branch'}">
								<div class="col-lg-6 d-none d-lg-block bg-branch-image"></div>
							</c:if>

							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">FranChaining!</h1>
									</div>

									<form class="user" action="loginbranch" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="id" name="id" placeholder="ID">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="pwd" name="pwd" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember Me</label>
											</div>
										</div>
										<button type="submit" id="submit" name="submit"
											class="btn btn-primary btn-user btn-block">Login</button>
									</form>

									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">비밀번호 찾기</a>
									</div>
									<div class="text-center">

										<c:if test="${type eq 'center'}">
											<a class="small" href="regcenter">-회원가입-</a>
										</c:if>
										<c:if test="${type eq 'branch'}">
											<a class="small" href="regbranch">-회원가입-</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

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

</body>

</html>