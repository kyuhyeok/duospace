<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<style type="text/css">
a.list-group-item:focus, a.list-group-item:hover, button.list-group-item:focus, button.list-group-item:hover {
	background-color: #FFF7DC;
}
</style>
<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(! idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>


<div class="list-group">
       <div class="list-group-item lefthead" style="background-color: #D7DADB;color: #2C3E50;font-weight: bold;"><i></i> 고객센터</div>
       <a href="<%=cp%>/duospace/notice/list" class="list-group-item">공지사항</a>
       <a href="<%=cp%>/duospace/faq" class="list-group-item">자주묻는질문</a>
       <a href="<%=cp%>/duospace/qna/list" class="list-group-item">1:1 문의</a>
       
</div>
