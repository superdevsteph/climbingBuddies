<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/check.js"></script>
<div class="container-fluid col-xl-8 col-lg-10 col-md-11 col-sm-12">

<form name="f" th:action="@{/registeruser}" method="post">
    <fieldset>
        <legend><spring:message code="registration"/></legend>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-6"><spring:message code="email"/></div>
            <input class="col-lg-7 col-md-7 col-sm-6" type="email" id="email" name="email" value="${param.email}"/>
        </div>
        <div id="erroremail" class="d-none">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-1">&nbsp;</div>
                <div class="col-lg-7 col-md-7 col-sm-6 col-10" style="color: red;"><spring:message code="error.email"/></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-6"><spring:message code="password"/></div>
            <input class="col-lg-7 col-md-7 col-sm-6" type="password" id="password" name="password"/>
        </div>
        <div id="errorpassword" class="d-none">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-1">&nbsp;</div>
                <div class="col-lg-7 col-md-7 col-sm-6 col-10" style="color: red;"><spring:message code="error.password"/></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-6"><spring:message code="password.confirm"/></div>
            <input class="col-lg-7 col-md-7 col-sm-6" type="password" id="passwordconfirm" name="passwordconfirm"/>
        </div>
        <div id="errorpasswordconfirm" class="d-none">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-1">&nbsp;</div>
                <div class="col-lg-7 col-md-7 col-sm-6 col-10" style="color: red;"><spring:message code="error.password"/></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-6"><spring:message code="fisrtname"/></div>
            <input class="col-lg-7 col-md-7 col-sm-6" type="text" id="firstname" name="firstname" value="${param.firstname}"/>
        </div>
        <div id="errorfirstname" class="d-none">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-1">&nbsp;</div>
                <div class="col-lg-7 col-md-7 col-sm-6 col-10" style="color: red;"><spring:message code="error.firstname"/></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-6"><spring:message code="lastname"/></div>
            <input class="col-lg-7 col-md-7 col-sm-6" type="text" id="lastname" name="lastname" value="${param.lastname}"/>
        </div>
        <div id="errorlastname" class="d-none">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-1">&nbsp;</div>
                <div class="col-lg-7 col-md-7 col-sm-6 col-10" style="color: red;"><spring:message code="error.lastname"/></div>
            </div>
        </div>
        <div class="row">
            <div>&nbsp;</div>
        </div>
        <div class="row">
            <div class="container-fluid col-xs-12">
                <div class="text-center">
                    <button type="submit" onclick="return checkRegisterUser()" class="boutonStyled"><spring:message code="button.submit.record"/></button>
                </div>
            </div>
        </div>
    </fieldset>
</form>
<c:if test="${ !empty error}">
    <div class="row">
        <div class="container-fluid col-xs-12">
            <p class="text-center"><c:out value="${error}"/></p>
        </div>
    </div>
</c:if>
</div>