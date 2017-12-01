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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>직원 관리</title>

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<!-- 우편번호 검색 서비스 -->
<script	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

<!-- 날짜Jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<script type="text/javascript">
	function selHandling(e) {
		var r_cpdcpid = $(this).val();

		$('#r_mbdpid option:gt(0)').remove();
		var param = 'r_cpdcpid=' + r_cpdcpid;

		var options = {
			data : param,
			error : function(xhr, textStatus, error) {
				alert(error);
			},
			success : function(data) {
				for (var i = 0, n = data.length; i < n; i++) {
					$('#r_mbdpid').append(
							'<option value="'+data[i].cpd_id+'">'
									+ data[i].cpd_name + '</option>');
				}
			},
			type : 'POST',
			url : '/companydepartment/bo/companydepartmentlistjson'
		}
		dataAjax(options);
	}

	function dataAdd() {
		handling.submit('', 'memberadd');
	}

	function dataAjax(options) {
		$.ajax(options);
	}

	function dataEdit() {
		handling.submit('', 'memberedit');
	}

	function dataDel() {
		handling.submit('', 'memberdel');
	}

	function dataDown() {
		handling.submit('', 'memberdel');
	}

	function dataIn() {
		handling.submit('', 'memberin');
	}

	function dataView() {
		handling.submit('', 'memberview');
	}

	function dataList() {
		handling.submit('', 'memberlist');
	}

	function dataSort() {
		handling.submit('', 'memberlist');
	}

	function dataUp() {
		handling.submit('', 'memberup');
	}

	function formSubmit(fName, url) {
		handling.submit(fName, url);
	}

	function pager(fName, url) {
		$('input[name="r_page"]').val(r_page);
		handling.submit(fName, url);
	}

	function pageMove(fName, url) {
		handling.pageMove(url, param);
	}

	function idconfirm() {
		var r_mbidVal = $('#r_mbid').val();
		if (r_mbidVal == '') {
			alert('아이디를 입력해주세요');
			return;
		}
		$.get('idconfirm', {
			r_mbid : r_mbidVal
		}).done(function(data) {
			if ('false' == data) {
				$('#dialog').dialog('open');
				$('#dialog').dialog({
					buttons : [ {
						text : '사용하기',
						click : function() {
							idreadonly('readonly="readonly"');
							$(this).dialog('close');
						}
					} ]
				});
				$('#dialog').html('사용가능한 아이디입니다.');
			} else {
				$('#dialog').dialog('open');
				$('#dialog').dialog({
					buttons : [ {
						text : '닫기',
						click : function() {
							$(this).dialog('close');
						}
					} ]
				});
				$('#dialog').html('이미 등록 된 아이디입니다.');
			}
		});
	}

	function idreadonly(readyn) {
		$('#r_mbid').attr('readonly', readyn);
	}

	function getZipcode() {
		daum.postcode
				.load(function() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									document.getElementsByName("r_mbzipcode")[0].value = data.zonecode;
									document.getElementsByName("r_mbaddr1")[0].value = data.roadAddress;
								}
							}).open();
				});
	}
</script>

