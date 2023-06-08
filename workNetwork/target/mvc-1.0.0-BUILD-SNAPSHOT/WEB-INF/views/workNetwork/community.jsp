<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header_news.jsp" />

<%-- <section class="hero py-5 py-lg-7" style="background-image: url(${path}/resources/img/08.jpeg); padding-buttom: 20%;"> --%>
<section class="hero py-5 py-lg-7" style="background-image: url(${path}/resources/img/comm2.jpg); padding-buttom: 20%;">
          <div >
            <h1 class="hero-heading" style="color: black;">커뮤니티</h1>
		  </div>
          <div class="container">
            <!-- 검색창 -->
                  <!-- 검색창에 그림자 효과 추가 -->
                  <div class="search-bar search-bar-with-tabs p-3 p-lg-4" style="box-shadow: 0px 0px 10px 1px rgb(148, 148, 148);">
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="faq" role="tabpanel">
<!-- 검색창1 -->
            <form id="index_search_article1" name="index_search_article1" method="get" action="${path}/workNetwork/communityForm">
              <div class="row">
                <div class="col-lg-3 d-flex align-items-center form-group no-divider" style="border-right: 2px solid rgb(186, 186, 186);">
                      <!-- article 사이트 목록 -->
                      <select class="selectpicker form-control" id="community_department" name="community_department" title="department" data-style="btn-form-control">
                        <option value="제조">제조</option>
                        <option value="교육">교육</option>
                        <option value="건설">건설</option>
                        <option value="정보통신">정보통신</option>
                        <option value="보건">보건</option>
                        <option value="과학기술">과학기술</option>
                      </select>
                    </div>
                    <!-- 타이틀 검색 -->
                    <input type="text" placeholder="  Title" name="community_title" id="community_title" data-style="btn-form-control" class="col-md-6 col-lg-7 d-flex align-items-center form-group no-divider" style="border: none; outline: none;"></input>
                    <!-- article 버튼 -->
                    <div class="col-lg-2 d-grid form-group mb-0">
                      <input class="btn btn-primary h-100" type="submit" style="background-color: green; border: none; font-size: 18px;" id="subm" value="Search"></input>
                    </div>
                  </div>
                </form>
                      </div>
                    </div>
                  </div>
                </div>
        </section>

    <section class="py-6">
      <div class="container">
        <nav aria-label="Blog pagination" style="text-align: right;">
          <ul class="pagination justify-content-between mb-5" style="text-align: right;" >
            <li class="page-item"></li>
            <li class="page-item"><p class="mb-3 mb-md-0" style="font-size: 20px;"><strong>${count}</strong> results found</p></li>
            <a class="page-link text-sm rounded" tabindex="-1" href="${path}/workNetwork/write" style="color: green;">글쓰기</a></li>
          </ul>
        </nav>
        <div class="row mb-5"  style="margin-top: 70px;">
        
        
        	<c:if test="${not empty searchPost}">
          		<c:forEach var="postV" items="${searchPost}" varStatus="status">
			          <!-- blog item-->
				          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
				            <div class="card shadow border-0 h-100">
				              <div class="card-body">
				                <a class="text-uppercase text-muted text-sm letter-spacing-2" href="${path}/workNetwork/show?department=${postV.department}&title=${postV.title}&content=${postV.content}&name=${postV.name}&create_date=${postV.create_date}&views=${postV.views}&board_no=${postV.board_no}">${postV.department} </a>
				                <h5 class="my-2"><a class="text-dark" href="${path}/workNetwork/show?department=${postV.department}&title=${postV.title}&content=${postV.content}&name=${postV.name}&create_date=${postV.create_date}&views=${postV.views}&board_no=${postV.board_no}">${postV.title}          </a></h5>
				                <div class="text-sm my-3" style="text-align: right; color: green;"><i class="far fa-clock me-2"></i>${postV.create_date}</div>
				              </div>
				            </div>
				          </div>
          		</c:forEach>
          	</c:if>
        
          
        <!-- Pagination -->
          <nav aria-label="Page navigation example" style="margin-top: 50px;">
             <ul class="pagination pagination-template d-flex justify-content-center">
               		<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/communityForm?${res}page=${pageInfo.prevPage}');" aria-label="Prev" style="color: green;"> <i class="fa fa-angle-left"></i></a></li>
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active" aria-current="page"><span class="page-link" style="background-color:green; border: 1px solid green;">${status.current}<span style="display: none;">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/communityForm?${res}page=${status.current}');" style="color: green;">${status.current}</a></li>
						</c:if>
					</c:forEach>
				   <li class="page-item"><a class="page-link" onclick="movePage('${path}/workNetwork/communityForm?${res}page=${pageInfo.nextPage}');" aria-label="Next" style="color: green;"> <i class="fa fa-angle-right"></i></a></li>
             </ul>
           </nav>
      </div>
    </section>
    
    <script type="text/javascript">
	    function movePage(pageUrl){
			location.href = encodeURI(pageUrl);	
		};
	</script>
   </main>

<jsp:include page="/WEB-INF/views/common/footer_news.jsp" />