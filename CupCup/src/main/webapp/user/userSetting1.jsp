<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人设置-基本设置</title>
<link rel="stylesheet" href="css/grsz.css" />
<link rel="stylesheet" href="../css/booNavigation.css">
<link rel="bookmark" type="image/x-icon" href="imgs/my.ico" />
<link rel="shortcut icon" href="imgs/my.ico">
<script src="../js/jquery-1.8.2.min.js"></script>
</head>
<jsp:include page="../public/title.jsp"></jsp:include>
<body>
	<div class="div1">
		<div style="width: 150px;; height: 650px; border: 1px solid #E6E6FA;">
			<h1
				style="height: 40px; color: black; text-align: center; font-size: 22px;">我的设置</h1>
			<div
				style="height: 60px; background-color: #FF6347; font-size: 17px; color: white; text-align: center; margin-top: 30px;">
				<p>
					<br />基本设置
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
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p>
					<a href="userSetting3.jsp"> <br />我的影评
					</a>
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
					<br />基本设置
				</h2>
				<br> <br> <br>
				<form action="deleteController?op=Setting" method="post"
					enctype="multipart/form-data">
					<div style="float: left margin-top: -20px;">
						<img src="../img/sz1.png"
							style="width: 200px; height: 200px; margin-left: 50px;" /> <br>
						<br> <br>
						<div class="upfilebox" style="width: 375px; height: 200px;">
							<div style="width: 200px; height: 200px; margin-top: -150px;">
								<img src="" id="img0"
									style="width: 200px; height: 200px; margin-left: 50px; margin-top: -100px">
								<br> <br> <label>上传图片 <input name="file"
									id="file0" multiple="multiple" type="file"
									style="display: inline-block;" />

								</label>

							</div>
						</div>
						<br />
						<div
							style="width: 170px; font-size: 10px; color: #999; margin-left: 70px;">支持JPG,JPEG,PNG格式,且文件需小于1M</div>
					</div>
					<div
						style="width: 400px; float: left; margin-top: -345px; margin-left: 300px; border: 1px solid #FFF; font-size: 15px;">
						<br /> <br />

						昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:&nbsp;&nbsp;&nbsp; <input
							style="width: 200px; height: 20px;" name="nickname" type="text" />
						<br /> <br />
						性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="sex" type="radio" value="male" />男
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="sex"
							type="radio" value="female" />女 <br /> <br />
						修改密码:&nbsp;&nbsp;&nbsp; <input style="width: 200px; height: 20px;"
							name="userpwd" type="password" /> <br /> <br />
						电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:&nbsp;&nbsp;&nbsp; <input
							style="width: 200px; height: 20px;" name="tel" type="text" /> <br>
						<br>

						邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;&nbsp; <input
							style="width: 200px; height: 20px;" name="email" type="text" />

						<br>
						<br>
						<input type="submit" value="提交" class="sth"
							style="margin-top: -10px;">
				</form>

			</div>


		</div>


	</div>
	</div>
	</div>
	<div class="footer">
		<iframe frameborder=0 width="100%" height="320px" scrolling="no"
			src="../public/footer.html"></iframe>
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
	</script>
</body>
</html>