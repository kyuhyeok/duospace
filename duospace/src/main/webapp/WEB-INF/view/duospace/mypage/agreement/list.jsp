<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
textarea{
	background-color: #eee;
    opacity: 1;
    height: auto;
    width: 100%;
    overflow: auto;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-10">
					<div class="row">
						<div class="col-sm-12">
							<h2>이용 약관</h2>
							<hr>
						</div>
						<div>
							<textarea readonly="readonly">
								이용 약관				
				
				
여러가지 내용들이 나옵니다!
							</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>