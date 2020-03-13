<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid col-xs-12">
    <div class="text-center">
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/add'">
            <spring:message code="button.submit.topo.add"/>
        </button>
    
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/myresas'">
            <spring:message code="button.submit.topo.resa.list.mine"/>
        </button>
    </div>
</div><br/>
<div class="container-fluid col-xs-10 col-sm-9 col-md-8 col-lg-7 col-xl-6">
<c:if test="${!empty topos}">
    <c:forEach items="${topos}" var="topo">
        <form method="post" action="${pageContext.request.contextPath}/personnalspace/topo/resa">
            <fieldset>
                <legend><spring:message code="topo"/> <c:out value="${topo.user.firstName}"/> <c:out value="${topo.user.lastName}"/> </legend>
                <input type="text" hidden value="${topo.id}" name="topoid"/>
             
            
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-5"><spring:message code="place.maj"/>:</div>
                    <div class="col-lg-9 col-md-8 col-sm-7"><c:out value="${topo.lieu}"/></div>
                </div>
                <div class="row">

                    <div class="col-lg-3 col-md-4 col-sm-5"><spring:message code="description"/>:</div>
                    <div class="col-lg-9 col-md-8 col-sm-7"><c:out value="${topo.description}"/></div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-5">&nbsp</div>
                    <div class="col-lg-9 col-md-8 col-sm-7">
                        <input class="boutonStyled" type="submit" value="<spring:message code="button.submit.topo.ask.resa"/>"/>
                    </div>
                </div>
            </fieldset>
        </form>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
    </c:forEach>
</c:if>
<c:if test="${!empty error}"><p style="color: red">${error}</p></c:if>
</div>
<br/>
        
        <div class="container-fluid col-xs-12">
    <div class="text-center">
     <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace'">
           <spring:message code="retour.personnalSpace"/>
        </button>
        
    </div>
</div>