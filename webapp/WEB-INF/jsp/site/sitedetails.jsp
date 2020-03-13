<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:if test="${ !empty site }">
    <div class="container">
        <div class="row">
                <a href="${pageContext.request.contextPath}/site/change?id=${site.id}"> 
                   <h2><c:out value="${site.nom}"></c:out>, <c:out value="${site.lieu}"></c:out></h2> </a>
                   <div><c:if test="${site.tag}"><img src="${pageContext.request.contextPath}/img/logoTag.png"/></c:if></div> 
               
                
                 </div>
            <div class="col-lg-1 col-sm-1">&nbsp;</div>
            <div class="col-lg-6 col-sm-5">
            <c:forEach items="${ site.secteurs }" var="secteur">
                <a href="${pageContext.request.contextPath}/secteur/change?id=${secteur.id}&siteid=${site.id}">
                    <c:out value="${ secteur.nom }"></c:out>
                </a>
                <ul>
                <c:forEach items="${ secteur.voies }" var="voie">
                    <li>
                    <a href="${pageContext.request.contextPath}/voie/change?id=${voie.id}&siteid=${site.id}">
                        <c:out value="${ voie.nom }" ></c:out>
                    </a>
                    </li>
                    <ul>
                    <c:forEach items="${ voie.longueurs }" var="longueur">
                        <li>
                        <a href="${pageContext.request.contextPath}/longueur/change?id=${longueur.id}&siteid=${site.id}">
                        cot: <c:out value="${ longueur.cotation }"></c:out>
                        </a>
                        </li>
                    </c:forEach>
                    </ul>
                </c:forEach>
                </ul>
                <br/>
            </c:forEach>
            </div>

       
       </div>
       
   
</c:if>

      


 <div class="text-center">
         
        <button class="boutonStyled" onclick="window.location.href='${pageContext.request.contextPath}/search'">
            <spring:message code="return.site.list"/>
        </button>
</div>

       