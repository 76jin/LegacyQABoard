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
	    	<form id="boardModify" action="${contextPath}/board/modify" method="post">
	 	    	<input type="hidden" name="page" value ="<c:out value='${cri.page}' />" />
	    		<input type="hidden" name="perPageNum" value ="<c:out value='${cri.perPageNum}' />" />
	    		
	 		    <!-- 검색 정보 -->
	    		<input type="hidden" name="type" value="${cri.type}" />
	    		<input type="hidden" name="keyword" value="${cri.keyword}" />
	    		
		    	<table class="table table-bordered" aria-label="board">
		    		<tr>
		    			<td>번호</td>
		    			<td><input type="text" class="form-control" name="idx" value="${board.idx}" readonly="readonly" /></td>
		    		</tr>
		    		<tr>
		    			<td>제목</td>
		    			<td><input type="text" class="form-control" name="title" value="<c:out value='${board.title}' />" /></td>
		    		</tr>
		    		<tr>
		    			<td>내용</td>
		    			<td><textarea rows="10" class="form-control" name="content"><c:out value='${board.content}' /></textarea></td>
		    		</tr>
		    		<tr>
		    			<td>작성자</td>
		    			<td><input type="text" class="form-control" name="writer" value="${board.writer}" readonly="readonly" /></td>
		    		</tr>
		    		<tr>
		    			<td colspan="2" style="text-align: center;">
		    				<c:if test="${!empty member && member.memID eq board.memID}">
			    				<button type="button" class="btn btn-sm btn-primary" data-btn="modify">수정</button>
			    				<button type="button" class="btn btn-sm btn-warning" data-btn="remove">삭제</button>
		    				</c:if>
		    				<c:if test="${empty member || member.memID ne board.memID}">
		    					<button disabled="disabled" type="button" class="btn btn-sm btn-primary" data-btn="modify">수정</button>
		    					<button disabled="disabled" type="button" class="btn btn-sm btn-warning" data-btn="remove">삭제</button>
		    				</c:if>
		    				<button type="button" class="btn btn-sm btn-info" data-btn="list">목록</button>
		    			</td>
		    		</tr>
		    	</table>
	    	</form>
		    	
	    	<form id="boardForm" method="get">
		   		<input type="hidden" id="idx" name="idx" value ="<c:out value='${board.idx}' />" />
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
			var boardForm = $("#boardForm");
			var btn = $(this).data("btn");
			if (btn === 'modify') {
				$("#boardModify").submit();
				return;
			} else if (btn === 'remove') {
				boardForm.attr('action', '${contextPath}/board/remove');
			} else if (btn === 'list') {
				boardForm.find('#idx').remove();
				boardForm.attr('action', '${contextPath}/board/list');
			}
			
			boardForm.submit();
		});
	});
</script>
</body>
</html>
