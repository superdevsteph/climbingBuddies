<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<div class="container-fluid col-xs-12">
    <div class="text-center">
 
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/list'">
            <spring:message code="button.submit.topo.list"/>
        </button>
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/personnalspace/topo/myresas'">
            <spring:message code="button.submit.topo.resa.list.mine"/>
        </button>
    </div>
</div><br/>
<div class="container-fluid col-xs-10 col-sm-9 col-md-8 col-lg-7 col-xl-6">
      
<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/personnalspace/topo/add">

    <fieldset>
        <legend>Topo</legend>
        <div class="row">
            <div class="col-lg-4 col-md-5 col-sm-6"><spring:message code="topo.lieu"/>:</div>
            <input class="col-lg-8 col-md-7 col-sm-6" type="text" name="lieu" maxlength="100" value="${param.lieu}" autofocus/>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-5 col-sm-6"><spring:message code="topo.description"/>:</div>
            <textarea class="col-lg-8 col-md-7 col-sm-6" style="height: 300px" name="description" value="${param.description}" maxlength="65535"></textarea>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-lg-4 col-md-5 col-sm-6 col-6"><spring:message code="topo.pret.dispo"/>:</div>
            <div class="col-lg-8 col-md-7 col-sm-6 col-6">
                <spring:message code="topo.yes"/>:<input type="radio" name="topopret" value="yes"/>
                <spring:message code="topo.no"/>:<input type="radio" name="topopret" value="no"/>
            </div>
            
            
    <div class="form-group">
                <label for="picture">Upload image: </label>
                 <input type="file" name="file" value="UploadFile"/> 
            </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="container-fluid col-xs-12">
                <div class="text-center">
                    <input formaction="${pageContext.request.contextPath}/personnalspace/topo/add"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/>" />
                    <input class="boutonStyled" type="button" value="<spring:message code="button.submit.cancel"/>"
                    onclick="window.location='${pageContext.request.contextPath}/personnalspace/'"/>
                </div>
            </div>
        </div>
    </fieldset>
</form>
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