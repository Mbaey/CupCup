<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>影评</title>
<link rel="stylesheet"  href="css/yp.css">
<script src="js/1.js"></script>
</head>
<jsp:include page="title.jsp"></jsp:include>
<div style="width: 70%; font-size: 12px">
	<h1>
		<center>${comment.c_title}</center>
	</h1>
</div>

<body>

	<div class="div1">
		<h2>
			<img src="img/1.jpg" style="width: 20px;">&nbsp;<a href="#">${comment.u_name}</a>
			<span>评论</span> <a href="#">${comment.m_title}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<span>${comment.timestamp}</span>
		</h2>
		<div class="div2">
			<c:forEach items="${splitContent}" var="c">
				<p>&nbsp;&nbsp;${c}</p>
			</c:forEach>
			
							<p>© 本文版权归作者  ${comment.u_name}  所有，任何形式转载请联系作者。</p>
		</div>
		<br>
		<br>
		<div class="div2">
		<center>
		<button type="button" style="width: 100px;height:30px;background-color: white;">有用</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" style="width: 100px;height:30px;background-color: white;">没用</button>
        <a href="#" style="font-size: 14px;float: right;">这篇影评有剧透</a>	
</center>
</div></div>
	
	<footer>
	<div class="footer">
		<iframe src="public/footer.html" frameborder="0" scrolling="no" width=100%  height=300px></iframe>
	</div>  
	</footer>

</body>
</html>
<jsp:include page="public/footer.html"></jsp:include>