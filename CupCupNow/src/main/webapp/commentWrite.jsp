<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>卡噗写影评</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link href="css/yingping.css" rel="stylesheet" type="text/css" > 
   <link rel="bookmark"  type="image/x-icon"  href="imgs/my.ico"/>
  <link rel="shortcut icon" href="imgs/my.ico">
  <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">


 </head>
 <jsp:include page="title.jsp"></jsp:include>
<div>
 <body>
	<section style="height:1000px;">
	<!----------------------------------右侧开始------------------------------------------------------>
		<div id="bigbox1">
			<div id="box1">
				<h1>评论${movie.title}</h1>
				<p style="margin-top:-30px;">题目</p>
				<form method="post" 
				 action="commentController?op=appendLongCom&m_id=${movie.m_id}&m_title=${movie.title}">
						<input type="text" name="title" style="width:590px;height:30px;margin-top:-15px;">
				</div>
					评价&nbsp;
					<label><input name="yingping" type="radio" value="" />很差</label>&nbsp; 
					<label><input name="yingping" type="radio" value="" />较差</label>&nbsp; 
					<label><input name="yingping" type="radio" value="" />还行</label>&nbsp; 
					<label><input name="yingping" type="radio" value="" />推荐</label>&nbsp; 
					<label><input name="yingping" type="radio" value="" />力荐</label> 
	
					<div id="box2">
						<ul>
							<li>正文</li>
							<li style="float:right;margin-top:20px;"><button style="height:30px;"class="btn btn-default" type="submit">链接</button></li>
							<li style="float:right;margin-top:20px;"><button style="height:30px;" class="btn btn-default" type="submit">图片</button></li>
						</ul>
					</div>
					<div>
						<textarea name="content" id="" cols="30" rows="10" placeholder="沙发，沙发~"
							style="height:500px; width:590px;" ></textarea>
					</div>
	
						<label><input name="yingping" type="checkbox" value="" />有关键情节透露</label>&nbsp; 
						<span style="float:right;"><a>分享设置<a></span><br>
						
					<div style="margin-top:-30px;">
						<label><input name="yingping" type="checkbox"  value=""/> 这是我的原创内容，我已阅读并同意 <a>《卡噗原创评论声明》</a></label>
					</div>
	
					<div id="box2">
						<ul>
							<li style="float:left;margin-top:-20px;"><button style="height:25px;width:60px;background-color:#3FA156;color:#ffffff;align-height:25px;"class="btn btn-default" type="submit">
							<p style="margin-top:-3px;">发表</p></button></li>
							<li style="float:right;margin-top:-20px;"><button style="height:25px;width:60px;background-color:#F6F6F6;" class="btn btn-default" type="submit"><p style="margin-top:-3px;">取消</p></button></li>
						</ul>
					</div>
				</form>
		</div>
		<!-----------------右侧结束----------------------->
		<div id="bigbox2">
			<img src="${movie.cover}">
			<div>
				<span style="line-height:20px;color:#999999;">
					如果评论涉及电影和小说的结局和关键情节，请勾选「有关键情节透露」，卡噗将显示提示，以免没有看过的人扫兴。
					<br><br>
				</span>
				<span style="line-height:20px;color:#999999;">
					为了尊重创作者的劳动，请不要转载他人文章或提供下载信息。豆瓣鼓励有益的分享。
				</span>
			</div>
			<div  style="margin-top:30px;">
				<span>><font color="##3377BC">悟空传</font></span>
			</div>
			
		</div>

	</section>
	
	<jsp:include page="footer.html"></jsp:include>
 </body>
 </div>
</html>