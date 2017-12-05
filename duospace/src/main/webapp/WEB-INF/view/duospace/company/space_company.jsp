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
ul, li{
	list-style: none;
	float:left;
}
.row {
	margin: 0px;
	background: #A6A6A6;
}
.blank{
	height: 200px;
	background: #A6A6A6;
}
.title {
	margin: 50px 0px;
	font-weight: bold;
	font-family: sans-serif;
	color: #ffffff;
	font-size: 40px;
	line-height: 1.2;
}
 
.bonm {
	width: 200px;
	font-weight: bold;
	font-family: sans-serif;
	color: #ffffff;
}
.list1 li .label span{
	display: block;
}
.list1 li .ico{
	    display: block;
    text-align: center;
}
.list1 li .label{
	display: table-cell;
    width: 150px;
    height: 70px;
    vertical-align: middle;
    text-align: center;
    font-family: sans-serif;
    font-size: 18px;
}
.list1 li .desc{
	display: block;
    font-size: 13px;
    line-height: 1.5;
    font-weight: bold;
	font-family: sans-serif;
	color: #ffffff;
}
.list1 li{
	float: left;
	margin: 10px 10px;
    width: 150px;
    height: 300px;
    line-height: 1.2;
}
.list2 li{
	margin-top:5%;
}

</style>
</head>
<body>
		<div class="row">
			<div class="col-md-3" style="background-color: #1d1d1b;">
				<div class="title" style="margin-bottom: 20%">
					<span style="color: #D9383A;">WHAT IS IT</span> <br>
					DUO <br> SPACE? <br> ㅡ
				</div>
				<div class="bonm" style="margin-bottom: 50%">
					COWORKING Duo Space는 IT 분야에서 활동 하는  사람들이 서로의 아이디어를
					공유하고 의견을 나누는 협업 공간입니다. <br><br> 개인 비즈니스의 목적 달성
					뿐만 아니라 다른 사람들과의 협업과 공유를 통해 새로운 가치를 만들어 나가는
					창조적 Life style 을 지향합니다.
				</div>
			</div>
			<div class="col-md-9" style="background: #5D5D5D; ">
				<div class="title" style="margin-bottom: 5%;">
					<span style="color:#1d1d1b;">User</span><br>
					BENEFIT<br>
				</div>
				<ul class="list1">
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_01.png">
						</span>
						<span class="label">
							<span>COST</span>
							SAVING
						</span>
						<span class="desc">
							당신의 비즈니스를 위한 모든 것이 이미 준비되어 있습니다.
							 당신은 빛나는 아이디어와 열린 마음, 
							 불타는 의지만 가지고 오시면 됩니다.
						</span>
					</li>
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_02.png">
						</span>
						<span class="label">
							<span>INCREASED</span>
							 FOCUS
						</span>
						<span class="desc">
							쾌적한 환경과 든든한 매니저들,
							 언제든 당신에게 도움의 손길을 뻗어줄 동료들.
							  Duo Space에서 당신이 해야할 일은 당신의
							   목표에 집중하는 것 뿐입니다.
						</span>
					</li>
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_03.png">
						</span>
						<span class="label">
							<span>COST</span>
							SAVING
						</span>
						<span class="desc">
							당신의 비즈니스를 위한 모든 것이 이미 준비되어 있습니다.
							 당신은 빛나는 아이디어와 열린 마음, 
							 불타는 의지만 가지고 오시면 됩니다.
						</span>
					</li>
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_04.png">
						</span>
						<span class="label">
							<span>COLLABORATION</span>
							 OPPORTUNITIES
						</span>
						<span class="desc">
							디자이너, 개발자, 기획자 등 다양한 분야의 전문가들이
							 모여 구성원을 이루는 Duo Space에는 무궁무진한
							  협력의 기회가 널려 있습니다.
						</span>
					</li>
				</ul>
				<ul class="list1 list2" style="border-top: 2px solid #1d1d1b;">
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_05.png">
						</span>
						<span class="label">
							<span>SOCIAL</span>
							 BENEFITS
						</span>
						<span class="desc">
							우리는 협력을 통해 새로운 기회를 찾아냅니다.
							 서로가 가진 네트워크를 한데 모아 하나의 거대한
							  커뮤니티를 만들어 냅니다.
						</span>
					</li>
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_06.png">
						</span>
						<span class="label">
							<span>INCREASED</span>
							  PRODUCTIVITY
						</span>
						<span class="desc">
							자신이 원하는 시간에, 자신이 원하는 장소에서
							 자신이 원하는 일할 수 있다는 것은
							  Duo Space만이 가진 가장 큰 장점입니다.
						</span>
					</li>
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_07.png">
						</span>
						<span class="label">
							<span>DIVERSITY</span>
						</span>
						<span class="desc">
							코워킹에는 정해질 틀도, 
							고리타분한 규칙도 없습니다.
							 우리는 서로의 다른 점을 존중해가며
							  최고의 결과를 만들어 냅니다.
						</span>
					</li>
					<li>
						<span class="ico">
							<img src="<%=cp%>/resource/images/duospace/comp/ico_set_03_08.png">
						</span>
						<span class="label">
							<span>SHARED</span>
							  IDEA
						</span>
						<span class="desc">
							코워커들은 라이벌이 아니라 동료입니다.
							 자유롭게 아이디어를 공유하고 주고 받는
							  과정에서 봉착한 난관을 현명하게 해결할 수 있습니다.
						</span>
					</li>
				</ul>
				</div>
			</div>
</body>
</html>
