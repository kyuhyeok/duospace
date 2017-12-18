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

</script>
<div id="newmodal" style="padding: 5px 20px;">
						<form class="form-horizontal calender" id="modalForm" name="modalForm" role="form">
							
							<input type="hidden" name="roomCode">
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
									<input class="form-control" id="rs_date" name="startDate" type="text" onchange="inputChange(this)" value="${dto.startDate}">
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
								<label class="col-sm-3 col-xs-12 control-label">예약자명*</label>
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
									<input id="rs_web" name="signSpot" type="radio" value="0" checked="checked" ${dto.signSpot}/>웹
									<input id="rs_scene" name="signSpot" type="radio" value="1" ${dto.signSpot}/>현장
							</div>
							</div>
							<input type="hidden" name="roomCode" value="${dto.roomCode}">
						</form> 
					</div>
					 <div class="modal-footer">
          			<button type="button" class="btn btn-primary antosubmit" data-dismiss="modal" onclick="SendOk();">예약</button>
          			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="Dialogcancel();">Close</button>
        			</div>