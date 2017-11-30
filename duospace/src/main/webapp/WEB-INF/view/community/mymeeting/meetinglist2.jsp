<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<header>
	<div style="width: 100%; height: 30px; border-top: 1px solid #ccc; background: #ccc;" align="center">
		<table> 
			<tr>
				<td style="padding: 0px 20px;">
					<a>전체글</a>
				</td>
				<td style="padding: 0px 20px;">
					<a>
						사진첩
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a>
						일정
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a>
						멤버
					</a>
				</td>
			</tr>
		</table>
	</div>
</header>
<div style="width: 100%; min-height: 800px;background:#E0FFDB;">
	<div style="height: 35px;">
	</div>
	<div style="width: 1200px;min-height: 800px; margin: auto;">
			<!-- 프로필 -->
			<div style="vertical-align: top;margin-right: 20px;float: left">
				<img src="<%=cp%>/resource/images/2.JPG" style="width:180px;height: 100px; ">
				<h3>자바</h3>
				<span>멤버 1</span>&nbsp;&nbsp;<a>초대</a>
				<hr>
			</div>
			<!-- 전체글 -->
			<div style="float: left ">
				<div style="width: 550px; height:30px; margin-bottom: 12px; background: #ffffff;border-style: outset;vertical-align: middle;">
					<input type="text" placeholder="글 내용,#태그,@작성자 검색" style="width: 500px; border: none;margin-left: 20px;">
				</div>
				<div style="width: 550px; margin-bottom: 12px; background: #ffffff;border-style: outset;">
					<div style="width: 550px;height: 80px;padding: 30px;">
							멤버들에게 전할소식을 남겨주세요
					</div>
					<div>
						<table>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- 새글 올라올곳.. -->
				<div style="margin-bottom: 11px;background-color: #fff; border-style: outset;">
					<div style="outline: 0;box-sizing: border-box;">
						<div style="box-sizing: border-box;">
							<div style="position:relative; padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;">
								<a class="profileInner">
									<img src="<%=cp%>/resource/images/2.JPG" style="width: 40px;height: 40px;">
								</a>
								<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
									<span style="display: block; overflow: hidden; max-width: 100%;box-sizing: border-box;">
										<strong style="font-size: 14px; font-weight: 700;clear: #999;">
											윤숭열
										</strong>
									</span>
									<time style="margin-top: 2px;font-size: 12px;font-weight: 400;color: #999;">
									</time>
								</span>
								<span>memo</span>
								윤숭열,올린시간...
							</div>
							<div>
								글 리스트...
							</div>
						</div>
					</div>
				</div>
				<div style="width: 550px;min-height: 300px; margin-bottom: 12px; background: #ffffff;border-style: outset;">
					<div>
						글 리스트...
					</div>
				</div>
				
			</div>
			<!-- 사이드. -->
			<div style="float: left;margin-left: 20px;">
				<div style="width: 240px;height: 300px;background: #fff;">
					
					<div align="left" style="width: 110px;">
						 채팅 <a>새 채팅</a> 
					</div>
				
				</div>
			</div>
	</div>
</div>


