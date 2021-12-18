<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<t:layout>
    <jsp:body>
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-body p-3">
                            <div class="row">
                                <div class="col-8">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Pertanyaan</p>
                                        <h5 class="font-weight-bolder mb-0">
                                                ${surveysCount}
                                        </h5>
                                    </div>
                                </div>
                                <div class="col-4 text-end">
                                    <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                        <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-body p-3">
                            <div class="row">
                                <div class="col-8">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-capitalize font-weight-bold">Rata-rata total tanggapan</p>
                                        <h5 class="font-weight-bolder mb-0">
                                                ${responsesAvg}
                                        </h5>
                                    </div>
                                </div>
                                <div class="col-4 text-end">
                                    <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                        <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-body p-3">
                            <div class="row">
                                <div class="col-8">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-capitalize font-weight-bold">Total responses</p>
                                        <h5 class="font-weight-bolder mb-0">
                                                ${responsesCount}
                                        </h5>
                                    </div>
                                </div>
                                <div class="col-4 text-end">
                                    <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                        <i class="ni ni-paper-diploma text-lg opacity-10" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-4">
            <div class="row d-flex justify-content-center mb-4">
                <div class="col-11 card z-index-2">
                    <div class="card-body p-3">
                        <div class="bg-gradient-dark border-radius-lg py-3 pe-1 mb-3">
                            <div class="chart">
                                <canvas id="chart-bars-avg" class="chart-canvas" height="340" width="770" style="display: block; box-sizing: border-box; height: 170px; width: 385px;"></canvas>
                            </div>
                        </div>
                        <h6 class="ms-2 mt-4 mb-0"> Rata-rata responses </h6>
                    </div>
                </div>
            </div>

            <c:forEach var="survey" items="${surveys}">
            <div class="row">
                <div class="col-12">
                    <div class="card mb-4">
                        <div class="card-header pb-0">
                            <h6>${survey.question}</h6>
                        </div>
                        <div class="card-body px-0 pt-0 pb-2">
                            <div class="table-responsive p-0">
                                <table class="table align-items-center mb-0">
                                    <thead>
                                    <tr>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Function</th>
                                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Responses</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="response" items="${survey.getResponses()}">
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div>
                                                    <img src="${contextPath}/resources/img/team-3.jpg" class="avatar avatar-sm me-3" alt="user2">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">${response.getCustomer().getName()}</h6>
                                                    <p class="text-xs text-secondary mb-0">${response.getCustomer().getEmail()}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">${response.getCustomer().getOccupation()}</p>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="d-flex align-items-center justify-content-center">
                                                <span class="me-2 text-xs font-weight-bold">${response.getResponse()} / 5</span>
                                                <div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="${response.getResponse() * 20}" aria-valuemin="0" aria-valuemax="100" style="width: ${response.getResponse() * 20 }%;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>

        <script>

            var ctx_avg = document.getElementById("chart-bars-avg").getContext("2d");
            new Chart(ctx_avg, {
                type: "bar",
                data: {
                    labels: [
                        <c:forEach var="survey" items="${surveys}">
                                "${survey.question}",
                        </c:forEach>
                        ],
                    datasets: [{
                        label: "Rata-rata tanggapan",
                        tension: 0.4,
                        borderWidth: 0,
                        borderRadius: 4,
                        borderSkipped: false,
                        backgroundColor: "#fff",
                        data: [
                            <c:forEach var="avg" items="${itemSurveyAvg}">
                                "${avg}",
                            </c:forEach>
                        ],
                        maxBarThickness: 6
                        }, ],
                        },
                        options: {
                            responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                legend: {
                                    display: false,
                                }
                            },
                            interaction: {
                                intersect: false,
                                    mode: 'index',
                            },
                            scales: {
                                y: {
                                    grid: {
                                        drawBorder: false,
                                            display: false,
                                            drawOnChartArea: false,
                                            drawTicks: false,
                                    },
                                    ticks: {
                                        suggestedMin: 0,
                                            suggestedMax: 500,
                                            beginAtZero: true,
                                            padding: 15,
                                            font: {
                                            size: 14,
                                                family: "Open Sans",
                                                style: 'normal',
                                                lineHeight: 2
                                        },
                                        color: "#fff"
                                    },
                                },
                                x: {
                                    grid: {
                                        drawBorder: false,
                                            display: false,
                                            drawOnChartArea: false,
                                            drawTicks: false
                                    },
                                    ticks: {
                                        display: false
                                    },
                                },
                            },
                        },
                        });
        </script>
    </jsp:body>
</t:layout>