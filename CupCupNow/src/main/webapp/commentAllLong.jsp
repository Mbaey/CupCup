<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>长影评</title>
<style type="text/css">
a {
	text-decoration: none;
	color: #3377BC;
}
</style>
</head>
<jsp:include page="title.jsp"></jsp:include>
<body>
	<div style="width:1360px; height:1000px; margin: 0px auto; display: inline-block; border:1px solid red;">
		<div style="width:600px;; height:1000px; display: inline-block;margin-left:190px;">
			<h2>${movie.title}</h2>
			<div style="font-size: 13px;">
				<span>最受欢迎的 /</span> <span><a href="#">最新发布的 /</a></span> <span><a
					href="#">按星级查看 </a></span> <br> <br>


				<c:forEach items="${pageBean.pageDatas}" var="lcomment" varStatus="statue">
					<div style="float:right; height:130px;">
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
				
				
				<%--分页开始 --%>				
				<div style="margin-top: 300px; margin-left: 160px;">
					<span><a style="color: #000;"
						href="commentController?op=longCommentPage&type=${movie.title}&pageNum=1">首页</a></span>
					<c:if test="${pageBean.havePrePage }">
						<span><a style="color: #000;"
							href="commentController?op=longCommentPage&type=${movie.title}&pageNum=${pageBean.pageNum-1}">上一页</a></span>
					</c:if>
					<span>第${pageBean.pageNum}页</span>
					<form action="commentController?op=longCommentPage&type=${movie.title}"
						style="display: inline-block;" method="post">
						<input type="text" name="pageNum"  style=" border-color: #000; color: #000; width: 70px;outline-style: none;"><input style="border-radius:90px;outline-style: none;background-color: #fff; border-color: #000; color: #ef4238;" type="submit"
							value=" go ">
					</form>
					<c:if test="${pageBean.haveNextPage}">
						<span><a style="color: #000;"
							href="commentController?op=longCommentPage&type=${movie.title}&pageNum=${pageBean.pageNum+1}">下一页</a></span>
					</c:if>
					<span><a style="color: #000;"
						href="commentController?op=longCommentPage&type=${movie.title}&pageNum=${pageBean.totalPages}">最后一页</a></span>
				</div>
				<%--分页结束 --%>
			</div>
		</div>
		<div style="width: 400px;; float: right; font-size: 12px;color:#999;margin-right:160px;">
			<p>如果你觉得一篇评论对你有帮助，请你点击“有用”。你的投票直接决定哪些评论出现在豆瓣首页和“豆瓣最受欢迎的评论”里，以及在书、电影和音乐介绍页里评论的排序。
				所有“没用”的点击都是匿名的。</p><br>
				<div style="font-size: 15px;">
				<a href="#">>${movie.title}</a><br><br>
				<img src="${movie.cover}">
				<div class="info" style="float:left;width:300px;height:60px;margin:40px 10px;font-size:14px; margin-top: -4px;">
					<p ><font color="#888888">导演:</font> <a>${movie.director}</a></p>
					<p ><font color="#888888">编剧:</font> ${movie.adaptor}</p>
					<p ><font color="#888888">主演:</font> ${movie.casts}</p>
					<p ><font color="#888888">类型:</font> ${movie.type}</font></p>
					<p ><font color="#888888">上映日期:</font>${movie.date}</font></p>
					<p ><font color="#888888">片长:</font> ${movie.timelen}</font></p>
				</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="public/footer.html"></jsp:include>