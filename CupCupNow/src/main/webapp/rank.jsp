<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>卡噗榜</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="bookmark" type="image/x-icon" href="imgs/my.ico" />
<link rel="stylesheet" href="css/footer.css">
<link rel="shortcut icon" href="imgs/my.ico">

</head>

	<jsp:include page="title.jsp"></jsp:include>

	<style>
li a {
	color: #000;
}

li a:hover {
	color: #fff;
}

section a {
	color: black;
}

li a:hover {
	color: red;
}

.div2 li {
	font-size: 17px;
	display: inline;
	list-style-type: none;
}

.mydiv {
	margin-left: 100px;
	width: 80%;
	float: left;
	background-color: #FFF;
	border: 1px solid #DCDCDC;
}

.div4 {
	font-size: 16px;
	float: left;
	margin-left: 100px;
}

#section {
	width: 1000px;
	margin: 0 auto;
	text-align: left;
}

section {
	height: 1820px;
	width: 1000px;
	line-height: 72px;
	margin: 0 auto;
	 
}

.box1 {
	height: 300px;
	margin-top: 50px;
	border-bottom: 1px solid #E5E5E5;
}
</style>
	
	
	
	<div></div>
		
			<div class="mydiv">
				
			</div>
		
	<section> <c:forEach items="${pageBean.pageDatas}" var="movie">
		<a href="movieController?op=showDetail&id=${movie.m_id}"><div class="box1">
				<ul>
					<li><img
						style="float: left; margin-left: 10px; margin-top: 60px; width: 100px; height: 140px"
						alt="" src="${movie.getCover()}" />
						<div
							style="float: left; width: 390px; height: 60px; margin: 40px 10px; font-size: 14px;">
							<h3 style=" text-align: left;">${movie.getTitle()}</h3>
							<p style=" text-align: left; margin-top: -30px;">导演：${movie.director}</p>
							<p style=" text-align: left; line-height: 15px; margin-bottom: 60px;">主演：${movie.casts}</p>
							<p style=" text-align: left; margin-top: -70px;">上映时间：${movie.date}</p>
						</div>
						<div
							style="float: right; text-align: left; margin-right: 10px; margin-top: 10px; font-size: 50px; color: #ef4236">${movie.getRate()}</div>
					</li>
				</ul>
			</div></a>
	</c:forEach>
	</section>
	
	
	<div style="margin-top: 300px; margin-left: 520px;">
		<span><a style="color: #000;"
			href="movieController?op=showFirst&type=${type}&pageNum=1">首页</a></span>
		<c:if test="${pageBean.havePrePage }">
			<span><a style="color: #000;"
				href="movieController?op=showFirst&type=${type}&pageNum=${pageBean.pageNum-1}">上一页</a></span>
		</c:if>
		<span>第${pageBean.pageNum}页</span>
		<form action="movieController?op=showFirst&type=${type}"
			style="display: inline-block;" method="post">
			<input type="text" name="pageNum"  style=" border-color: #000; color: #000; width: 70px;outline-style: none;"><input style="border-radius:90px;outline-style: none;background-color: #fff; border-color: #000; color: #ef4238;" type="submit"
				value=" go ">
		</form>
		<c:if test="${pageBean.haveNextPage}">
			<span><a style="color: #000;"
				href="movieController?op=showFirst&type=${type}&pageNum=${pageBean.pageNum+1}">下一页</a></span>
		</c:if>
		<span><a style="color: #000;"
			href="movieController?op=showFirst&type=${type}&pageNum=${pageBean.totalPages}">最后一页</a></span>
	</div>
	
	
	
<body>

</body>
</html>
<jsp:include page="public/footer.html"></jsp:include>