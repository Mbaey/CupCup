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
	<div style="height: 1500px; background-color: #F1F7F7">
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
				<p>
					<a href="help3.jsp">用户常见问题</a>
				</p>
				<p>影城取票</p>
				<p>
					<a href="help5.jsp">购票常见问题</a>
				</p>
			</div>
			<div style="width: 70%; float: right;">
				<h3>影城取票</h3>
				<br>
				<img src="img/help4.png" style="width: 700px; height: 1300px;">
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>