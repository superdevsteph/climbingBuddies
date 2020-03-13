<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="container-fluid col-xs-10 col-sm-9 col-md-8 col-lg-7 col-xl-6">
    <form action="${pageContext.request.contextPath}/comment/change" method="post">
        <input type="text" id="siteid" name="siteid" value="${comment.site.id}" hidden/>
        <input type="text" id="idsite" name="id" value="${comment.site.id}" hidden/>
        <input type="text" id="commentid" name="commentid" value="${comment.id}" hidden/>
        <div class="row">
            <label class="col-xl-12 col-lg-12 col-md-12 col-sm-12" for="commentchange"><spring:message code="comment.your.comment"/> :</label>
        </div>
        <div class="row">
            <textarea class="col-xl-12 col-lg-12 col-md-12 col-sm-12" style="height: 300px" id="commentchange" name="commentchange" maxlength="65535" autofocus><c:out value="${comment.commentaire}"/></textarea>
        </div>
        <div class="row">&nbsp</div>
        <div class="row">
            <div class="container-fluid col-xs-12">
                <div class="text-center">
                    <input formaction="${pageContext.request.contextPath}/comment/change"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/>" />
                    <input formaction="${pageContext.request.contextPath}/comment/list?id=${comment.site.id}" formmethod="get"
                           class="boutonStyled" type="submit" value="<spring:message code="button.submit.cancel"/>" />
                </div>
            </div>
        </div>
    </form>
    <c:if test="${!empty error}"><p style="color: red">${error}</p></c:if>
</div>