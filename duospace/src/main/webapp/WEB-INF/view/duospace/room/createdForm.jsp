<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function() {
	$("#rs_date").datepicker({
		minDate: 0,
		altFormat: "yyyy-mm-dd"
	});
});
function Spot(num) {
	var res=document.getElementById("res");
	var pay=document.getElementById("pay");

	if(num==0){
		res.style.display="none";
		pay.style.display="block";
	}else{
		res.style.display="block";
		pay.style.display="none";
	}
}

function reservCount(roomCode,startDate,endDate) {
	var roomCode=$("#roomCode").val();
	var startDate=$("#rs_date").val();
	var endDate=$("#rs_date2").val();
	
	var url="<%=cp%>/reservCount";
	var p="roomCode="+roomCode+"&startDate="+startDate+"&endDate="+endDate;
	
	$.ajax({
		type:"post"
		,url:url
		,data:p
		,dataType:"json"
		,success:function(data){
				var reservCount=data.reservCount;
				
				if(reservCount >=1){
					$("#message").html("<span> 현재 날짜는 예약 또는 결제가</span><span style='color:red;'> 불가능 </span><span>합니다.</span>");
					$("#reservbtn").attr('disabled',true);
					$("#paybtn").attr('disabled',true);
					
				}else{
					$("#message").html("<span> 예약이 가능합니다.</span>");
					$("#reservbtn").attr('disabled',false);
					$("#paybtn").attr('disabled',false);
				}
			
		}
		,error:function (e) {
			alert(e.responseText);
		}
	});
}

</script>
<div id="newmodal" style="padding: 5px 20px;">
						<form class="form-horizontal calender" id="modalForm" name="modalForm" role="form">
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">룸 이름</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" type="text" readonly="readonly" name="roomName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label"> 층 </label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" type="text" readonly="readonly" name="floorName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">시작일</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_date" name="startDate" type="text" onchange="inputChange(this); reservCount();" value="${dto.startDate}">
									<span style="color: blue;" id="message"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">이용기간</label>
								<div class="col-sm-9 col-xs-12">
									<select class="form-control" id="rs_daterange" name="rs_daterange" onchange="javascript:selectDate(this);">
										<option value="1">1개월</option>
										<option value="2">6개월</option>
										<option value="3">1년</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">종료일</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_date2" name="endDate" type="text" readonly="readonly" value="${dto.endDate}"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">인원수</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_people" name="people" type="text" value="${dto.people}"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">성 함*</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_name" name="userName" type="text" value="${dto.userName}"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">연락처*</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_phone" name="tel" type="text" value="${dto.tel}"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">예약구분</label>
								<div class="col-sm-9 col-xs-12">
									<input id="rs_web" name="signSpot" type="radio" value="0" checked="checked" ${dto.signSpot} onclick="Spot('0');"/>웹
									<input id="rs_scene" name="signSpot" type="radio" value="1" ${dto.signSpot} onclick="Spot('1');" />현장
							</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">가격</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_price" name="price" type="text" readonly="readonly" ${dto.price}/>
								</div>
							</div>
							<input type="hidden" id="roomCode" name="roomCode" value="${dto.roomCode}">
							<input type="hidden" id="prices" name="prices" readonly="readonly">
						</form> 
					</div>
					 <div class="modal-footer">
					 <div id="res" style="display:none;">
          			<button type="button" id="reservbtn" class="btn btn-primary antosubmit" data-dismiss="modal" onclick="SendOk();">예약</button>
          			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="Dialogcancel();">Close</button>
					 </div>
					 <div id="pay" style="display:block;">
          			<button type="button" id="paybtn" class="btn btn-primary antosubmit" data-dismiss="modal" onclick="CheckOk();">결제</button>
          			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="Dialogcancel();">Close</button>
					 </div>
        			</div>