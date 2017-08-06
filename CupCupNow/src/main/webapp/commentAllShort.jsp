<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>短影评</title>
<style type="text/css">
a {
	text-decoration: none;
	color: #3377BC;
}
</style>
</head>
<jsp:include page="title.jsp"></jsp:include>
<body>
	<div style="width: 70%;height:1000px; margin: 0px auto;">
		<div style="width: 60%; display: inline-block;">
			<h2>${movie.title}&nbsp;短评</h2>
			<div style="font-size: 15px;">
				<span>看过</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><a
					href="#">想看 </a></span> <br>
				<br> <a href="#"><p
						style="width: 70px; height: 25px; text-align: center; font-size: 1px; color: #CA6445; background-color: #FAE9DA; margin-left: 500px; margin-top: -43px;">我要写短评</p></a>
				<div style="width: 100%; height: 1px; background-color: #DCDCDC"></div>
				<div style="font-size: 13px;">
					<br> <span>热门</span>&nbsp;&nbsp;&nbsp; <span><a
						href="#">最新</a></span>&nbsp;&nbsp;&nbsp; <span><a href="#">好友
					</a></span>
				</div>
				<br>
				
				<c:forEach items="${pageBean.pageDatas}" var="comment" varStatus="statue">
					<div style="margin-top: 20px">
						<div style="width: 100%; height: 1px; background-color: #DCDCDC"></div>
						<span style="font-size: 15px;"><a>${comment.u_name }</a></span>&nbsp;&nbsp;&nbsp;看过
						<img style="float: left;  display: inline-block;"
							src="imgs/tou${statue.count}.png"/>
						<span style="font-size: 14px; margin-left: 90px; color: #C7B1BC;">
						${comment.timestamp}</span><br> <span style="font-size: 12px; margin-left: 20px;">
						${comment.c_content}</span>
					</div>
					
				</c:forEach>
				<%--分页开始 --%>				
				<div style="margin-top: 300px; margin-left: 200px;">
					<span><a style="color: #000;"
						href="commentController?op=shortCommentPage&type=${movie.title}&pageNum=1">首页</a></span>
					<c:if test="${pageBean.havePrePage }">
						<span><a style="color: #000;"
							href="commentController?op=shortCommentPage&type=${movie.title}&pageNum=${pageBean.pageNum-1}">上一页</a></span>
					</c:if>
					<span>第${pageBean.pageNum}页</span>
					<form action="commentController?op=shortCommentPage&type=${movie.title}"
						style="display: inline-block;" method="post">
						<input type="text" name="pageNum"  style=" border-color: #000; color: #000; width: 70px;outline-style: none;"><input style="border-radius:90px;outline-style: none;background-color: #fff; border-color: #000; color: #ef4238;" type="submit"
							value=" go ">
					</form>
					<c:if test="${pageBean.haveNextPage}">
						<span><a style="color: #000;"
							href="commentController?op=shortCommentPage&type=${movie.title}&pageNum=${pageBean.pageNum+1}">下一页</a></span>
					</c:if>
					<span><a style="color: #000;"
						href="commentController?op=shortCommentPage&type=${movie.title}&pageNum=${pageBean.totalPages}">最后一页</a></span>
				</div>
				<%--分页结束 --%>
			</div>
		</div>
			<div style="width: 30%;  float: right; margin-top:0px; font-size: 12px;color:#999">
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
	</div>
				
</body>
</html>

<jsp:include page="public/footer.html"></jsp:include>