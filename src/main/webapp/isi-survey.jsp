<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="counter" value="0"/>

<t:guest-layout>
    <jsp:body>
        <div class="card mt-4 z-index-0">
            <div class="card-header text-center pt-4">
                <h5>Halaman Pengisian Survey</h5>
            </div>
            <div class="card-body">
                <form role="form text-left" method="POST" action="/isi-survey">

                    <ul class="list-group">
                        <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg" style="flex-direction: column;">
                            <label class="col-12">Nama</label>
                            <div class="mb-3 col-12">
                                <input type="text" class="form-control" placeholder="Nama" aria-label="nama" aria-describedby="nama-addon" name="name">
                            </div>
                            <label class="col-12">Email</label>
                            <div class="mb-3 col-12">
                                <input type="text" class="form-control" placeholder="Email" aria-label="email" aria-describedby="email-addon" name="email">
                            </div>
                            <label class="col-12">Occupation</label>
                            <div class="mb-3 col-12">
                                <input type="text" class="form-control" placeholder="Occupation" aria-label="occupation" aria-describedby="occupation-addon" name="occupation">
                            </div>
                        </li>
                        <li class="list-group-item border-0 d-flex p-4 mb-2 mt-3 bg-gray-100 border-radius-lg" style="flex-direction: column;">


                            <c:forEach var="survey" items="${surveys}">
                            <label>${survey.id} ${survey.question}</label>
                            <div class="mb-3 col-12">
                                <input type="hidden" class="form-control" placeholder="Jawaban" aria-label="Email" aria-describedby="email-addon" name="survey_id[${counter}]" value="${survey.id}">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="responses[${counter}]" id="opt1-${survey.id}" value="1">
                                    <label class="form-check-label" for="opt1-${survey.id}">Tidak Puas</label>
                                </div>




                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="responses[${counter}]" id="opt2-${survey.id}" value="2">
                                    <label class="form-check-label" for="opt2-${survey.id}">Kurang Puas</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="responses[${counter}]" id="opt3-${survey.id}" value="3">
                                    <label class="form-check-label" for="opt3-${survey.id}">Cukup Puas</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="responses[${counter}]" id="opt4-${survey.id}" value="4">
                                    <label class="form-check-label" for="opt4-${survey.id}">Puas</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="responses[${counter}]" id="opt5-${survey.id}" value="5">
                                    <label class="form-check-label" for="opt5-${survey.id}">Sangat Puas</label>
                                </div>

                                <c:set var="counter" value="${counter + 1}"/>

                            </div>
                            </c:forEach>
                        </li>
                    </ul>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="text-center">
                        <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:guest-layout>
