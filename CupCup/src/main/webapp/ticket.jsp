<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="bookmark"  type="image/x-icon"  href="imgs/my.ico"/>
  <link rel="shortcut icon" href="imgs/my.ico">
<title>卡噗票票</title>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link href="css/dianyingpiao.css" rel="stylesheet" type="text/css" > 
  <link rel="bookmark"  stype="image/x-icon"  href="imgs/my.ico"/>
  <link rel="shortcut icon" href="imgs/my.ico">

 </head>

<div>
 <body>
	<div id="bigbox">
	<!------------------------------------左边开始------------------------------------>
			<div style="width:340px;height:520px;float:left;">
				<div id="bigbox1">
					<div>
						<img style="float:left;" alt="" src="imgs/1.jpg"/>
						<h2><font color="#F74FA6">&nbsp;卡噗电影cup cup</font></h2>
						<hr style="border:1px solid #EA61AB;margin-top:-10px;width:200px;">
						<span><font color="#F74FA6">&nbsp;&nbsp;&nbsp;kapu movie cup cup</font></span>
					</div>
				</div>
			<div style="width:330px;float:left;">
				<div id="box2">
					<span>The most exciting conception</span>
					<span>Chian since cinema began.</span>
				</div>
			</div>
			<div id="box3">
				<ul style="margin-left:-35px;margin-top:10px;">
					<li>影厅</li>
					<li>cupcup国际影院</li>
				</ul>
			</div>
			<div id="box3">
				<ul style="margin-left:-35px;margin-top:10px;">
					<li>时间</li>
					<li>${ticket.s_time }<br>${ticket.s_time }</li>
				</ul>
			</div>
			<div id="box4">
				<ul style="margin-left:-35px;margin-top:3px;">
					<li>影片</li>
					<li>${movie.title }</li>
				</ul>
			</div>
			<div id="box4">
				<ul style="margin-left:-35px;margin-top:3px;">
					<li>座位</li>
					<li>${ticket.seat_num}</li>
				</ul>
			</div>
			<div id="box5">
				<ul style="margin-left:-35px;margin-top:3px;">
					<li>座类</li>
					<li>一等座</li>
				</ul>
			</div>
			<div id="box5">
				<ul style="margin-left:-35px;margin-top:3px;">
					<li>票类</li>
					<li>A类</li>
				</ul>
			</div>
			<div id="box5">
				<ul style="margin-left:-35px;margin-top:3px;">
					<li>票价</li>
					<li>${ticket.price }</li>
				</ul>
			</div>

			<div id="mini">
				<span>BJNO.</span>
			</div>
			<div id="last">
			</div>
		
		</div>


<!------------------------------------- 右边开始--------------------------------------->
		<div id="bigbox2">
			<div id="smallbox1">
				<p style="text-align:center;font-size:20px;margin-top:3px;">副券</p>
			</div>
			<div id="smallbox2">
				<div style="height:35px;width:100px;background-color: #F750A5;margin-top:-16px;border-radius-top:8px;">
					<p style="text-align:center;line-height:35px;">票号 No.</p>
					
				</div>
				<p>15645</p>
			</div>

			<div id="smallbox3">
				<div style="height:35px;width:100px;background-color: #F750A5;margin-top:-16px;border-radius-top:8px;">
					<p style="text-align:center;line-height:35px;">日期 DATE</p>
				</div>
			</div>

			<div id="smallbox3">
				<div style="height:35px;width:100px;background-color: #F750A5;margin-top:-16px;border-radius-top:8px;">
					<p style="text-align:center;line-height:35px;">时间 TIME</p>
				</div>
			</div>

			<div id="smallbox3">
				<div style="height:35px;width:100px;background-color: #F750A5;margin-top:-16px;border-radius-top:8px;">
					<p style="text-align:center;line-height:35px;">场次 SHOW</p>
				</div>
				<p>${ticket.scene_id }号厅-cupcup电影</p>
			</div>
			<p style="margin-left:12px;color:#E67AB6">影院 PLACE</p>

		</div>


	</div>
 </body>
</html>
