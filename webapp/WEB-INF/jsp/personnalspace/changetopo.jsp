<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid col-xs-12">
    <div class="text-center">
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/add'">
            <spring:message code="button.submit.topo.add"/>
        </button>
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/list'">
            <spring:message code="button.submit.topo.list"/>
        </button>
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/myresas'">
            <spring:message code="button.submit.topo.resa.list.mine"/>
        </button>
  
        
    </div>
</div><br/>
<div class="container-fluid col-xs-10 col-sm-9 col-md-8 col-lg-7 col-xl-6">
<c:if test="${!empty topo}">
<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/personnalspace/topo/change">

    <fieldset>
        <input type="text" name="topoid" hidden value="${topo.id}"/>
        <legend><spring:message code="change.topo"/></legend>
        
        
        <div class="row">
         <div class="col-lg-4 col-md-4 col-sm-5">Upload Image: </div>
                  <input class="col-lg-8 col-md-8 col-sm-7" type="file" id="picture" name="file" maxlength="100" value="<c:out value="${topo.picture}"/>"/>
        
            </div>
        
        
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-5"><spring:message code="topo.lieu"/>:</div>
            <input class="col-lg-8 col-md-8 col-sm-7" type="text" id="lieu" name="lieu" maxlength="100" value="<c:out value="${topo.lieu}"/>"/>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-5"><spring:message code="topo.description"/>:</div>
            <textarea class="col-lg-8 col-md-8 col-sm-7" id="description" name="description" style="height: 300px" maxlength="65535"><c:out value="${topo.description}"/></textarea>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-5 col-6"><spring:message code="topo.pret.dispo"/>:</div>
            <div class="col-lg-8 col-md-8 col-sm-7 col-6">
                <spring:message code="topo.yes"/>:<input type="radio" name="topopret" value="yes" <c:if test="${topo.dispoResa}">checked</c:if>/>
                <spring:message code="topo.no"/>:<input type="radio" name="topopret" value="no" <c:if test="${!topo.dispoResa}">checked</c:if>/>
            </div>
        </div>

        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="container-fluid col-xs-12">
                <div class="text-center">
                    <input class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/>" />
                    <input formaction="${pageContext.request.contextPath}/personnalspace/topo/delete"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.delete"/>" />
                    <input class="boutonStyled" type="button" value="<spring:message code="button.submit.cancel"/>"
                           onclick="window.location='${pageContext.request.contextPath}/personnalspace/'"/>
                </div>
            </div>
        </div>
    </fieldset>
</form>
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
