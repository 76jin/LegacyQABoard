<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
 
<div class="container">
  <h2>레거시 답변형 게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">
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
    <div class="panel-footer">레거시 답변형 게시판 (샘플)</div>
  </div>
</div>

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
