<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<div class="container-fluid col-xs-10 col-sm-9 col-md-8 col-lg-7 col-xl-6">
<form action="${pageContext.request.contextPath}/comment/add" method="post">
    <input type="text" id="siteid" name="siteid" value="${siteid}" hidden/>
    <input type="text" id="id" name="id" value="${siteid}" hidden/>
        <div class="row">
            <label class="col-xl-12 col-lg-12 col-md-12 col-sm-12" for="commentnew"><spring:message code="comment.your.comment"/> :</label><br/>
        </div>
        <div class="row">
            <textarea class="col-xl-12 col-lg-12 col-md-12 col-sm-12" style="height: 300px" id="commentnew" name="commentnew" placeholder="<spring:message code="comment.write.your.comment"/>" maxlength="65535" autofocus><c:out value="${param.commentnew}"/></textarea>
        </div>
        <div class="row">&nbsp</div>
        <div class="row">
            <div class="container-fluid col-xs-12">
            <div class="text-center">
                <input class="boutonStyled" type="submit" value="<spring:message code="button.submit.record"/> ">
                <input formaction="${pageContext.request.contextPath}/comment/list" formmethod="get"
                       class="boutonStyled" type="submit" value="<spring:message code="button.submit.cancel"/>" />
            </div>
            </div>
        </div>
</form>
</div>