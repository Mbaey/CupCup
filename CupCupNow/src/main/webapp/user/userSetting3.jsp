<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人设置-我的影评</title>
<link rel="stylesheet" href="css/grsz.css" />
<link rel="stylesheet" href="../css/booNavigation.css">
<link rel="bookmark"   type="image/x-icon"  href="imgs/my.ico"/>
<link rel="shortcut icon" href="imgs/my.ico">
<script src="../js/jquery-1.8.2.min.js"></script>
<style type="text/css">
..div1 {
	width: 90%;
	height: 650px;
	float: right;
}

.div2 {
	width: 650px;
	height: 650px;
	margin-right: -670px;
	margin-top: -260px;
	float: right;
	border: 1px solid #E6E6FA;
}

.upfilebox {
	position: relative;
}

</style>
</head>
		<jsp:include page="title.jsp"></jsp:include>
<body>

	<div class="div1">
		<div style="width: 150px;; height: 650px; border: 1px solid #E6E6FA;">
			<h1
				style="height: 40px; color: black; text-align: center; font-size: 22px;">我的设置</h1>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 30px;">
				<p>
					<a href="userSetting1.jsp"> <br />基本设置
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p>
					<a href="userSetting2.jsp"> <br />观影历史
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: #FF6347; font-size: 17px; color: white; text-align: center; margin-top: -20px;">
				<p>
					<br />我的影评
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p>
					<a href="../index.jsp"> <br />返回主页
					</a>
				</p>
			</div>
			<div class="div2">
				<h2 style="font-size: 19px; color: #FF6347; text-align: center">
					<br />我的影评

				</h2><a href="deleteController?op=userping"><span style="height: 30px; width: 40px;background-color:#FF6347;color: #fff;margin-left: 500px; ">刷新</span></a>
			
				<table border="0" ; align="center" ; cellspacing="20"
					;
					style="font-size: 13px;"  class="table table-bordered">
					<tr>
						<th>编号</th>
						<th>影片名</th>
						<th>影评标题</th>
						<th>影评内容</th>
						<th>发表时间</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${comment}" var="scomment">
					<tr>
						<td style="text-align: center;">${scomment.m_id }</td>
						<td>${scomment.m_title }</td>
						<td>${scomment.c_title }</td>
						<td style="text- overflow:ellipsis;">${scomment.c_content}</td>
						<td>${scomment.timestamp }</td>
						<td><a href="deleteController?op=deleteping&c_id=${scomment.c_id}">删除</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="footer">
		<iframe frameborder=0 width="100%" height="320px" scrolling="no"
			src="footer.html"></iframe>

	</div>

</body>
</html>