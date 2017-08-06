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
	<jsp:include page="../title.jsp"></jsp:include>
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
				style="margin-top:5px; height:60px;border-radius:20px; background-color: #FF6347; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
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
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margsixth.jsp"><br />影评删除</a>
				</p>
			</div>
			<div class="div2" style="margin-top:-300px;">
				<h2 style="font-size: 19px; color: #FF6347; text-align: center">
					<a href="mgrController?op=showallscene"><br />场次展示<br></a>
				</h2>
				<table class="table table-bordered">
  <caption>边框表格布局</caption>
  <thead>
    <tr>
      <th>电影名</th>
      <th>开始时间</th>
      <th>结束时间</th>
      <th>放映厅</th>
      <th>价格</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${pageBean.pageDatas}" var="scene">
    <tr>
      <td>${scene.m_title }</td>
      <td>${scene.s_time }</td>
      <td>${scene.e_time }</td>
      <td>${scene.hall_id }</td>
      <td>${scene.price }</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    
    <%--分页开始 --%>				
				<div style="margin-top: 300px; margin-left: 200px;">
					<span><a style="color: #000;"
						href="mgrController?op=showallscene&page=1">首页</a></span>
					<c:if test="${pageBean.havePrePage }">
						<span><a style="color: #000;"
							href="mgrController?op=showallscene&page=${pageBean.pageNum-1}">上一页</a></span>
					</c:if>
					<span>第${pageBean.pageNum}页</span>
					<form action="mgrController?op=showallscene"
						style="display: inline-block;" method="post">
						<input type="text" name="page"  style=" border-color: #000; color: #000; width: 70px;outline-style: none;"><input style="border-radius:90px;outline-style: none;background-color: #fff; border-color: #000; color: #ef4238;" type="submit"
							value=" go ">
					</form>
					<c:if test="${pageBean.haveNextPage}">
						<span><a style="color: #000;"
							href="mgrController?op=showallscene&page=${pageBean.pageNum+1}">下一页</a></span>
					</c:if>
					<span><a style="color: #000;"
						href="mgrController?op=showallscene&page=${pageBean.totalPages}">最后一页</a></span>
				</div>
				<%--分页结束 --%>

				
				
			</div>
		</div>
	</div>
	
</body>
</html>