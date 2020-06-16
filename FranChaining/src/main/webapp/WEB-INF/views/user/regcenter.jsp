<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html lang="en">

<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">



	<script type="text/javascript">

	
		$(document).ready(function(){

			$("#submit").on("click", function(){
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pwd").focus();
					return false;
				}
				if($("#e_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#e_name").focus();
					return false;
				}
				
				// 2.암호체크
			    // var pwd = document.RegisterForm.txt.Password;
			    var pwd = document.getElementById("pwd");
			    if (pwd.value.length < 3 || pwd.value.length > 15) {
			        window.alert("암호는 3자 이상 및 15자 이하로 입력하세요.");
			        pwd.select();
			        return false;
			    }
					
			    // 암호와 암호확인가 같은지 체크
			    if (pwd.value != document.getElementById("pwdchk").value) {
			        window.alert("암호가 틀렸습니다.");
			        pwd.select();
			        document.getElementById("pwdchk").value = "";
			        return false;
			    }
			    
			    window.alert("회원가입에 성공 하였습니다!");

			});
			
				
			
		})
		


		
	</script>





</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">본사 회원가입!</h1>
              </div>
              
              
              
              <form class="user" action="register" method="post">
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="id" name="id" placeholder="ID">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="pwd" name="pwd"placeholder="Password">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="pwdchk" name="pwdchk" placeholder="Repeat Password">
                  </div>
                </div>
                
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="e_name" name="e_name" placeholder="Name">
                </div>
                
                <div class="form-group row">
                  <div class="col-sm-4 mb-2 mb-sm-0">
                    <input type="number" class="form-control form-control-user" id="phone1" name="phone1" placeholder="Phone">
                  </div>
                  
                  <div class="col-sm-4">
                    <input type="number" class="form-control form-control-user" id="phone2" name="phone2" placeholder="Phone">
                  </div>
                  
                    <div class="col-sm-4">
                    <input type="number" class="form-control form-control-user" id="phone3" name="phone3" placeholder="Phone">
                  </div>
                </div>
                
                <button type="submit" name = "submit" id = "submit" class="btn btn-primary btn-user btn-block">Register Account</button>

              </form>
              
              
              
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login">이미 계정이 있으신가요? 로그인!</a>
              </div>
            </div>
          </div>
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

</body>

</html>
