<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <style>
        td.details-control {
            background: url('https://cdn.rawgit.com/DataTables/DataTables/6c7ada53ebc228ea9bc28b1b216e793b1825d188/examples/resources/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.details-control {
            background: url('https://cdn.rawgit.com/DataTables/DataTables/6c7ada53ebc228ea9bc28b1b216e793b1825d188/examples/resources/details_close.png') no-repeat center center;
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
        <%@include file="master_sidebar.jsp"%>
        document.getElementById("collapse2").classList.toggle("show");
        document.getElementById("menu3").classList.toggle("active");

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

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table border="0" cellspacing="5" cellpadding="5">
                                    <tbody>
                                        <tr>
                                            <td>발주 신청 날짜:</td>
                                            <td><input type="text" id="min" name="min"></td>

                                            <td>~</td>
                                            <td><input type="text" id="max" name="max"></td>
                                        </tr>
                                    </tbody>

                                </table>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                    <thead>
                                        <tr>
                                            <th>발주 번호</th>
                                            <th>품목</th>
                                            <th>창고명</th>
                                            <th>신청일</th>
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
                                            <th>신청일</th>
                                            <th>납기일</th>
                                            <th>상태</th>
                                            <th>수정/삭제</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td><a onclick="showpage();">2006220011</a></td>
                                            <td id="index">A, B, C, D</td>
                                            <td>본사</td>
                                            <td>2020/06/22</td>
                                            <td>2020/07/09</td>
                                            <td style="color: limegreen">승인</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><a href="manager_orderpage.html">2006240011</a></td>
                                            <td id="index">B, C, D, E</td>
                                            <td>본사</td>
                                            <td>2020/06/24</td>
                                            <td>2020/07/09</td>
                                            <td style="color: limegreen">승인</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><a href="javascript:popup();">2006300011</a></td>
                                            <td id="index">C, D</td>
                                            <td>본사</td>
                                            <td>2020/06/30</td>
                                            <td>2020/07/16</td>
                                            <td style="color: limegreen">승인</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><a href="javascript:popup()">2007070011</a></td>
                                            <td id="index">D, E, F</td>
                                            <td>본사</td>
                                            <td>2020/07/07</td>
                                            <td>2020/07/16</td>
                                            <td style="color: limegreen">승인</td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <button id="btn">승인</button>
                            <button id="btn1">삭제</button>

                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
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
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!--발주번호 click -> 팝업(내용 열람) -->
    <script type="text/javascript">
        function showpage() {
		$('#myModal').modal();
    };
    </script>

    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable({
                initComplete: function() {
                    this.api().columns([2, 5]).every(function() {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo($(column.header()))
                            .on('change', function() {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function(d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
                }
            });
            //테이블 row 선택
            $('#dataTable tbody').on('click', 'tr', function() {
                $(this).toggleClass('selected');
            });
            $(document).ready(function() {
                var table = $('#dataTable').DataTable();

                $('#min, #max').keyup(function() {
                    table.draw(true);
                });

            });
        });
        //선택된 row들의 값 불러오기.
        //각 td에 id나 name 부여해야 함
        //본사-재고: 지점의 발주요청 처리
        //지점-점주: 매니저가 올린 발주요청 승인/거절
        $('#btn').click(function() {
            var l = $('#dataTable tbody tr[class*=selected]').length;

            alert(l);

            for (var i = 0; i < l; i++) {

                alert($("#dataTable tbody tr[class*=selected] td[id=index]:eq(" + i + ")").text());

            }

        });
    </script>


    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

    <!-- Add Date Picker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js"></script>



    <script type="text/javascript">
        $('#min, #max').datepicker({
            format: "yyyy/mm/dd",
        });
    </script>

    <script>
        function strTodate(str) {
            var yyyy = str.substr(0, 4);
            var mm = str.substr(5, 2);
            var dd = str.substr(8, 2);

            var convertedDate = new Date(yyyy, mm - 1, dd);
            return convertedDate;
        }

        function getFormatDate(date) {
            var year = date.getFullYear(); //yyyy
            var month = (1 + date.getMonth()); //M
            month = month >= 10 ? month : '0' + month; //month 두자리로 저장
            var day = date.getDate(); //d
            day = day >= 10 ? day : '0' + day; //day 두자리로 저장
            return year + '/' + month + '/' + day; //'-' 추가하여 yyyy/mm/dd 형태 생성 가능
        }


        $('#btn1').click(function() {
            var t = $('#dataTable').DataTable();
            t.rows('.selected').remove().draw(false);

        });
        $.fn.dataTable.ext.search.push(
            function(settings, data, dataIndex) {
                var min = $('#min').datepicker("getDate");
                var max = $('#max').datepicker("getDate");
                var startDate = new Date(data[3]);
                if (min == null && max == null) {
                    return true;
                }
                if (min == null && startDate <= max) {
                    return true;
                }
                if (max == null && startDate >= min) {
                    return true;
                }
                if (startDate <= max && startDate >= min) {
                    return true;
                }
                return false;
            }
        );
    </script>

</body>

</html>