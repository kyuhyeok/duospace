<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
%>


<div id="newmodal" style="padding: 5px 20px;">


						<form class="form-horizontal calender" id="modalForm" name="modalForm" role="form">
							<span>>예약 정보</span>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">좌석 정보</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" type="text" readonly="readonly" name="seatName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label"> 층 </label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" type="text" readonly="readonly" name="price">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">결제일</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_date" name="paydate" type="text" readonly="readonly">
									<span style="color: blue;" id="message"></span>
								</div>
							</div>
							<br>
							<br>
							<hr>
							<span>>결제 정보</span>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">카드종류</label>
								<div class="col-sm-9 col-xs-12">
									<select class="form-control" id="rs_daterange" name="cardCom">
										<option value="1">삼성카드</option>
										<option value="2">현대카드</option>
										<option value="3">롯데카드</option>
										<option value="3">국민카드</option>
										<option value="3">카카오뱅크</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">카드번호</label>
								<div class="col-sm-9 col-xs-12">
									<input type="text" style="width: 60px;" name="cardNum">&nbsp;
									-&nbsp;<input type="text" style="width: 60px;" name="cardNum">&nbsp;
									-&nbsp;<input type="text" style="width: 60px;" name="cardNum">&nbsp;
									-&nbsp;<input type="text" style="width: 60px;" name="cardNum">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">할부개월</label>
								<div class="col-sm-9 col-xs-12">
									<select class="form-control" id="rs_daterange" name="mon">
										<option value="1">일시불</option>
										<option value="2">3개월</option>
										<option value="3">6개월</option>
										<option value="3">1년</option>
										<option value="3">3년</option>
									</select>
								</div>
							</div>
						</form> 
</div>
<div class="modal-footer">
					 <div id="res" style="display:none;">
          			
          			<button type="button" class="btn btn-default" data-dismiss="modal">결제취소</button>
					 </div>
					 <div id="pay" style="display:block;">
          			<button type="button" id="paybtn" class="btn btn-primary antosubmit" data-dismiss="modal" onclick="check();">결제하기</button>
          			
					 </div>
        </div>					
						