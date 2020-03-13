<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:if test="${ !empty site }">
<div class="container">
    <div class="row">
        <spring:message code="site"/> : <c:out value="${site.nom}"></c:out>, <c:out value="${site.lieu}"></c:out>
    </div>
    <form method="post" action="${pageContext.request.contextPath}/site/change">
    <fieldset>
    <legend><spring:message code="site"/></legend>
        <input type="text" hidden value="${site.id}" name="id"/>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6"><spring:message code="name.word"/>:</div>
            <input class="col-xl-5 col-lg-5 col-md-5 col-sm-6" type="text" value="${site.nom}" name="nom" autofocus/>
        </div>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6"><spring:message code="place"/>:</div>
            <input class="col-xl-5 col-lg-5 col-md-5 col-sm-6" type="text" value="${site.lieu}" name="lieu"/>
        </div>
      
        <c:if test="${isassolevel}">
            <div class="row">&nbsp;</div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-5"><spring:message code="official.association.site"/>:</div>
                <div class="col-xl-5 col-lg-5 col-md-5 col-sm-6 col-7">
                        <spring:message code="official.association.site.yes"/> <input type="radio" name="siteofficial" value="yes" <c:if test="${siteofficialistaged}">checked</c:if>/>
                        <spring:message code="official.association.site.no"/> <input type="radio" name="siteofficial" value="no" <c:if test="${!siteofficialistaged}">checked</c:if>/>
                </div>
            </div>
        </c:if>
        <div class="row text-center">
            <div class="col-md-3 col-sm-4">
                <input formaction="${pageContext.request.contextPath}/site/change"
                   class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/>" />
            </div>
            <c:if test="${isassolevel}">
                <div class="col-md-3 col-sm-4">
                    <input formaction="${pageContext.request.contextPath}/site/delete"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.delete"/>" />
                </div>
            </c:if>
            <div class="col-md-3 col-sm-4">
                <input formaction="${pageContext.request.contextPath}/secteur/add" formmethod="get"
                   class="boutonStyled" type="submit" value="<spring:message code="button.submit.add.secteur"/>" />
            </div>
        
        </div>
    </fieldset>
    </form>
</c:if>
<c:if test="${!empty error}">
    <div class="row">
        <p style="color: red">${error}</p>
    </div>
</c:if>
</div>
