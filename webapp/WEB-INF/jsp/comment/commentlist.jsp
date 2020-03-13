<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<c:forEach  items="${commentaires}" var="commentaire" varStatus="status">
    <div class="monCadre">
        <p style="font-size: 0.8em"><c:out value="${commentaire.user.firstName} ${commentaire.user.lastName}"/></p>
        <p><c:out value="${commentaire.commentaire}"/></p>
        <c:if test="${isassolevel}">
            <p>
            <sec:authorize access="hasRole('ASSO')">
                <a class="glyphicon glyphicon-trash btn btn-round btn-outline-secondary" href="${pageContext.request.contextPath}/comment/delete?id=${commentaire.id}&siteid=${siteid}">
                    <span><spring:message code="button.submit.delete"/></span>
                </a>
                <a class="glyphicon glyphicon-pencil btn btn-round btn-outline-secondary" href="${pageContext.request.contextPath}/comment/change?id=${commentaire.id}&siteid=${siteid}">
                    <span><spring:message code="button.submit.change"/></span>
                </a>
                </sec:authorize>
            </p>
        </c:if>
    </div>
</c:forEach>
<div class="container-fluid col-xs-8">
    <div class="text-center">
    <button class="far fa-comment-alt btn btn-round btn-outline-secondary" onclick="window.location.href='${pageContext.request.contextPath}/comment/add?siteid=${siteid}'">
        <spring:message code="button.submit.add.comment"/>
    </button>
    </div>
</div>
 