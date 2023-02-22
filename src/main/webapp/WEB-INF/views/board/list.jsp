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
		   	<table class="table table-hover" aria-label="board list" >
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
		    					<i class="bi bi-arrow-return-right"></i>
		    				</c:if>
		    				<c:if test="${board.boardLevel > 0}">
		    					<c:if test="${board.boardAvailable eq 1}">
		    						<a class="detail" href='${board.idx}'><c:out value="[RE]${board.title}" /></a>
		    					</c:if>
		    					<c:if test="${board.boardAvailable eq 0}">
		    						<a href='javascript:showDeletedMsg()'>[RE]삭제된 게시물입니다.</a>
		    					</c:if>
		    				</c:if>
		    				<c:if test="${board.boardLevel eq 0}">
		    					<c:if test="${board.boardAvailable eq 1}">
		    						<a class="detail" href='${board.idx}'><c:out value="${board.title}" /></a>
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
		   	
			<!-- 검색 메뉴 -->
			<form id="searchForm" class="form-inline" action="${contextPath}/board/list">
				<div class="container">
					<div class="input-group mb-3">
					  <div class="input-group-append">
		    			<select class="form-control" name="type">
		    				<option value="writer" ${pageMaker.cri.type == 'writer' ? 'selected' : ''}>이름</option>
		    				<option value="title" ${pageMaker.cri.type == 'title' ? 'selected' : ''}>제목</option>
		    				<option value="content" ${pageMaker.cri.type == 'content' ? 'selected' : ''}>내용</option>
		    			</select>
					  </div>
					  <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
					  <div class="input-group-append">
					    <button class="btn btn-success" type="submit">검색</button> 
					  </div>
					</div>
				</div>
			</form>
		   	
		   	<!-- 페이징 Start -->
	   		<ul class="pagination justify-content-center">
	   		
	   			<!-- 이전 버튼 -->
	   			<c:if test="${pageMaker.prev}">
	   			<li class="paginate_button page-item previous">
	   				<a class="page-link" href="${pageMaker.startPage - 1}">이전</a>
	   			</li>
	   			</c:if>
	   	
	   			<!-- 페이징 번호 처리 -->
	   			<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	  					<li class="paginate_button page-item ${pageMaker.cri.page == pageNum ? 'active' : ''}">
	  						<a class="page-link" href="${pageNum}">${pageNum}</a>
	  					</li>
				</c:forEach>
	   	
	   			<!-- 다음 버튼 -->
	   			<c:if test="${pageMaker.next}">
	   			<li class="paginate_button page-item next">
	   				<a class="page-link" href="${pageMaker.endPage + 1}">다음</a>
	   			</li>
	   			</c:if>
	   	
	   		</ul>
		   	<!-- 페이징 End -->
		   	
		   	<form id="pageForm" action="${contextPath}/board/list" method="post">
		   		<!-- 게시물 번호(idx) 추가 -->
		   		<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" />
		   		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}" />
		   		
		   		<!-- 검색 정보 -->
		   		<input type="hidden" name="type" value="${pageMaker.cri.type}" />
		   		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
		   	</form>
		   	
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
		
		var result = '${result}';
		checkModal(result);
		
		$("#regBtn").click(function() {
			location.href = "${contextPath}/board/register";
		});
		
		// 페이지번호 클릭 시 이동하기
		var pageForm = $("#pageForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();	// a 태그 기능 막기 
			var page = $(this).attr("href");	// 페이지 번호 
			pageForm.find("#page").val(page);
			pageForm.submit();
		});
		
		$(".detail").on('click', function(e) {
			e.preventDefault();	// a 태그 기능 막기
			var idx = $(this).attr("href");	// 페이지 Id
			var idxHidden = '<input type="hidden" name="idx" value="' + idx + '" />';
			pageForm.append(idxHidden);
			pageForm.attr('action', '${contextPath}/board/get');
			pageForm.attr('method', 'get');
			pageForm.submit();
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
