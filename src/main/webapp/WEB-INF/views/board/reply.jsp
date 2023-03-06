<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 
<!-- <div class="container"> -->
  <div class="card">
    <div class="card-header">
		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>레거시 답변형 게시판</h1> 
		    <p>Spring Boot, JPA, JSP, BS4</p> 
		  </div>
		</div>
    </div>
    <div class="card-body">
		<div class="row">
		  <div class="col-lg-2">
		  	<jsp:include page="left.jsp" />
		  </div>
		  <div class="col-lg-7">
	    	<form id="replyForm" method="post">
	    		<!-- 페이지 정보 -->
	    		<input type="hidden" name="page" value ="<c:out value='${cri.page}' />" />
	    		<input type="hidden" name="perPageNum" value ="<c:out value='${cri.perPageNum}' />" />
	    		
	 		    <!-- 검색 정보 -->
	    		<input type="hidden" name="type" value="${cri.type}" />
	    		<input type="hidden" name="keyword" value="${cri.keyword}" />
	    		
	    		<input type="hidden" name="idx" value="${board.idx}" />
	    		<input type="hidden" name="memID" value="${member.memID}" />
	    		
	    		<div class="form-group">
	    			<label>제목</label>
	    			<input type="text" name="title" class="form-control" value="<c:out value='${board.title}' />" />
	    		</div>
	    		<div class="form-group">
	    			<label>답글</label>
	    			<textarea rows="10" name="content" class="form-control"></textarea>
	    		</div>
	    		<div class="form-group">
	    			<label>작성자</label>
	    			<input type="text" name="writer" class="form-control" value="${member.memName}" readonly="readonly" />
	    		</div>
	    		<button type="button" class="btn btn-sm btn-secondary" data-btn="reply">답글</button>
	    		<button type="button" class="btn btn-sm btn-secondary" data-btn="reset">취소</button>
	    		<button type="button" class="btn btn-sm btn-secondary" data-btn="list">목록</button>
	    	</form>
	    	
		    <form id="listForm" method="get">
	    		<input type="hidden" name="page" value ="<c:out value='${cri.page}' />" />
	    		<input type="hidden" name="perPageNum" value ="<c:out value='${cri.perPageNum}' />" />
	    		
	 		    <!-- 검색 정보 -->
	    		<input type="hidden" name="type" value="${cri.type}" />
	    		<input type="hidden" name="keyword" value="${cri.keyword}" />
	    	</form>
		  </div>
		  <div class="col-lg-3">
		  	<jsp:include page="right.jsp" />
		  </div>
		</div>
    </div> 
    <div class="card-footer">레거시 답변형 게시판 (샘플)</div>
  </div>
<!-- </div> -->

<script type="text/javascript">
	$(document).ready(function() {
		$("button").on('click', function(e) {
			var formData = $("#replyForm");
			var btn = $(this).data("btn");
			if (btn === 'reply') {
				formData.attr('action', '${contextPath}/board/reply');
			} else if (btn === 'reset') {
				formData[0].reset();
				return;
			} else if (btn === 'list') {
				var listForm = $("#listForm");
				listForm.attr('action', '${contextPath}/board/list');
				listForm.submit();
				return;
			}
			
			formData.submit();
		});
	});
</script>
</body>
</html>
