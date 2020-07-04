<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>

<head>

  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>인사관리-가입승인</title>

<!-- Custom fonts for this template-->

  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">


</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">


			<%@include file="hr_sidebar.jsp"%>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
     

			<%@include file="../../nav/topbar.jsp"%>


        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">가입 승인</h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">가입 신청 목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                    <form name="acceptionForm">
                    <input type ="hidden" value="" id="e_no" name="e_no">
                    <input type ="hidden" value="" id="m_flag" name="m_flag">                      
                    </form> 
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>사원번호</th>
                      <th>이름</th>
                      <th>부서</th>
                      <th>가입 신청 시간</th>
                      <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:set var="isNull" value="${isNull}"/>
                  
                  <c:if test="${isNull == 1}">
</c:if>

<c:if test="${inNull != 1}">
    
                  <c:forEach items="${list}" var="list">
   
<c:set var="e_name" value="${list.e_name}"/>
<c:set var="p_no" value="${list.p_no}"/>
<c:set var="regdate" value="${list.hire}"/>
                 
                    <tr>
                    <td><c:out value="${list.e_no}"/></td>
                      <td><c:out value="${list.e_name}"/></td>
                      <td><c:out value="${list.p_no}"/></td>
                      <td><c:out value="${list.hire}"/></td>
                                 
                      <td>
                   <div class="dropdown mb-4">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 		선택
                    </button>
                    <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                                                                          
                     <input type="button" class="dropdown-item" id="ok" value="승인" />   
                     <input type="button" class="dropdown-item" id="no" value="거부" />    

                    </div>
                    
                  </div>
                  </td>
                  </tr>
                  
                  </c:forEach>
                   
    </c:if>
                             
                   
                   
                  </tbody>
                </table>
                    
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

		<%@include file="../../nav/footer.jsp"%>

		
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
  <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
  
  <script>
$(document).ready(function(){
//버튼 클릭시 Row 값 가져오기
$(".dropdown-item").click(function(){ 
	
	var isAcception = $(this).attr('id'); 

	if(isAcception=="ok"||isAcception=="no"){
	
	
	var str = ""
	var tdArr = new Array();	// 배열 선언
	var checkBtn = $(this);
	var m_flag = $(this).val();
	
	if(m_flag=="승인"){
		$("#m_flag").val(1);
	} else{
		$("#m_flag").val(2);
	}
	
	var tr = checkBtn.parent().parent().parent().parent();
	var td = tr.children();
	
	var e_no = td.eq(0).text();
	$("#e_no").val(e_no);
	
	
	/* // checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	
	
	
	
	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
	
	var userid = td.eq(1).text();
	var name = td.eq(2).text();
	var email = td.eq(3).text();
	
	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	td.each(function(i){	
		tdArr.push(td.eq(i).text());
	});
	
	console.log("배열에 담긴 값 : "+tdArr);
	
	
	
	
	str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
			", 아이디 : <font color='red'>" + userid + "</font>" +
			", 이름 : <font color='red'>" + name + "</font>" +
			", 이메일 : <font color='red'>" + email + "</font>"+
			", m_flag : <font color='red'>" + m_flag + "</font>";		
	
	$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
	$("#ex2_Result2").html(str); */

	  document.acceptionForm.action = "acception";
	  document.acceptionForm.method = "post";
	  document.acceptionForm.submit();
	}
});
})
</script>

</body>

</html>
