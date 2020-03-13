<script type="text/javascript">
$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <nav class="navbar navbar-expand-sm   navbar-light bg-light fixed-top">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse hideOnPhone" id="navbarTogglerDemo03">
          		  <div class="hideOnPhone">
        <img src="${pageContext.request.contextPath}/img/logo.png"/>
        </div>
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="col-lg-4 col-md-3 col-sm-2">
              <a class="nav-link" href="${pageContext.request.contextPath}/"><spring:message code="menu.accueil"/></a>
              </li>
               <c:if test="${!isauth}">
               <li class="col-lg-4 col-md-3 col-sm-2" nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/login"><spring:message code="menu.login"/></a>
            </li>
             <li class="col-lg-4 col-md-3 col-sm-2" nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/user/registeruser"><spring:message code="menu.log-in"/></a>
            </li>
                </c:if>
            
             <c:if test="${isauth}">
            
            <li class="col-lg-4 col-md-3 col-sm-2" nav-item dropdown dmenu">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"><spring:message code="menu.gestion.compte"/></a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><spring:message code="menu.logout"/></a>
             <a class="dropdown-item" href="${pageContext.request.contextPath}/user/moncompte"><spring:message code="menu.account"/></a>
             <a class="dropdown-item" href="${pageContext.request.contextPath}/personnalspace"><spring:message code="menu.personnal.space"/></a>
            <sec:authorize access="hasRole('ASSO')">
		 	
             <a class="dropdown-item" href="${pageContext.request.contextPath}/user/listpage"><spring:message code="menu.user.list"/></a> 
	 	</sec:authorize>
            </div>
          </li>
              </c:if>
          
          
          <li class="col-lg-4 col-md-3 col-sm-2" nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/search"><spring:message code="menu.search.and.change"/></a>
          </li>
         
         
            <li class="col-lg-4 col-md-3 col-sm-2" nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle"  id="navbardrop" data-toggle="dropdown"><spring:message code="menu.trad"/></a>
            <div class="dropdown-menu sm-menu">
            <a class="dropdown-item imgLanguage" id="refreshfrench2" href="${pageContext.request.contextPath}"><spring:message   code="menu.trad.fr"/></a>
            <a class="dropdown-item imgLanguage" id="refreshenglish2" href="${pageContext.request.contextPath}"><spring:message  code="menu.trad.en"/></a>
     
            </div>
          </li> 
      
         <li class="col-lg-4 col-md-3 col-sm-2" nav-item">
            <c:if test="${isauth}">
        <div class="flottantRight hideOnPhone" id="firstAnLastName">
        <sec:authentication var="principal" property="principal" />
        <spring:message code="goodmorning"/> ${principal.user.firstName} ${principal.user.lastName}&nbsp;&nbsp;&nbsp;
        </div>
    </c:if>
             </li>
          </ul>
       
        </div>
      </nav>
      
