<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div>
<h6><spring:message code="topo.page"/></h6>
<br/>
</div>


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
</div>





<c:if test="${!empty topoinfos}">
    <hr>
    <table class="table table-striped table-bordered table-hover">

        <thead>
        <tr>
        	<th style="width:30%; scope="col">Couv</th>
            <th style="width:30%; scope="col"><spring:message code="place.maj"/></th>
            <th style="width:50%; scope="col"><spring:message code="description"/></th>
            <th scope="col" class="hideOnPhone"><spring:message code="publication"/></th>
            <th scope="col"><spring:message code="available"/></th>
            <th scope="col"><spring:message code="booked"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${topoinfos}" var="topoinfo">
            <tr>
            
            
       <td>
                <img src="img/topo/${topoinfo.picture}" width="100px" height="100px"/>
            </td> 
            
                <td>
                    <a href="${pageContext.request.contextPath}/personnalspace/topo/change?topoid=${topoinfo.id}">
                        <c:out value="${topoinfo.lieu}"/>
                    </a>
                </td>
                <td>
                    <div class="monBlocTable">
                        <p><c:out value="${topoinfo.description}"/></p>
                    </div>
                </td>
                <td class="hideOnPhone">
                     ${topoinfo.dtParutionFormated}
                </td>
                <td>
                    <div id="disporesa" disabled="disabled" ><c:if test="${topoinfo.dispoResa}"><span style="color: #07cc00;"><i class="far fa-thumbs-up"></i></span></c:if></div>
                    <div id="disporesa" disabled="disabled" ><c:if test="${!topoinfo.dispoResa}"><span style="color: #e33333;"><i class="far fa-thumbs-down"></i></span></c:if></div>
                   
                </td>
                <td>
                    <c:forEach items="${topoinfo.topoResas}" var="toporesa">
                        <a href="${pageContext.request.contextPath}/personnalspace/toporesa/selected?toporesaid=${toporesa.id}">
                            <p><c:out value="${toporesa.user.firstName}"/> <c:out value="${toporesa.user.lastName}"/></p>
                        </a>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>