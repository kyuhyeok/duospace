<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
$(function() {
	var socket=null;
	
})

</script>
<div style="float: left;margin-left: 20px;margin-bottom: 12px;">
	<!-- 채팅DIV -->
	<div>
		<div style="width: 240px;height: 34px;background: #fff; border-bottom: 1px solid #efefef;">
			<div align="left" style="width: 110px; float: left; margin-top: 5px;margin-left: 10px;">
				 채팅 
			</div>
			
			<div style="float: right; margin-right: 15px;margin-top:5px;">
				 <a>새 채팅</a> 
			</div>
			
		</div>
		<div style="border-top: 1px solid #ccc; width: 240px; height: 63px; background: #fff; ">
			<a>
			
			</a>
		</div>
	</div>
</div>