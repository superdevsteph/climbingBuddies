<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:if test="${ !empty longueur }">
    <div class="container">
        <div class="row">
            <spring:message code="longueur"/> : <c:out value="${longueur.cotation}"></c:out>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/longueur/change">

            <fieldset>
                <legend><spring:message code="modification.longueur"/></legend>
                <input type="text" hidden value="${longueur.id}" name="id"/>
                <input type="text" hidden value="${siteid}" name="siteid"/>
                <input type="text" hidden value="${voieid}" name="voieid"/>
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6"><spring:message code="cotation"/>:</div>
                    <input class="col-xl-5 col-lg-5 col-md-5 col-sm-6" type="text" value="${longueur.cotation}" name="cotation" autofocus/>
                </div>
                <div class="row"><div class="col-sm-12">&nbsp;</div></div>
                <div class="row">
                    <div class="col-md-3 col-sm-4">
                        <input formaction="${pageContext.request.contextPath}/longueur/change"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/>" />
                    </div>
                    <div class="col-md-3 col-sm-4">
                    <input formaction="${pageContext.request.contextPath}/longueur/delete"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.delete"/>" />
                    </div>
                </div>
            </fieldset>
        </form>
        <c:if test="${!empty error}"><p style="color: red">${error}</p></c:if>
    </div>
</c:if>