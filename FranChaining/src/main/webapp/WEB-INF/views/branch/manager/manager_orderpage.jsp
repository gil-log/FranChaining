<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OrderPage-Modal</title>

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

#_paginate {
	display: none;
}
.paginate_button {
	display: none;
}
.selected {
            background-color: gainsboro;
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
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					
					<!-- DataTales Example -->
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
												<td><span id='o_origin'></span></td>
											</tr>
											<tr>
												<td>신청일</td>
												<td><span id="o_date"></span></td>
												<td>납기일</td>
												<td><input type="text" id="datePicker2"
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
												<td><span id="master_name">
												${master.e_name}
												</span></td>
												<td>TEL</td>
												<td><span id="b_phone">
												${branch.b_phone1}-${branch.b_phone2}-${branch.b_phone3}
												</span></td>
											</tr>
											<tr>
												<td>지점번호</td>
												<td><span id="b_no">
												${userinfo.b_no}
												</span></td>
												<td>지점명</td>
												<td><span id="b_name">
												${branch.b_name}
												</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<br>
							
			<div class="table-responsive">
                <table class="table table-bordered" id="orderlistTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>품목명</th>
                      <th>규격</th>
                      <th>수량</th>
                      <th>공급가</th>
                      <th>금액</th>
                      <th>공급처</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>

                </table>
              
              </div>
              
							<div class="table-responsive">
								<table class="table table-bordered" id="orderdataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>품목명</th>
											<th>규격</th>
											<th>수량</th>
											<th>공급가</th>
											<th>금액</th>
											<th>공급처</th>
										</tr>
									</thead>



									<tbody>


									</tbody>
								</table>

							</div>

							<button class="btn btn-primary btn-icon-split" id="itemAdd">
								<span class="icon text-white-50"> <i class="fas fa-plus"></i>
								</span> <span class="text">추가</span>
							</button>

							                
							<button class="btn btn-danger btn-icon-split" id="itemDel" onclick="remove();">
								<span class="icon text-white-50"> <i class="fas fa-trash"></i>
								</span> <span class="text">삭제</span>
							</button>
							
							                  
                 <button class="btn btn-info btn-icon-split" id="itemModulation" onclick="modulation();">
					<span class="icon text-white-50"> <i class="fas fa-info"></i>
					</span> <span class="text">수정</span>
				</button> 
				
							<button class="btn btn-success btn-icon-split"
								data-dismiss="modal">
								<span class="icon text-white-50"> <i class="fas fa-check"></i>
								</span> <span class="text">완료</span>
							</button>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


</body>

</html>