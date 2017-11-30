<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 
<script type="text/javascript">
var ESCAPED_FRAGMENT_REGEXP = /[\?&]_escaped_fragment_=([^&]*)/g;

(function init() {
    require(['app_base'],function(){
        require(['_band_libs/jackpotLog/JackpotLogger'], function(JackpotLogger) {
            var SEOUri = null;
            var currentUri = location.href;

            // 기존 hashbang URI -> 신규 URI로 변경
            if (currentUri.indexOf('#!') > 0 ) {
                JackpotLogger.sendReferrerLog(JackpotLogger.PRODUCT_CODE.BAND_WEB_PC, document.referrer);
                location.replace(currentUri.replace(/\/?#!\/?/gi, '/'));
                return;
            }

            var escapedFragment = ESCAPED_FRAGMENT_REGEXP.exec(currentUri);

            // hashbang으로 전환 for SEO
            if ( escapedFragment != null && escapedFragment[1] != null ) {
                SEOUri = escapedFragment[1];
            }

            require(['application/DApplication'],function(App){
                $(document).on('contextmenu','._prevent_context',function(){
                    return false;
                });
                $(document).on('dragstart','._prevent_context',function(){
                    return false;
                });

                App.start({bandNo: '', SEOUri : SEOUri});
            });
        });
    });
})();
</script>
 -->

<div style="background: #eef0f3"> 
	<div class="container"style="padding-bottom: 30px;">
  		<h3>내 모임/1</h3>
  		<table>
	  		<tr>
	  			<td>
					<div style="position: relative;display: block;background-color: #ffffff; width: 180px;height: 200px;margin: 30px;">
				  		<a href="<%=cp%>/community/sub/maderoom" style="display: block;position: relative;background-color: #ffffff;">
				  			<span style="display: inline-block ; padding-top: 55px;text-align: center;">
				  				<img style="width: 50px;height: 50px;"  src="<%=cp%>/resource/images/icon_plus.png">
				  			</span>
				  			<br>
				  			<span style="display: inline-block ;height: 85px;padding-top: 10px;text-align: center;">
				  				<span class="uriText">밴드 만들기</span>
				  			</span>
				  		</a>
					</div>
				</td>
				<td>
					<div style="position: relative;display: block;background-color: #ffffff; width: 180px;height: 200px;">
				  		<a href="<%=cp%>/community/mymeeting/meetinglist" style="display: block;position: relative;background-color: #ffffff;">
				  			<span style="display: inline; padding-top: 55px;text-align: center;">
				  				<img style="width: 180px;height: 100px;"  src="<%=cp%>/resource/images/2.JPG">
				  			</span>
				  			<br>
				  			<span style="display: inline-block ;height: 85px;padding-top: 10px;text-align: center;">
				  				<span>자바</span>
				  			</span>
				  		</a>
					</div>
				</td>
			</tr>
  		</table>
	</div>
</div>
<div style="background: #fff; min-height: 500px;">
<div class="container">
	<h3>공개 모임 인기글</h3>
	<div>
	</div>
</div>
</div>