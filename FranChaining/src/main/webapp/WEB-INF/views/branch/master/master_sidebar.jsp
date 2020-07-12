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

</head>

<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Sidebar -->
      <ul
         class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
         id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <a
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="main">
            <div class="sidebar-brand-icon rotate-n-15">
               <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Franchaining</div>
         </a>

         <!-- Divider -->
         <hr class="sidebar-divider my-0">

         <!-- Nav Item - Dashboard -->
         <li class="nav-item" id="menu1"><a class="nav-link" href="stock">
               <i class="fas fa-fw fa-archive"></i> <span>재고 관리</span>
         </a></li>

         <!-- Divider -->
         <hr class="sidebar-divider" style="margin-bottom: 0px;">

         <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item" id="items2"><a class="nav-link collapsed"
            href="#" data-toggle="collapse" data-target="#collapse2"
            aria-expanded="true" aria-controls="collapseTwo"> <i
               class="fas fa-fw fa-truck"></i> <span>발주 관리</span>
         </a>
            <div id="collapse2" class="collapse" aria-labelledby="headingTwo"
               data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">발주 관리</h6>
                  <a class="collapse-item" href="order" id="menu2">발주 신청</a> <a
                     class="collapse-item" href="orderlist" id="menu3">발주 내역</a>
               </div>
            </div></li>
            
        <!-- Divider -->
         <hr class="sidebar-divider" style="margin-bottom: 0px;">
            <!-- Nav Item - Pages Collapse Menu -->
         <li class="nav-item" id="items3"><a class="nav-link collapsed"
            href="#" data-toggle="collapse" data-target="#collapse3"
            aria-expanded="true" aria-controls="collapseThree"> <i
               class="fas fa-users"></i> <span>매니저 관리</span>
         </a>
            <div id="collapse3" class="collapse" aria-labelledby="headingThree"
               data-parent="#accordionSidebar">
               <div class="bg-white py-2 collapse-inner rounded">
                  <h6 class="collapse-header">매니저 관리</h6>
                  <a class="collapse-item" href="managerlist" id="menu4">매니저 조회</a> <a
                     class="collapse-item" href="regmanager" id="menu5">매니저 등록</a>
               </div>
            </div></li>
			

         <!-- Divider -->
         <hr class="sidebar-divider d-none d-md-block">

         <!-- Sidebar Toggler (Sidebar) -->
         <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
         </div>

      </ul>
      <!-- End of Sidebar -->

   </div>
   <!-- End of Page Wrapper -->

</body>

</html>
