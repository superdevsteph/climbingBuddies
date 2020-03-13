<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:if test="${ !empty secteur }">
    <div class="container">
        <div class="row">
            <spring:message code="sector"/> : <c:out value="${secteur.nom}"></c:out>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/secteur/change">

        <fieldset>
            <legend><spring:message code="sector.change"/></legend>
            <input type="text" hidden value="${siteid}" name="siteid"/>
            <input type="text" hidden value="${secteur.id}" name="id"/>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6"><spring:message code="name.word"/>:</div>
                <input class="col-xl-5 col-lg-5 col-md-5 col-sm-6" type="text" value="<c:out value="${secteur.nom}"/>" name="nom" autofocus/>
            </div>
            <div class="row"><div class="col-sm-12">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-3 col-sm-4">
                    <input formaction="${pageContext.request.contextPath}/secteur/change"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/>" />
                </div>
                <div class="col-md-3 col-sm-4">
                    <input formaction="${pageContext.request.contextPath}/secteur/delete"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.delete"/>" />
                </div>
                <div class="col-md-3 col-sm-4">
                    <input formaction="${pageContext.request.contextPath}/voie/add" formmethod="get"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.add.voie"/>" />
                </div>
            </div>
        </fieldset>
        </form>
        <c:if test="${!empty error}"><p style="color: red">${error}</p></c:if>
    </div>
</c:if>