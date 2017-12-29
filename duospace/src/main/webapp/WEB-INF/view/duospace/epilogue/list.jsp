<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>
<style type="text/css">
*{
	list-style: none;
}
.card-list-wrapper {
	list-style: none;
	padding-bottom: 12px;
	padding-left: 6px;
	padding-right: 6px;
}
.list{
	list-style: none;
    padding-bottom: 12px;
    padding-left: 6px;
    padding-right: 6px;
}
.s-card{
	cursor: pointer;
	min-height: 100px;
	border: 1px solid #e1e4e6;
    border-radius: 5px;
    padding: 24px;
    background-color: #fff;
}
.img-wrapper {
	float: none;
	display: inline-block;
	margin: 0 -.125em;
	vertical-align: top;
	vertical-align: middle;
}

.img-wrapper .img-cover {
	width: 100%;
	height: auto;
}

.row {
	margin: 0px;
}
.info h4{
	font-size: 16px;
    font-weight: 700;
    margin: 0;
    margin-bottom: 10px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.star-rate{
	vertical-align: middle;
}
.start-rate li{
    display: inline-block;
    width: auto;
    margin-right: 3px;
}
.review-info{
    margin-bottom: 0;
}
.review-info h3{
	display: inline-block;
    font-size: 14px;
    font-weight: 400;
    margin: 0;
    margin-right: 5px;
    vertical-align: middle;
    max-width: 75px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.review-count{
	    vertical-align: middle;
    font-size: 14px;
}
.review p{
    display: -webkit-box;
    max-width: 200px;
    font-size: 14px;
    line-height: 1.1;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
    margin: 15px 0;
    color: #878d91;
}
.btn{
	background-color: transparent;
    color: #4d5256;
    height: auto;
    padding: 0;
    border: none;
}
.btn-wrapper{
	text-align: right;
}
.star_rating a {
    cursor: pointer;
    color: #FFE400;
    text-decoration: none;
    /*line-height: 150%;*/
}
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#FFE400;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<div class="review-main">
			<div class="col-sm-12" style="text-align: center; margin: 3%;">
				<h5 style="font-weight: 700; font-size: 35px;">듀오 스페이스 이용 후기</h5>
				<h4 style="font-size: 25px; color: #D9383A; margin-bottom: 2%;">BEST REVIEWER</h4>
				<p>
					<b>후기 할인 이벤트</b><br>
				&nbsp;<br><br>듀오 스페이스를 방문 해 주신 고객님 대단히 감사드립니다.<br>
					
				코워킹 스페이스 이용 후 리뷰를 등록해 주신 고객분들 중 베스트 3인을 뽑아 코워킹 스페이스 1일 이용권을 드립니다!!
				</p>
			</div>
		</div>
		<div class="row" style="margin:3% 0px;">
			<ul class="row card-list-wrapper">
				<c:forEach var="dto" items="${list}">
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
								<c:if test="${dto.reservNum==79}">
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</c:if>
								<c:if test="${dto.reservNum==72}">
									<img src="<%=cp%>/resource/images/duogram/5/5p.jpg"
										class="img-cover">
								</c:if>
								<c:if test="${dto.reservNum==34}">
									<img src="<%=cp%>/resource/images/duogram/4/4p.jpg"
										class="img-cover">
								</c:if>
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-${dto.spotName}</h4>
								</div>
								<div class="review-info">
									<h3>-${dto.userName}</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
								</div>
									<span class="review-count">00개 리뷰</span>
							</div>
							<div class="col-xs-12 review">
								${dto.content}
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-당산지점</h4>
								</div>
								<div class="review-info">
									<h3>-남정아</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>이용 후기 등록 내용입니다..!!!
								도봉지점 너무 마음에 드네요!!
								도봉룸 이용하였는데 마음에 들어서
								다음에 또 와야겠어요</p>
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duogram/5/5p.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-도봉지점</h4>
								</div>
								<div class="review-info">
									<h3>-김종기</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>이용 후기 등록 내용입니다..!!!
								도봉지점 너무 마음에 드네요!!
								도봉룸 이용하였는데 마음에 들어서
								다음에 또 와야겠어요 </p>
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duogram/4/4p.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-강남지점</h4>
								</div>
								<div class="review-info">
									<h3>-박가람</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>강남지점 너무 좋았고 다음에 또 들르고 싶어요! 
점장님도 친절하시고
매니저님도 잘 챙겨주셨습니다.
다음에 또 가고 싶은 매장이에요!!
다른 분들에게 추천 드리고 싶습니다.
가격도 적당하고, IT모임 장소가 마땅히 없었는데
듀오 스페이스 너무 좋고 짱짱입니다!!
더보기
</p>
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duogram/11/11p.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-당산지점</h4> 
								</div>
								<div class="review-info">
									<h3>-곽규혁</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>당산지점 후기 입니다.
								점장님이 너무 잘해 주셨고 스타트 기업, 프리랜서들에게
								꼭 필요한 홈페이지 같습니다. 이렇게 후기까지 남길 수 있어 행복합니다.</p>
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duogram/7/7p.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-당산지점</h4> 
								</div>
								<div class="review-info">
									<h3>-윤숭열</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>당산지점 후기 입니다.
								점장님이 너무 잘해 주셨고 스타트 기업, 프리랜서들에게
								꼭 필요한 홈페이지 같습니다. 이렇게 후기까지 남길 수 있어 행복합니다.</p>
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-xs-12 col-sm-6 col-lg-4 list">
					<div class="s-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duogram/8/8p.jpg"
										class="img-cover"> 
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-당산지점</h4> 
								</div>
								<div class="review-info">
									<h3>-김재원</h3>
									<p class="star_rating">
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
										<a class="fi1">★</a>
									</p>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>당산지점 후기 입니다.
								점장님이 너무 잘해 주셨고 스타트 기업, 프리랜서들에게
								꼭 필요한 홈페이지 같습니다. 이렇게 후기까지 남길 수 있어 행복합니다.</p>
								<div class="btn-wrapper">
								<div class="view-btn">
									<button type="button" class="btn">더보기</button>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="view-btn">
			<button type="button" class="btn" style="border: 1px solid #e1e4e6; padding:2%; width: 100%;">더보기</button>
		</div>
	</div>
</body>
</html>
