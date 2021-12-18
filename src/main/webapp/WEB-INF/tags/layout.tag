<%@tag description="Page Layout" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="${contextPath}/resource/img/apple-icon.png">
    <link rel="icon" type="image/png" href="https://my.its.ac.id/assets/media/favicons/favicon-web.png">
    <title>
        Survei Pelanggan ITS
    </title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <!-- Nucleo Icons -->
    <link href="${contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" />
    <link href="${contextPath}/resources/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/css/nucleo-svg.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <!-- CSS Files -->
    <link id="pagestyle" href="${contextPath}/resources/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Meow+Script&display=swap" rel="stylesheet">

    <script src="${contextPath}/resources/js/plugins/chartjs.min.js"></script>
</head>

<body class="g-sidenav-show  bg-gray-100">

<%--Sidenav--%>
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="/dashboard">
            <img src="https://www.its.ac.id/wp-content/uploads/2020/07/Logo-ITS-1-300x185.png" class="navbar-brand-img h-100" alt="main_logo">
            <span class="ms-1 font-weight-bold">Survei Pelanggan ITS</span>
        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100 h-100" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/dashboard">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fa fa-home text-dark" aria-hidden="true"></i>
                    </div>
                    <span class="nav-link-text ms-1">Dashboard</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#dashboardsExamples" aria-controls="dashboardsExamples" role="button" aria-expanded="false">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center d-flex align-items-center justify-content-center  me-2">
                        <i class="fa fa-home text-dark" aria-hidden="true"></i>
                    </div>
                    <span class="nav-link-text ms-1">Question</span>
                </a>
                <div class="collapse" id="dashboardsExamples">
                    <ul class="nav ms-4 ps-3">
                        <li class="nav-item">
                            <a class="nav-link" href="/surveys/create">
                                <span class="sidenav-mini-icon"> Ca </span>
                                <span class="sidenav-normal"> Create </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/surveys">
                                <span class="sidenav-mini-icon"> Ca </span>
                                <span class="sidenav-normal"> List </span>
                            </a>
                        </li>

                    </ul>
                </div>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="surveys/result">
                    <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fa fa-home text-dark" aria-hidden="true"></i>
                    </div>
                    <span class="nav-link-text ms-1">Surveys Result</span>
                </a>
            </li>


        </ul>
    </div>
</aside>

<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg">
<%--    Navbar--%>
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Page name</li>
                </ol>
                <h6 class="font-weight-bolder mb-0">Page name</h6>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                    <div class="input-group">
                        <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Type here...">
                    </div>
                </div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <a href="/login" class="nav-link text-body font-weight-bold px-0">
                            <i class="fa fa-user me-sm-1"></i>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <span class="d-sm-inline d-none">${pageContext.request.userPrincipal.name}</span>
                            </c:if>
                        </a>
                    </li>
                    <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item px-3 d-flex align-items-center">
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>

                            <a onclick="document.forms['logoutForm'].submit()"><i class="fa fa-sign-out fixed-plugin-button-nav cursor-pointer"></i></a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<%--    End Navbar--%>

    <div class="container-fluid">
        <jsp:doBody/>
    </div>
</main>

<!--   Core JS Files   -->
<script src="${contextPath}/resources/js/core/popper.min.js"></script>
<script src="${contextPath}/resources/js/core/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/plugins/perfect-scrollbar.min.js"></script>
<script src="${contextPath}/resources/js/plugins/smooth-scrollbar.min.js"></script>
<script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
        var options = {
            damping: '0.5'
        }
        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${contextPath}/resources/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
<!-- custom -->
</body>

</html>