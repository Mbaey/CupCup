<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>帮助中心-用户登陆</title>
<style type="text/css">
a {
	text-decoration: none;
	color: #999;
}

.font {
	font-size: 12px;
	color: #999;
}
</style>
</head>
<jsp:include page="title.jsp"></jsp:include>
<body>
	<div style="height: 500px; background-color: #F1F7F7">
		<div style="width: 70%; margin: 0px auto;">
			<div
				style="width: 20%; border: 1px solid #999; font-size: 20px; text-align: center; display: inline-block;">
				<div
					style="height: 70px; background-color: #666; font-size: 30px; text-align: center; line-height: 70px">帮助中心</div>
				<p>
					<a href="help1.jsp">新用户注册</a>
				</p>
				<p>
					<a href="help2.jsp">用户登陆</a>
				</p>
				<p>用户常见问题</p>
				<p>
					<a href="help4.jsp">影城取票</a>
				</p>
				<p>
					<a href="help5.jsp">购票常见问题</a>
				</p>
			</div>
			<div style="width: 70%; float: right;">
				<h3>用户常见问题</h3>
				<br>
				<p>1.如何登录？</p>
				<p class="font">点击网页上方【登录】进入登录页面，输入您的用户名、密码进行登录。</p><br>
				<p>2.如何注册？</p>
				<p class="font">点击网页上方【注册】进入注册页面。填写正确的注册信息即可完成注册。</p><br>
				<p>3.注册提示密码错误怎么办？</p>
				<p class="font">可能是您输入的密码不符合密码格式，密码由6-20位字母和数字组成。</p><br>
				<p>4.注册时提示邮箱已验证怎么办？</p>
				<p class="font">说明该邮箱已注册。</p>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>