<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
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
.b-card{
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
.publisher{
	vertical-align: middle;
    font-size: 14px;
}
.b-bottom p{
    display: -webkit-box;
    max-width: 400px;
    font-size: 14px;
    line-height: 1.75;
}
.created{
	vertical-align: middle;
    font-size: 14px;
}
.b-created{

}
.btn{
	background-color: transparent;
    color: #4d5256;
    height: auto;
    padding: 0;
    border: none;
}
.view-btn{
	text-align: center; 
}
</style>
</head>
<body>
 <div style="margin-left: 33%;" class="selectBox">
 			<form action="<%=cp%>/duospace/book/book" name="searchForm" method="post">
	          <select id="shopname" onchange="cityList();" class="selectField">
                   <option value="">::지점명::</option>
                       <option value="seoul">서울</option>
              </select>
              <select id="" class="selectField">
                   <option value="">::분야::</option>
                   <option value="">IT</option>
                   <option value="">Coffe</option>
              </select>
              <input type="text" name="searchValue" class="boxTF">
              <button type="button" onclick="result();" class="btn">검색</button>
 			</form>
    </div>
    
    검색결과-> (지점명)
     <div class="row" style="margin:3% 0px;">
			<ul class="row card-list-wrapper">
				<li class="col-sm-6 list">
					<div class="b-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row" style="width:100%">
									<h3 class="bname" style="float:left;">-책 제목</h3>
									<h3 style="float:right;">-저자</h3>
								</div>
								<div class="book-info" style="width:100%">
									<div class="publisher" style="float:left;"><p>출판사:</p></div>
									<div class="b-bar" style="float:right;"><p>도서 바코드:</p></div>
								</div>
								<div class="clear"></div>
							<div class="book-info" style="width:100%;">
									<div class="publisher" style="float:left;"><p>출판일:</p></div>
									<div class="b-created" style="float:right;"><p>등록일:</p></div>
							</div>
							</div>
							<div class="col-xs-6 b-bottom" style="width: 100%">
								<div class="group"style="float:left;"><p>분류명: </p></div>
								<div class="state" style="float: right;"><p>도서상태:</p></div>
							<div class="col-xs-12 view-btn" style="width: 100%;">
									<button type="button" class="btn">더보기</button>
							</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-sm-6 list">
					<div class="b-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row" style="width:100%">
									<h3 class="bname" style="float:left;">-책 제목</h3>
									<h3 style="float:right;">-저자</h3>
								</div>
								<div class="book-info" style="width:100%">
									<div class="publisher" style="float:left;"><p>출판사:</p></div>
									<div class="b-bar" style="float:right;"><p>도서 바코드:</p></div>
								</div>
								<div class="clear"></div>
							<div class="book-info" style="width:100%;">
									<div class="publisher" style="float:left;"><p>출판일:</p></div>
									<div class="b-created" style="float:right;"><p>등록일:</p></div>
							</div>
							</div>
							<div class="col-xs-6 b-bottom" style="width: 100%">
								<div class="group"style="float:left;"><p>분류명: </p></div>
								<div class="state" style="float: right;"><p>도서상태:</p></div>
							<div class="col-xs-12 view-btn" style="width: 100%;">
									<button type="button" class="btn">더보기</button>
							</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-sm-6 list">
					<div class="b-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row" style="width:100%">
									<h3 class="bname" style="float:left;">-책 제목</h3>
									<h3 style="float:right;">-저자</h3>
								</div>
								<div class="book-info" style="width:100%">
									<div class="publisher" style="float:left;"><p>출판사:</p></div>
									<div class="b-bar" style="float:right;"><p>도서 바코드:</p></div>
								</div>
								<div class="clear"></div>
							<div class="book-info" style="width:100%;">
									<div class="publisher" style="float:left;"><p>출판일:</p></div>
									<div class="b-created" style="float:right;"><p>등록일:</p></div>
							</div>
							</div>
							<div class="col-xs-6 b-bottom" style="width: 100%">
								<div class="group"style="float:left;"><p>분류명: </p></div>
								<div class="state" style="float: right;"><p>도서상태:</p></div>
							<div class="col-xs-12 view-btn" style="width: 100%;">
									<button type="button" class="btn">더보기</button>
							</div>
							</div>
						</div>
					</div>
				</li>
				<li class="col-sm-6 list">
					<div class="b-card">
						<div class="row">
							<div class="col-xs-12 col-sm-3 profile">
								<div class="img-wrapper">
									<img src="<%=cp%>/resource/images/duospace/review/profile.jpg"
										class="img-cover">
								</div>
							</div>
							<div class="col-xs-12 col-sm-9 info">
								<div class="row" style="width:100%">
									<h3 class="bname" style="float:left;">-책 제목</h3>
									<h3 style="float:right;">-저자</h3>
								</div>
								<div class="book-info" style="width:100%">
									<div class="publisher" style="float:left;"><p>출판사:</p></div>
									<div class="b-bar" style="float:right;"><p>도서 바코드:</p></div>
								</div>
								<div class="clear"></div>
							<div class="book-info" style="width:100%;">
									<div class="publisher" style="float:left;"><p>출판일:</p></div>
									<div class="b-created" style="float:right;"><p>등록일:</p></div>
							</div>
							</div>
							<div class="col-xs-6 b-bottom" style="width: 100%">
								<div class="group"style="float:left;"><p>분류명: </p></div>
								<div class="state" style="float: right;"><p>도서상태:</p></div>
							<div class="col-xs-12 view-btn" style="width: 100%;">
									<button type="button" class="btn">더보기</button>
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
</body>
</html>
