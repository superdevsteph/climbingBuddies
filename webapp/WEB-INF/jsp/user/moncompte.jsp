<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="container">


		<div class="row">

			<div class="col-md-7 col-xl-8">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="account" role="tabpanel">

						<div class="card">
							<div class="card-header">

								<legend>
									<spring:message code="userInfo" />
								</legend>
							</div>
							<div class="card-body">
								<form method="post"
									action="${pageContext.request.contextPath}/user/moncompte">
									<div class="row">
										<div class="col-md-8">



											<div class="form-group">
												<label for="inputUsername"><spring:message code="email" /></label> 
														<input type="text" class="form-control"
													value="<c:out value="${email}"/>" name="email" readonly />
											</div>
											<div class="form-group">
												<label for="inputUsername">Biography</label>
												<textarea rows="2" class="form-control" id="inputBio"
													placeholder="Tell something about yourself"></textarea>
											</div>



											<div class="form-group">
												<label for="inputPasswordCurrent"><spring:message code="password" /></label> 
												<input type="password" name="password" class="form-control">
												<c:if test="${!empty passworderror}">
													<p style="color: red">${passworderror}</p>
												</c:if>
												<br/>
												<small><a href="#">Forgot your password?</a></small>
											</div>

											<div class="form-group">
												<label for="inputPasswordNew2"><spring:message code="password.confirm" /></label> 
														<input type="password" name="passwordconfirm" class="form-control">
												<c:if test="${!empty passworderror}">
													<p style="color: red">${passworderror}</p>
												</c:if>
											</div>


											<div class="form-group">
												<label for="inputFirstName"><spring:message
														code="fisrtname" /></label> <input type="text"
													class="form-control" value="${firstname}" name="firstname">
											</div>
											<div class="form-group">
												<label for="inputLastName"><spring:message
														code="lastname" /></label> <input type="text"
													class="form-control" value="${lastname}" name="lastname">
											</div>

											<div class="form-group">
												<label for="inputEmail4"><spring:message
														code="phone.number" /></label> <input class="form-control"
													type="tel" value="${phonenumber}" name="phonenumber">
											</div>
											<div class="form-group">
												<label for="inputAddress"><spring:message
														code="address" /></label> <input type="text" class="form-control"
													value="${address}" name="address">
											</div>
											<div class="form-group">
												<label for="inputAddress2"><spring:message
														code="city" /></label> <input type="text" class="form-control"
													value="${city}" name="city">
											</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="inputCity"><spring:message
															code="zip.code" /></label> <input type="tel"
														class="form-control" value="${zipcode}" name="zipcode">
												</div>

												<div class="form-group col-md-6">
													<label for="inputZip"><spring:message
															code="country" /></label> <input type="text"
														class="form-control" value="${country}" name="country">
												</div>
											</div>
											<button type="submit" class="btn btn-primary">
												<spring:message code="button.submit.record" />
											</button>
										</div>
									</div>
								</form>

							</div>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<c:if test="${!empty message}">
	<p>${message}</p>
</c:if>
<c:if test="${!empty error}">
	<p style="color: red">${error}</p>
</c:if>







