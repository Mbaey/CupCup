<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面-观影设置</title>
<link rel="stylesheet" href="../css/susz.css" />
</head>
<body>

	<div class="div1">
		<div style="text-align: center; margin-left: -100px;">
			<h1>欢迎您，管理员</h1>
		</div>
		<div style="width: 150px;; height: 650px; border: 1px solid #E6E6FA;">
			<h1
				style="height: 40px; color: black; text-align: center; font-size: 22px;">我的设置</h1>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 30px;">
				<p>
					<a href="superuserSetting1.jsp"> <br />影片设置
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p>
					<a href="superuserSetting2.jsp"> <br />影评设置
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: #FF6347; font-size: 17px; color: white;; text-align: center; margin-top: -20px;">
				<p>
					<br />场次设置

				</p>
			</div>
			<div class="div2">
				<h2 style="font-size: 19px; color: #FF6347; text-align: center">
					<br />场次设置
				</h2>
				<form action="" method="post" enctype="multipart/form-data">
					<center>
					上映电影名称:<input type="text" name="m_title"><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					开始时间:<input type="text" name="s_time"><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					结束时间:<input type="text" name="e_time"><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					座位:<input type="text" name="seat_id" ><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					影厅号:<input type="text" name="hall_id"><br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					票价:<input type="text" name="price"><br><br>
					
						<input type="submit" value="提交" class="sth">


					</center>
				</form>
			</div>

		</div>
	</div>
<div class="footer">
		<iframe frameborder=0 width="100%" height="320px" scrolling="no"
			src="../public/footer.html"></iframe>

	</div>
</body>
</html>