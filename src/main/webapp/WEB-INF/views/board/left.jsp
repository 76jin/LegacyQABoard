<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="card" style="min-width: 500px; max-width: 1000px">
	<div class="row">
		<div class="col-lg-12">
			<div class="card-body">
				<h4 class="card-title">GUEST</h4>
				<p class="card-text">회원님 환영합니다!</p>
				<form action="${contextPath}/login/loginProcess" method="post">
				  <div class="form-group">
				    <label for="memID">아이디:</label>
				    <input type="text" class="form-control" name="memID">
				  </div>
				  <div class="form-group">
				    <label for="memPwd">비밀번호:</label>
				    <input type="password" class="form-control" name="memPwd">
				  </div>
				  <button type="submit" class="btn btn-default form-control">로그인</button>
				</form>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card-body">
				<p class="card-text">지도</p>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Search" />
					<div class="input-group-append">
						<button type="button" class="btn btn-secondary">Go</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>