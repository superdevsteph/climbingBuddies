<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   


   	<style><%@include file="/css/app.css"%></style>


         <header class="h-25 d-inline-block">
	<div class="overlay"></div>
	<video autoplay="autoplay" muted="muted"
		loop="loop">
		<source
			src="https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4"
			
			type="video/mp4">
	</video>
	<div class="container h-50">
		<div class="d-flex h-100 text-center align-items-center">
			<div class="w-100 ">
				  <div class="centerBlocHead hideOnPhone">
		
			    <div class="row">
			       
			    </div>
				<blockquote class="blockquote text-center">
				<p class="lead mb-0 text-black"><spring:message code="header.citation"/></p>
			<blockquote-footer class="blockquote-footer text-white"><cite title="Source Title">Gaston Rébuffat</cite></blockquote-footer>
</blockquote>
    </div>
			</div>
		</div>
	</div>
</header>
<hr class="hideOnPhone"/>
<div class="container-fluid col-xl-8 col-lg-9 col-sm-10 col-xs-11 ">
    <div class="row">
        <h2>${message}</h2>
    </div>
    <div class="row">
        <p><spring:message code="welcome.message"/> </p>
    </div>
</div>