</head>
<body style="width: 900px; margin: 20px auto 0px;" >

	<h3>회원등록</h3>

	<ul class="nav navbar-right panel_toolbox">
		<li><a class="collapse-link"> <i class="fa fa-chevron-up"></i>
		</a></li>
		<li><a class="close-link"> <i class="fa fa-close"></i>
		</a></li>
	</ul>
	<div class="clearfix"></div>

	<div class="x_content">
		<form class="form-horizontal form-label-left" action="memberin"
			method="post" name="frm" id="frm">
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbid">아이디</label>
				<div class="col-sm-3 col-xs-12">
					<input type="text" class="form-control" onclick="idreadonly(null)"
						placeholder="아이디" id="r_mbid" name="r_mbid" value="">
				</div>
				<div class="col-sm-3 col-xs-12">
					<button type="button" class="btn btn-warning" onclick="idconfirm()">아이디중복체크</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbname">이름</label>
				<div class="col-sm-3 col-xs-12">
					<input type="text" class="form-control" placeholder="이름"
						id="r_mbname" name="r_mbname" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbpswd">비밀번호</label>
				<div class="col-sm-3 col-xs-12">
					<input type="password" class="form-control" placeholder="비밀번호"
						id="r_mbpswd" name="r_mbpswd" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbpswd">암호확인</label>
				<div class="col-sm-3 col-xs-12">
					<input type="password" class="form-control" placeholder="비밀번호확인"
						id="r_mbpswd" name="r_mbpswd" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbzipcode">우편번호</label>
				<div class="col-sm-3 col-xs-12">
					<input type="text" class="form-control" readonly="readonly"
						placeholder="우편번호" id="r_mbzipcode" name="r_mbzipcode" value="">
				</div>
				<div class="col-sm-3 col-xs-12">
					<button type="button" class="btn btn-round btn-info"
						onclick="getZipcode();">우편번호 검색</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbaddr1">기본주소</label>
				<div class="col-sm-8 col-xs-12">
					<input type="text" class="form-control" readonly="readonly"
						placeholder="기본주소" id="r_mbaddr1" name="r_mbaddr1" value="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbaddr2">상세주소</label>
				<div class="col-sm-8 col-xs-12">
					<input type="text" class="form-control" placeholder="상세주소"
						id="r_mbaddr2" name="r_mbaddr2" value="">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbemail">이메일</label>
				<div class="col-sm-6 col-xs-12">
					<input type="text" class="form-control" placeholder="이메일"
						id="r_mbemail" name="r_mbemail" value="">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbphone">휴대폰</label>
				<div class="col-sm-6 col-xs-12">
					<input type="text" class="form-control" placeholder="휴대폰"
						id="r_mbphone" name="r_mbphone" value="">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbtel">전화번호</label>
				<div class="col-sm-6 col-xs-12">
					<input type="text" class="form-control" placeholder="전화번호"
						id="r_mbtel" name="r_mbtel" value="">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbbirth">생년월일</label>
				<div class="col-sm-4 col-xs-12">
					<input type="text" class="form-control" placeholder="생년월일"
						id="datepicker" name="r_mbbirth" readonly="readonly" value="">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbsex">성별</label>
				<div class="col-sm-10 col-xs-12">
					<label class="radio-inline"><input name="r_mbsex"
						type="radio" value="1" checked="checked" />남성</label> <label
						class="radio-inline"><input name="r_mbsex" type="radio"
						value="2" />여성</label>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbemailuse">이메일수신여부</label>
				<div class="col-sm-10 col-xs-12">
					<label class="radio-inline"><input name="r_mbemailuse"
						type="radio" value="Y" checked="checked" />YES</label> <label
						class="radio-inline"><input name="r_mbemailuse"
						type="radio" value="N" />NO</label>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbsmsuse">문자수신여부</label>
				<div class="col-sm-10 col-xs-12">
					<label class="radio-inline"><input name="r_mbsmsuse"
						type="radio" value="Y" checked="checked" />YES</label> <label
						class="radio-inline"><input name="r_mbsmsuse" type="radio"
						value="N" />NO</label>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbuse">회원등급</label>
				<div class="col-sm-3 col-xs-12">
					<select class="form-control" name="r_mbmbgid">

						<option value="N">일반회원</option>

						<option value="A">직원</option>

						<option value="B">관리자</option>

					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-xs-12"
					for="r_mbuse">사용여부</label>
				<div class="col-md-10 col-sm-10 col-xs-12">
					<label class="radio-inline"><input name="r_mbuse"
						type="radio" value="Y" checked="checked" />YES</label> <label
						class="radio-inline"><input name="r_mbuse" type="radio"
						value="N" />NO</label>
				</div>
			</div>

			<div class="ln_solid"></div>

			<div class="form-group">
				<div
					class="col-md-10 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-2">
					<button type="button" class="btn btn-success btn-sm"
						onclick="dataIn()">
						<i class="fa fa-save"></i> 저장
					</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="dataList()">
						<i class="fa fa-list-ul"></i> 리스트
					</button>
				</div>
			</div>

			<br />

		</form>
	</div>

		<div id="dialog" title="아이디 중복 체크 결과"></div>
</body>

</html>