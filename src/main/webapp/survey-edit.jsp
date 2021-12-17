<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<t:layout>
    <jsp:body>
        <div class="card mt-4 z-index-0">
            <div class="card-header text-center pt-4">
                <h5>Form Tambah Pertanyaan</h5>
            </div>
            <div class="card-body">
                <form role="form text-left" method="POST" action="/surveys/${survey.id}/edit">
                    <div class="form-group">
                        <label>Pertanyaan</label>
                        <input type="text" class="form-control" name="question" id="question" value="${survey.question}">
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="text-center">
                        <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:layout>