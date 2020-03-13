<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/voie/add">
    <fieldset>
        <legend><spring:message code="voie"/></legend>
        <input type="text" hidden value="${siteid}" name="siteid"/>
        <input type="text" hidden value="${secteurid}" name="secteurid"/>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6"><spring:message code="name.word"/> :</div>
                <input class="col-xl-5 col-lg-5 col-md-5 col-sm-6" type="text" placeholder="<spring:message code="name.word"/>" name="nom" maxlength="100" autofocus/>
        </div>
        <div class="row"><div class="col-sm-12">&nbsp;</div></div>
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