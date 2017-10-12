<%@page import="bean.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>卡噗评论</title>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link href="css/pinglun.css" rel="stylesheet" type="text/css" > 
  <link rel="bookmark"  type="image/x-icon"  href="imgs/my.ico"/>
  <link rel="shortcut icon" href="imgs/my.ico">
	<style type="text/css">
		.info p{
			line-height: 20px;
		}
	</style>
 </head> 

<div>
<jsp:include page="title.jsp"></jsp:include>
 <body>
	<section>
	<h1>${movie.title}<font color="#888888"></font><h1>
	<div id="bigbox1">
		<div id="box1">
			<img style="float:left;margin-left:10px; height: 141px; width: 101px;" alt="" src="${movie.cover}"/>
				<div class="info" style="float:left;width:300px;height:60px;margin:40px 10px;font-size:14px; margin-top: -4px;">
					<p ><font color="#888888">导演:</font> <a>${movie.director}</a></p>
					<p ><font color="#888888">编剧:</font> ${movie.adaptor}</p>
					<p ><font color="#888888">主演:</font> ${movie.casts}</p>
					<p ><font color="#888888">类型:</font> ${movie.type}</font></p>
					<p ><font color="#888888">上映日期:</font>${movie.date}</font></p>
					<p ><font color="#888888">片长:</font> ${movie.timelen}</font></p>
				</div>
			</div>

		<div id="box2">
				<p style="margin-top:-20px;"><font color="#888888" size="2px">卡噗评分</font></p>
				<p ><font size="25px" face="SimSun">${movie.rate}</font></p>
		</div>
		
			<div id="juqin">
				<h6 style="margin-top:-23px;"><font color="#4F7722">${movie.title}的剧情简介。。。。。。</font></h6>
					<div id="wenzi">
						<span>
							　<font size="2px">${movie.summary}</font>
						</span>
					</div>
			</div>

			<div id="xinxin">
				<ul  style="font-size:1px; height:20px;margin-top:-20px;">
					<li style="margin-left:10px;">想看</li>
					<li style="margin-left:40px;">看过</li>
					<li style="margin-left:20px;">
					评价:
					<img style="margin-top:30px;" src="imgs/pingjia.png"/>
					</li>
				</ul>
			</div>
			<div id="xie">
				<ul style="font-size:1px; height:20px;margin-top:-20px;">
					<li>
					<img style="margin-top:30px;" src="imgs/duanping.png"/>
					<a>写短评</a>
					</li>
					<li style="margin-left:30px;">
					<a href="commentController?op=toAppendLongCom&m_id=${movie.m_id}">写影评</a>
					<img style="margin-left:-60px; margin-top:30px;" src="imgs/xieyinping.png"/>
					</li>
				</ul>
			</div>

			<!--短评开始--->
			<div id="duanping">
				<h6><font color="#4F7722">${movie.title}的短评。。。。。。</font></h6>
				<ul style="font-size:1px; height:20px;margin-top:-40px;">
				<li>热门/</li>
				<li><a>最新</a>/</li>
				<li><a>好友/</a></li>
				</ul>
				<div style="width:85px; height:28px; background-color:#FAE9DA;float:right; text-align:center; margin-top:-20px;">
					<p style="font-size:1px; margin-top:-20px; color:#CA6445;">我要写短评<p>
				</div>
			</div>
			<c:forEach items="${shortComment}" var="scomment">
				<div id="duanping1">
					<div style="height:25px;width:500px;margin-bottom:30px;">
						<ul style="margin-top:-20px;">
							<li><a>${scomment.u_name}</a></li>
							<li>看过</li>
							<li style="color:#C7B1BC;margin-left:80px;">${scomment.timestamp}</li>
						</ul>
					</div>
					<div id="wenzi">
					<span>　<font size="2px">${scomment.c_content}</font></span>
					</div>
				</div>
			</c:forEach>
			<!-- 
				<div>
					<span><a
						href="commentController?op=shortCommentPage&title=${movie.title}&pageNum1=1">首页</a></span>
					<c:if test="${pageBean.havePrePage }">
						<span><a
							href="commentController?op=shortCommentPage&title=${movie.title}&pageNum1=${pageBean.pageNum-1}">上一页</a></span>
					</c:if>
					<span>第${pageBean.pageNum}页</span>
						<form action="commentController?op=shortCommentPage&title=${movie.title}"
							style="display: inline-block;" method="post">
							<input type="text" name="pageNum1"><input type="submit"
								value="跳转">
						</form>
					<c:if test="${pageBean.haveNextPage}">
						<span><a
							href="commentController?op=sshortCommentPage&title=${movie.title}&pageNum1=${pageBean.pageNum+1}">下一页</a></span>
					</c:if>
					<span><a
						href="commentController?op=shortCommentPage&type=${type}&pageNum1=${pageBean.totalPages}">最后一页</a></span>
				</div>
			 -->

		<br><span style="height:10px;font-size:2px;">
		><a href="commentController?op=shortCommentPage&pageNum=1&type=${movie.title}">更多短评${shortCommentTotalNum}条</a>
		</span>
	 </div>
	 <!-- 短评结束-->

			<h4><font color="#4F7722">${movie.title}的影评。。。。。。</font></h4>
			
			<div style="width:85px; height:28px; background-color:#FAE9DA;float:right; text-align:center; margin-top:-40px;">
				<p style="font-size:1px; margin-top:-20px; color:#CA6445;">我要写短评<p>
			</div>
			<c:forEach items="${longComment}" var="lcomment" varStatus="statue">
				<div style="height:130px;">
						<div style="height:30px; background-color:#F3F5F7;">
							<a href="commentController?op=showLongComment&c_id=${lcomment.c_id}&m_id=${movie.m_id}&m_title=${movie.title}"><span style="font-size:3px;margin-top:-50px;line-height:30px;">${lcomment.c_title}</span></a>
						</div>
					     <img style="margin-top:5px;" src="imgs/tou${statue.count}.png"/>
					     <span style="font-size:3px;"><a>${lcomment.u_name}</a></span>
						 <span  style="font-size:2px; margin-left:80px;color:#C7B1BC;">${lcomment.timestamp}</span>
						 <div id="wenzi1">
						     	<span><font size="2px">${lcomment.c_content}</font></span>
						     <br>
				       </div>
			   </div>
			</c:forEach>
		  
			<span style="height:10px;font-size:2px;float:right;">
			><a  href="commentController?op=longCommentPage&pageNum=1&type=${movie.title}">更多影评${longCommentTotalNum }篇
			</a></span>
			<!--影评结束--->
	</section>
	
		<div id="last" style="height: 250px;
	width:1000px;
	line-height: 72px;
	margin:0 auto;">
			<form action="commentController?op=appendShortCom&m_id=${movie.m_id}&m_title=${movie.title}" method="post">
				<textarea name="content" id="" cols="30" rows="10" placeholder="沙发，沙发~"
				style="height:180px; width:980px;margin:10px 10px;" 
				></textarea>
				<input style="float:right;width:100px; height:40px;text-align:center;line-height:40px;margin-right:10px;background-color:#ffffff;"
				type="submit" value="发表">
			</form>
		</div>
		
	
 </body>
 </div>
</html>
<jsp:include page="public/footer.html"></jsp:include>
