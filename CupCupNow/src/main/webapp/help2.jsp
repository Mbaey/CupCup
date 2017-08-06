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
</style>
</head>
<jsp:include page="title.jsp"></jsp:include>
<body>
	<div style="height:500px; background-color: #F1F7F7">
		<div style="width: 70%; margin: 0px auto;">
			<div
				style="width: 20%; border: 1px solid #999; font-size: 20px; text-align: center; display: inline-block;">
				<div
					style="height: 70px; background-color: #666; font-size: 30px; text-align: center; line-height: 70px">帮助中心</div>
				<p>
					<a href="help1.jsp">新用户注册</a>
				</p>
				<p>用户登陆</p>
				<p>
					<a href="help3.jsp">用户常见问题</a>
				</p>
				<p>
					<a href="help4.jsp">影城取票</a>
				</p>
				<p>
					<a href="help5.jsp">购票常见问题</a>
				</p>
			</div>
			<div style="width: 70%; float: right;">
				<h3>用户登陆</h3>
				<br>
				<p>1.您可使用注册时填写的用户名,密码登陆卡噗官网。</p>
				<img src="img/help3.png" style="width: 500px; height: 300px;">
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>