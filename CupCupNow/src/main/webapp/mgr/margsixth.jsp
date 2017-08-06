<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面-影片设置</title>
<script src="../js/jquery.min.js"></script>
 <script src="../js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/booNavigation.css">
<link rel="bookmark"   type="image/x-icon"  href="imgs/my.ico"/>
<link rel="shortcut icon" href="imgs/my.ico">
     <style type="text/css">
      a{
       color:#ef4238;
    }
  
  a:hover{
			color:#000;
		
		}
		 a:active{ color: #969; }
		 a:link {
			text-decoration: none;
		}
	 a:visited {
			text-decoration: none;
		}
	 a:hover {
		text-decoration: none;
		}
	 a:active {
		text-decoration: none;
		} 
		.div1 {
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


a {
	text-decoration: none;
	color: #999;
}

.sth {
	width: 170px;
	height: 40px;
	background-color: white;
	color:black;
	margin-top:30px;
	margin-left:-70px;
	border-radius:30px 30px 30px 30px;
	cursor:pointer;
	border: 1px solid #ef4238;
}
.sth:hover {
    background-color: #ef4238;
    color: white;
}  
  </style>
</head>
	<jsp:include page="title.jsp"></jsp:include>
<body>
	<div class="div1">
		<div style="text-align: center; margin-left: -190px;">
			<h1>欢迎您，管理员</h1>
		</div>
			<div style="width: 150px;; height: 650px; border: 1px solid #E6E6FA;">
			<h1
				style="height: 40px; color: black; text-align: center; font-size: 22px;">我的设置</h1>
			<div
				style="height: 60px; background-color:white; font-size: 17px; color: black; text-align: center;">
				<p style="margin-top: -10px;margin-bottom: 20px;">
					<a href="margfirst.jsp"><br />影片增加</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p style="margin-top: 10px;">
					<a href="margscond.jsp"> <br />影片删除
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margscond.jsp"> <br />场次增加
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margfourth.jsp"><br />用户删除</a>
				</p>
			</div>
			<div
				style="margin-top:5px; height:60px;border-radius:20px; background-color: #FF6347; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margsixth.jsp"><br />影评删除</a>
				</p>
			</div>
			<div class="div2" style="margin-top:-350px;">
				<h2 style="font-size: 19px; color: #FF6347; text-align: center">
					<br />影片删除<br>
				</h2>
				<a href="mgrController?op=showcomment&title=霸王别姬"><span style="height: 30px; width: 40px;background-color:#FF6347;color: #fff;margin-left: 500px; ">刷新</span></a>

				<form action="mgrController?op=showcomment" method="post" enctype="multipart/form-data">
					
						 
				<div  class="input-group" style="width:300px;outline-style: none; margin-top:15px; margin-left:140px;">
					<input name="title" type="text" class="form-control" placeholder="请输入要删除的电影" style="border-radius:20px; border-color:#ef4238; outline-style: none; margin-bottom:10px;"> 
					<input type="submit" style="margin-left:200px; height:30px; margin-top:-5px;" 
							value="搜索" class="sth">
							</div>
							</form>
							
							<table class="table table-bordered">
  <caption>短评</caption>
  <thead>
    <tr>
      <th>用户名</th>
      <th>时间</th>
      <th>内容</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${shortComment}" var="scomment">
    <tr>
      <td>${scomment.u_name}</td>
      <td>${scomment.timestamp}</td>
      <td>${scomment.c_content}</td>
      <td><a href="mgrController?op=deleteping&c_id=${scomment.c_id }">删除</a></td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    <table class="table table-bordered">
    <caption>长评</caption>
  <thead>
    <tr>
      <th>用户名</th>
      <th>时间</th>
      <th>内容</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${longComment}" var="lcomment" varStatus="statue">
    <tr>
      <td>${lcomment.u_name}</td>
      <td>${lcomment.timestamp}</td>
      <td>${lcomment.c_title}</td>
      <td><a href="mgrController?op=deleteping&c_id=${lcomment.c_id }">删除</a></td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    
    
				
							
</body>
</html>