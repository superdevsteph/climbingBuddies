<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/site/add">
    <fieldset>
        <legend><spring:message code="site"/></legend>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">nom:</div>
            <input class="col-xl-4 col-lg-4 col-md-4 col-sm-6" type="text" placeholder="nom du site" id="nom" name="nom" value="<c:out value="${param.nom}"/>" maxlength="100" autofocus required/>
        </div>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">lieu:</div>
            <input class="col-xl-4 col-lg-4 col-md-4 col-sm-6" type="text" placeholder="lieu" maxlength="100" id="lieu" name="lieu" value="<c:out value="${param.lieu}"/>" required/>
        </div>
             <c:if test="${isassolevel}">
            <div class="row">&nbsp;</div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-5"><spring:message code="official.association.site"/>:</div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-7">
                    <spring:message code="official.association.site.yes"/>:<input type="radio" name="siteofficial" value="yes"/>
                    <spring:message code="official.association.site.no"/>:<input type="radio" name="siteofficial" value="no"/>
                </div>
            </div>
        </c:if>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="container-fluid col-xs-12">
                <div class="text-center">
                    <input type="submit" class="boutonStyled" value="<spring:message code="button.submit.record"/>"/>
                </div>
            </div>
        </div>
    </fieldset>
</form>
<c:if test="${!empty error}"><p style="color: red">${error}</p></c:if>
</div>
