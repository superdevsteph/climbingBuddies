<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:if test="${ !empty sites }">
    <c:forEach items="${sites}" var="site" varStatus="status">
    
    
        <a href="${pageContext.request.contextPath}/search/site?id=${site.id}">
      
        </a>
    </c:forEach>
</c:if>
<c:if test="${ !empty site }">
    <div class="container">
        <div class="row">
           
    				  
    
            <h2><c:out value="${site.nom}"></c:out>, <c:out value="${site.lieu}"></c:out></h2>
                <div><c:if test="${site.tag}">
        <img src="${pageContext.request.contextPath}/img/logoTag.png" />
		</c:if></div>
				
        

     <div class="col-lg-1 col-md-1 col-sm-1">&nbsp;</div>
            <div class="col-lg-8 col-md-7 col-sm-5 col-12">
            <c:forEach items="${ site.secteurs }" var="secteur">
                <c:out value="${ secteur.nom }"></c:out>
                <ul>
                <c:forEach items="${ secteur.voies }" var="voie">
                    <li><c:out value="${ voie.nom }" ></c:out></li>
                    <ul>
                    <c:forEach items="${ voie.longueurs }" var="longueur">
                        <li>cot: <c:out value="${ longueur.cotation }"></c:out></li>
                    </c:forEach>
                    </ul>
                </c:forEach>
                </ul>
                <br/>
            </c:forEach>
            </div>


            </div>
        </div>


              <a class="far fa-comment-alt btn btn-round btn-outline-secondary" href="${pageContext.request.contextPath}/comment/list?id=${site.id}">Voir les commentaires</a> 
            
            <sec:authorize access="hasRole('ASSO')">

              <a class="fas fa-pencil-alt btn btn-round btn-outline-secondary" href="${pageContext.request.contextPath}/site/details?id=${site.id}">Modifier le site</a> 
										</sec:authorize>
   
</c:if>

              
        	

  