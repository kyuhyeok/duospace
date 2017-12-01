<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<style type="text/css">


 ul,li{list-style:none} 
.tab{overflow:hidden} 
.tab li{float:left;width:63px;border:1px solid #fff} 
.tab li a{display:block;width:100%;height:50px;line-height:50px;text-align:center} 
.con_wrap{position:relative;height:200px;border:1px solid red} 
.con_wrap div{position:absolute;left:0;top:0;} 
.con_wrap div:nth-child(2){display:none} 
.con_wrap div:nth-child(3){display:none} 
.con_wrap div:nth-child(4){display:none} 

</style>


<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function formCheck() {
	var f=document.allForm;
    var title = f.title.value;
    if (title == null || title == "") {
        alert('클럽 이름을 입력하세요');
        f.title.focus();
        return;
    }
    
    $(function(){
    	$('.tab li').click(function(){
    		
    		var tabType=$(this).index();
    		
    		$('.tab li').each(function(index){
    		$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_off','_on'));
    		if(tabType != index){
    			$(this).find('img').attr('src', $(this).find('img').attr('src').replace('_on','_off'));
    		}
    		});
    		
    		$('.con_wrap>div').eq(tabType).show().siblings('div').hide();
    	});
    });	
    
}

</script>


<div style="width: 1100px; height: 800px; " align="center">
	<h2>밴드이름</h2>
	<div>
	  	<input type=text name="test" value="" size=20 maxlength=20 placeholder="클럽 이름 입력">
	    <input type=button value="동현" onclick="formCheck();">
	</div>
	<div style="border-collapse: collapse; border: 1px solid #eee;" align="center">
		<a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/2.JPG"/>
    	</a>

    	<a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/4.JPG"/>
    	</a>

  		 <a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/5.JPG"/>
    	</a>
 		 <a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/6.JPG"/>
    	</a>
    	 <a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/7.JPG"/>
    	</a>
    	<br>
    	 <a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/8.JPG"/>
    	</a>
    	<a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/9.JPG"/>
    	</a>
    	<a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/10.JPG"/>
    	</a>
    	<a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/11.JPG"/>
    	</a>
    	<a href="#">
	    	<img style="width: 200px;height:200px;"src="<%=cp%>/resource/images/12.JPG"/>
    	</a>
    	
	</div>
</div>



