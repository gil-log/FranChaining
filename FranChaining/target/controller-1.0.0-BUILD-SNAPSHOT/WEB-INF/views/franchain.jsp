<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>

<head>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>FranChaining</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  
  <!-- 구글 웹 폰트 -->
 <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
 
<style>
.container {
  display: flex;
  width: 100%;
  padding: 4% 2%;
  box-sizing: border-box;
  height: 100vh;
}

.box {
  flex: 1;
  overflow: hidden;
  transition: .5s;
  margin: 0 2%;
  box-shadow: 0 20px 30px rgba(0,0,0,.1);
  line-height: 0;
}

.box > img {
  width: 200%;
  height: calc(100% - 10vh);
  object-fit: cover; 
  transition: .5s;
}

.box > span {
  font-size: 3.8vh;
  font-family: 'Black Han Sans', sans-serif;
  color: white;
  display: block;
  text-align: center;
  height: 10vh;
  line-height: 2.6;
}

.box:hover { flex: 1 1 50%; }
.box:hover > img {
  width: 100%;
  height: 100%;
}
</style>
</head>

<body class="bg-gradient-primary">


<div class="container">
  <div class="box">
    <img src="${pageContext.request.contextPath}/resources/img/center/logo.png" onclick="location.href='user/logincenter?type=center';">
    <span>본사</span>
  </div>
  <div class="box">
    <img src="${pageContext.request.contextPath}/resources/img/branch/logo.png" onclick="location.href='user/loginbranch?type=branch';">
    <span>지점</span>
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