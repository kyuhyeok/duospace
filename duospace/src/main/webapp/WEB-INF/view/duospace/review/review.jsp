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
    max-width: 400px;
    height: 73.5px;
    font-size: 14px;
    line-height: 1.75;
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
		<div class="selectbox">
			<form name="searchForm" action="<%=cp%>/duospace/review/review"
				method="post">
				<select name="searchKey" class="shopname" style="padding:4px;">
					<option value="subject">지점명</option>
					<option value="content">내용</option>
					<option value="userName">작성자</option>
					<option value="created">등록일</option>
				</select> <input type="text" name="searchValue" class="boxTF">
				<button type="button" class="btn" onclick="searchList()">검색</button>
			</form>
		</div>
		<div class="row" style="margin:3% 0px;">
			<ul class="row card-list-wrapper">
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
									<h4 class="shopname">-지점명</h4>
								</div>
								<div class="review-info">
									<h3>-이름</h3>
									<ul class="star-rate">
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
									</ul>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>이곳은 내용들 입니다!!! 내용이 많아지면 어떻게 되는지 시험도 해보고 더보기도
								나와야 합니다!!!!!!!!!!!!!과연 나올 것인가?!!! 기대가 되네요 후훗</p>
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
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-지점명</h4>
								</div>
								<div class="review-info">
									<h3>-이름</h3>
									<ul class="star-rate">
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
									</ul>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>이곳은 내용들 입니다!!! 내용이 많아지면 어떻게 되는지 시험도 해보고 더보기도
								나와야 합니다!!!!!!!!!!!!!과연 나올 것인가?!!! 기대가 되네요 후훗</p>
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
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-지점명</h4>
								</div>
								<div class="review-info">
									<h3>-이름</h3>
									<ul class="star-rate">
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
									</ul>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>이곳은 내용들 입니다!!! 내용이 많아지면 어떻게 되는지 시험도 해보고 더보기도
								나와야 합니다!!!!!!!!!!!!!과연 나올 것인가?!!! 기대가 되네요 후훗</p>
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
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row">
									<h4 class="shopname">-지점명</h4>
								</div>
								<div class="review-info">
									<h3>-이름</h3>
									<ul class="star-rate">
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
										<li class="fi1"></li>
									</ul>
									<span class="review-count">00개 리뷰</span>
								</div>
							</div>
							<div class="col-xs-12 review">
								<p>이곳은 내용들 입니다!!! 내용이 많아지면 어떻게 되는지 시험도 해보고 더보기도
								나와야 합니다!!!!!!!!!!!!!과연 나올 것인가?!!! 기대가 되네요 후훗</p>
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
