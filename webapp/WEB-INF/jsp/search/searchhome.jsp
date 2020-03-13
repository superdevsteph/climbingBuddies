<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/check.js"></script>

<section class="search-sec">
	<div class="container">
		<form method="post" action="${pageContext.request.contextPath}/search">
			<legend>
				<spring:message code="search" />
			</legend>
			<div class="container">
		<fieldset>
			<div class="row">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-sm-12 p-0 wrn-btn">
							<input type="text" name="lieu" id="lieu" value="${param.lieu}"
								placeholder="<spring:message code="place"/>">
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 p-0 wrn-btn">
							<input type="text" name="nombredesecteurs"
								id="nombredesecteurs" value="${param.nombredesecteurs}"
								placeholder="<spring:message code="nber.sectors"/>">
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 p-0 wrn-btn">
							<input type="text" name="cotation" id="cotation" maxlength="3"
								value="${param.cotation}"
								placeholder="<spring:message code="cotation"/>">

						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 p-0 wrn-btn">
							<input type="submit" class="btn btn-primary wrn-btn"
								onclick="return checkSearch();"
								value="<spring:message code="button.submit.search"/>">
						</div>
					</div>
				</div>
			</div>
				</fieldset>
			</div>
		</form>
	</div>
</section>
<c:if test="${!empty rechercheinfructueuse}">
	<p>${rechercheinfructueuse}</p>
</c:if>
<br />

<div class="container ">
	<div class="row ">
		<div class="col-lg-12 panel panel-primary ">
			<div class="panel-heading">
				<legend>
					<spring:message code="sitelist" />
				</legend>
			</div>
			<c:if test="${ !empty sitessommaire }">
				<c:forEach items="${sitessommaire}" var="sitesommaire"
					varStatus="status">
					<div class="panel-body">
						<ul class="list-group col-6">

				<li class="list-group-item"><c:if test="${sitesommaire.tag}">
						<img src="${pageContext.request.contextPath}/img/logoTag.png" />
					</c:if> <a
					href="${pageContext.request.contextPath}/search/site?id=${sitesommaire.id}">
						<c:out value="${sitesommaire.nom}"></c:out>, <c:out
							value="${sitesommaire.lieu}"></c:out>
				</a>



					<div class="row pull-right action-buttons">
						<a
							href="${pageContext.request.contextPath}/comment/list?id=${sitesommaire.id}">
							<span class="far fa-comment-alt btn btn-round btn-outline-secondary"></span>
						</a>
						<sec:authorize access="hasRole('ASSO')">

							<a
								href="${pageContext.request.contextPath}/site/details?id=${sitesommaire.id}">
								<span class="fas fa-pencil-alt btn btn-round btn-outline-secondary"></span>
							</a>
							<a><span class="far fa-trash-alt btn btn-round btn-outline-secondary"></span></a>
						</sec:authorize>

					</div>
					</li>

						</ul>
					</div>
				</c:forEach>
			</c:if>

			<c:if test="${!empty sites}">
				<c:forEach items="${ sites }" var="site" varStatus="status">
					<div class="panel-body">
						<ul class="list-group">

					<li class="list-group-item"><c:if test="${site.tag}">
							<img src="${pageContext.request.contextPath}/img/logoTag.png" />
						</c:if> <a
						href="${pageContext.request.contextPath}/search/site?id=${site.id}">
							<c:out value="${site.nom}"></c:out>, <c:out
								value="${site.lieu}"></c:out>
					</a>



						<div class="pull-right action-buttons">

							<a
								href="${pageContext.request.contextPath}/comment/list?id=${site.id}">
								<span class="far fa-comment-alt btn btn-round btn-outline-secondary"></span>
							</a>
							<sec:authorize access="hasRole('ASSO')">

								<a
									href="${pageContext.request.contextPath}/site/details?id=${sitesommaire.id}">
									<span class="fas fa-pencil-alt btn btn-round btn-outline-secondary"></span>
								</a>
								<a><span class="far fa-trash-alt btn btn-round btn-outline-secondary"></span></a>
							</sec:authorize>

						</div>
						</li>

						</ul>
					</div>
				</c:forEach>
			</c:if>

			<div class="panel-footer">
				<div>
					<form method="get"
						action="${pageContext.request.contextPath}/site/add">
						<input class="btn btn-primary wrn-btn" type="submit"
							value="<spring:message code="add.new.site"/>">
					</form>
				</div>
				<br />
				<div class="row">

					<div class="col-md-12">
						<ul class="pagination pagination-sm pull-right">
							<li class="disabled"><a href="javascript:void(0)">«</a></li>
							<li class="active"><a href="javascript:void(0)">1 <span
									class="sr-only">(current)</span></a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><a href="">5</a></li>
							<li><a href="javascript:void(0)">»</a></li>
						</ul>
					</div>
				</div>
				<br />
				<p>
					<img src="${pageContext.request.contextPath}/img/logoTag.png" /> =
					<spring:message code="assotag" />

				</p>
			</div>
		</div>
	</div>
</div>

