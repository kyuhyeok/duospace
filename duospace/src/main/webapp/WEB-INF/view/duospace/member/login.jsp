<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
*:focus {
  outline: none;
}

#login-box {
  position: relative;
  margin: 5% auto;
  width: 600px;
  height: 400px;
  background: #FFFFFF;
  border-radius: 2px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

.left {
  position: absolute;
  top: 0;
  left: 0;
  box-sizing: border-box;
  padding: 40px 30px 40px 40px;
  width: 300px;
  height: 400px;
}

h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 28px;
}

input[type="text"],
input[type="password"] {
  display: block;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  border: none;
  border-bottom: 1px solid #AAA;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
  font-size: 15px;
  transition: 0.2s ease;
}

input[type="text"]:focus,
input[type="password"]:focus {
  border-bottom: 2px solid #172A40;
  color: #172A40;
  transition: 0.2s ease;
}

input[type="button"]{
  margin-top: 20px;
  width: 120px;
  height: 32px;
  background: #172A40;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  text-transform: uppercase;
  transition: 0.1s ease;
  cursor: pointer;
}

input[type="button"]:hover,
input[type="button"]:focus {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

input[type="button"]:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}


.right {
  position: absolute;
  top: 0;
  right: 0;
  box-sizing: border-box;
  padding: 40px;
  width: 300px;
  height: 400px;
  background: url('<%=cp%>/resource/images/duospace/IMG_6958.jpg');
  background-size: cover;
  background-position: center;
  border-radius: 0 2px 2px 0;
}

.right .loginwith {
  display: block;
  margin-bottom: 40px;
  font-size: 28px;
  color: #FFFFFF;
  text-align: center;
}
.login-bottom a:link {
	text-decoration: none; color: #172A40;
}
.login-bottom a:visited {
	text-decoration: none; color: #172A40;
}
.login-bottom a:active {
	text-decoration: none; color: #172A40;
}
.login-bottom a:hover {
	text-decoration: none; color: #D9383A;
}
.login-bottom a{
	font-family: sans-serif;
	font-size: 13px;
}
</style>

<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login";
	f.submit();
	}
</script>
<div class="bodyFrame">

<div id="login-box" style="margin-top: 8%; margin-bottom: 10%;">
  <div class="left">
    <h1>LOG IN</h1>
    
    
    <form method="post" name="loginForm">
    <input type="text" name="userId" placeholder="E-mail" style="margin-top: 70px; outline-style: none" />
    <input type="password" name="userPwd" placeholder="Password" />

    
    <input type="button" name="signup_submit" onclick="sendLogin()" value="LOG IN" style="margin-left: 50px;"/>
    
    <div style="margin-top: 30px;" class="login-bottom">
    <a href="<%=cp%>/member/member">회원가입</a> |
    <a href="#">비밀번호찾기</a> |
    <a href="#">아이디찾기</a>
    
	</div>	
	</form>
	
  </div>
  
  <div class="right">
    
    
  </div>

</div>
</div>