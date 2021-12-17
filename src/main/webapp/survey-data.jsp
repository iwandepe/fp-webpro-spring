<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<t:layout>
    <jsp:body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-10">
                    <h3>Pertanyaan Survei</h3>
                </div>
                <div class="col-2">
                    <a href="/surveys/create" class="btn btn-primary">Tambah Pertanyaan</a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 mx-auto">
                    <div class="position-relative border-radius-xl shadow-lg mb-7">
                        <div class="overflow-scroll">
                            <!-- Projects table -->
                            <table class="table align-items-center table-flush" id="data-table">
                                <thead class="thead-light">
                                <tr class="text-center">
                                    <th scope="col" class="col-2">Nomor</th>
                                    <th scope="col" class="col-9">Pertanyaan</th>
                                    <th scope="col" class="col-1"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="survey" items="${surveys}">
                                    <tr>
                                        <td class="text-center">
                                            ${survey.id}
                                        </td>
                                        <td>
                                            ${survey.question}
                                        </td>
                                        <td>
                                            <a href="/surveys/${survey.id}/edit" class="btn btn-success p-2" type="a"><i
                                                    class="bi-pencil"></i></a>

<%--                                            TODO: Create modal sure and unsure to delete the data--%>
<%--                                            TODO: I think this will error if the survey already has response, so handle it in controller--%>
                                            <a href="/surveys/${survey.id}/delete" class="btn btn-success p-2" type="a"><i
                                                    class="bi-trash"></i></a>
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
    </jsp:body>
</t:layout>