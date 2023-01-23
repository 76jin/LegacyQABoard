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
  <h2>게시판 목록</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    	<c:if test="${empty member}">
			<form class="form-inline" action="${contextPath}/login/loginProcess" method="post">
			  <div class="form-group">
			    <label for="memID">ID:</label>
			    <input type="text" class="form-control" name="memID">
			  </div>
			  <div class="form-group">
			    <label for="memPwd">Password:</label>
			    <input type="password" class="form-control" name="memPwd">
			  </div>
			  <button type="submit" class="btn btn-default">로그인</button>
			</form>
		</c:if>
    	<c:if test="${!empty member}">
			<form class="form-inline" action="${contextPath}/login/logoutProcess" method="post">
			  <div class="form-group">
			    <label>${member.memName}님, 방문을 환영합니다.</label>
			  </div>
			  <button type="submit" class="btn btn-default">로그아웃</button>
			</form>
		</c:if>
	</div>
    <div class="panel-body">
    	<table class="table table-bordered table-hover" aria-label="board list" >
    		<thead>
    			<tr>
    				<th>번호</th>
    				<th>제목</th>
    				<th>작성자</th>
    				<th>작성일</th>
    				<th>조회수</th>
    			</tr>
    		</thead>
    		<c:forEach var="board" items="${list}">
		    	<tr>
    				<td>${board.idx}</td>
    				<td>
	    				<c:if test="${board.boardLevel > 0}">
	    					<c:forEach begin="1" end="${board.boardLevel}">
	    						<span style="padding-left: 10px"></span>
	    					</c:forEach>
	    				</c:if>
	    				<c:if test="${board.boardLevel > 0}">
	    					<c:if test="${board.boardAvailable eq 1}">
	    						<a href='${contextPath}/board/get?idx=${board.idx}'><c:out value="[RE]${board.title}" /></a>
	    					</c:if>
	    					<c:if test="${board.boardAvailable eq 0}">
	    						<a href='javascript:showDeletedMsg()'>[RE]삭제된 게시물입니다.</a>
	    					</c:if>
	    				</c:if>
	    				<c:if test="${board.boardLevel eq 0}">
	    					<c:if test="${board.boardAvailable eq 1}">
	    						<a href='${contextPath}/board/get?idx=${board.idx}'><c:out value="${board.title}" /></a>
	    					</c:if>
	    					<c:if test="${board.boardAvailable eq 0}">
	    						<a href='javascript:showDeletedMsg()'>삭제된 게시물입니다.</a>
	    					</c:if>
	    				</c:if>
    				</td>
    				<td>${board.writer}</td>
    				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.indate}" /></td>
    				<td>${board.count}</td>
    			</tr>
    		</c:forEach>
    		<c:if test="${!empty member}">
	    		<tr>
	    			<td colspan="5">
	    				<button id="regBtn" class="btn btn-xs btn-primary pull-right">글쓰기</button>
	    			</td>
	    		</tr>
    		</c:if>
    	</table>
    	
    	<!-- 페이징 Start -->
    	<div style="text-align: center;">
    		<ul class="pagination">
    		
    			<!-- 이전 버튼 -->
    			<c:if test="${pageMaker.prev}">
    			<li class="paginate_button previous">
    				<a href="${contextPath}/board/list?page=${pageMaker.startPage - 1}">이전</a>
    			</li>
    			</c:if>
    	
    			<!-- 페이징 번호 처리 -->
    			<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
    				<c:if test="${pageMaker.cri.page != pageNum}">
    					<li><a href="${contextPath}/board/list/?page=${pageNum}">${pageNum}</a></li>
    				</c:if>
				    	<c:if test="${pageMaker.cri.page == pageNum}">
						<li class="active"><a href="${contextPath}/board/list/?page=${pageNum}">${pageNum}</a></li>
					</c:if>
				</c:forEach>
    	
    			<!-- 다음 버튼 -->
    			<c:if test="${pageMaker.next}">
    			<li class="paginate_button next">
    				<a href="${contextPath}/board/list?page=${pageMaker.endPage + 1}">다음</a>
    			</li>
    			</c:if>
    	
    		</ul>
    	</div>
    	<!-- 페이징 End -->
    	
    	<!--  result Modal -->
		<div id="resultModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">등록 결과</h4>
		      </div>
		      <div class="modal-body"></div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		
		  </div>
		</div>
    	<!--  Modal End -->
    	
    	
    </div>
    <div class="panel-footer">레거시 답변형 게시판 (샘플)</div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		var result = '${result}';
		checkModal(result);
		
		$("#regBtn").click(function() {
			location.href = "${contextPath}/board/register";
		});
		
	});
	
	function checkModal(result) {
		if (result  == '') {
			return;
		}
		
		if (parseInt(result) > 0) {
			$(".modal-body").text('게시글 ' + parseInt(result) + '이 등록되었습니다.');
		}
		
		$("#resultModal").modal('show');
	}
	
	function showDeletedMsg() {
		alert("삭제된 게시물입니다.");
	}
</script>
</body>
</html>
