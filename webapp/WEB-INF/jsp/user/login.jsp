<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/check.js"></script>
<style><%@include file="/css/app.css"%></style>

      <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
  
<div class="container">
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1><legend><spring:message code="login.please"/></legend></h1>
						 </div>
					</div>
					<div class="login-form">


<form action="${pageContext.request.contextPath}/login" method="post">
   
    <fieldset>
        <c:if test="${param.error != null}"><p style="color: red"><spring:message code="login.invalid"/>.</p></c:if>
        <c:if test="${param.logout != null}"><p><spring:message code="logout.ok"/>.</p></c:if>
        <div class="input-group input-sm">
            <label class="col-sm-6" for="username"><spring:message code="login.username"/></label>
            <input class="col-sm-6" type="email" id="username" name="username" autofocus autocomplete="off"/>
        </div>
        <div id="erroremail" class="d-none">
            <div class="input-group input-sm">
                <div class="col-sm-6 col-1">&nbsp;</div>
                <p class="col-sm-6 col-10" style="color: red;"><spring:message code="error.email"/></p>
            </div>
        </div>
        <div class="input-group input-sm">
            <label class="col-sm-6" for="password"><spring:message code="login.password"/></label>
            <input class="col-sm-6" type="password" id="password" name="password"/>
        </div>
        <div id="errorpassword" class="d-none">
            <div class="input-group input-sm">
                <div class="col-sm-6 col-1">&nbsp;</div>
                <p class="col-sm-6 col-10" style="color: red;"><spring:message code="error.password"/></p>
            </div>
        </div>
        <div class="input-group input-sm">
            <div>&nbsp;</div>
        </div>
            <div class="row">
                <div class="container-fluid col-sm-12">
                    <div class="text-center">
                        <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm" onclick="return checkLogin();"><spring:message code="login.submit"/></button>
                    </div>
                     <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">ou</span>
                              </div>
                           </div>
                           <div class="col-md-12 mb-3">
                              <p class="text-center">
                                 <a href="javascript:void();" class="google btn mybtn"><i class="fa fa-google-plus">
                                 </i><spring:message code="login.google"/>
                                 </a>
                              </p>
                           </div>
                           <div class="form-group">
                              <p class="text-center"><spring:message code="login.not.registered"/><a href="${pageContext.request.contextPath}/user/registeruser"><spring:message code="menu.log-in"/></a></p>
                           </div>
                </div>
            </div>
    </fieldset>
    </div>
</form>
</div></div></div></div></div></div>