<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div style="text-align: center; margin-left: -100px;">
			<h1>欢迎您，管理员</h1>
		</div>
			<div style="width: 150px;; height: 650px; border: 1px solid #E6E6FA;">
			<h1
				style="height: 40px; color: black; text-align: center; font-size: 22px;">我的设置</h1>
			<div
				style="margin-top:5px; height:60px;border-radius:20px; background-color: #FF6347; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margfirst.jsp"><br />影片增加</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margscond.jsp"> <br />影片删除
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margthird.jsp"> <br />场次增加
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margfourth.jsp"><br />用户删除</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margsixth.jsp"><br />影评删除</a>
				</p>
			</div>
			<div class="div2" style="margin-top:-290px;">
				<h2 style="font-size: 19px; color: #FF6347; text-align: center">
					<br />影片添加<br>
				</h2>

				<form action="mgrController?op=addmovie" method="post" enctype="multipart/form-data">
					
						 
				<div class="input-group" style="width:300px;outline-style: none; margin-top:15px; margin-left:300px;">
					<input type="text" name="title" class="form-control" placeholder="请添加新电影" style="border-radius:20px; border-color:#ef4238; outline-style: none; margin-bottom:10px;">
                  
                    <input type="text" name="director" class="form-control" placeholder="请添加电影导演" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                     
                    <input type="text" name="rate" class="form-control" placeholder="请输入豆瓣评分" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                    <input type="text"  name="adaptor" class="form-control" placeholder="请添加电影编剧" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                    <input type="text"  name="casts" class="form-control" placeholder="请添加电影主演" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                    <input type="text" name="type" class="form-control" placeholder="请添加电影的类型" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                     <input type="text" name="date" class="form-control" placeholder="请选择上映日期" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                      <input type="text" name="timelen" class="form-control" placeholder="请添加上映片长" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                      <input type="text" name="summary" class="form-control" placeholder="请添加影片简介" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:10px;">
                    
				
			</div>
            <div class="tupian" style="margin-top: -190px;">
         
                   <img src="" id="img0"
									style="width: 200px; height: 250px; margin-left: 50px; margin-top: -100px">
								<br> <br> 
								<label>上传图片 <input name="cover"
									id="file0" multiple="multiple" type="file"
									style="display: inline-block;" />

								</label>
								<input type="submit" style="margin-left:200px; height:30px; margin-top:15px;" 
							value="确定添加" class="sth">
							<c:forEach items="${yes}">
							<c:if test="${yes != null }">
							  <span style="color: red; font-size: 18px;" id ="success">添加成功!</span>
							</c:if>
							   
							</c:forEach>
				
				</form>
			</div>
		</div>
	</div>
	<div class="footer">
		<iframe frameborder=0 width="100%" height="320px" scrolling="no"
			src="footer.html"></iframe>

	</div>
	<script>
		$("#file0").change(function() {
			var objUrl = getObjectURL(this.files[0]);
			console.log("objUrl = " + objUrl);
			if (objUrl) {
				$("#img0").attr("src", objUrl);
			}
		});
		//建立一個可存取到該file的url
		function getObjectURL(file) {
			var url = null;
			if (window.createObjectURL != undefined) { // basic
				url = window.createObjectURL(file);
			} else if (window.webkitURL != undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		}
		
		$(".form-control").click(function(){
			  $("#success").css("display", "none");
		});
	</script>
	
</body>
</html>
