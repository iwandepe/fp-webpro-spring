<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<t:layout>
    <jsp:body>
        <div class="p-6 bg-white border-b border-gray-200">
            Selamat Datang Admin, ${pageContext.request.userPrincipal.name}
        </div>
    </jsp:body>
</t:layout>