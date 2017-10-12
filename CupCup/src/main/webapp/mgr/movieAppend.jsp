<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery.min.js"></script>
 <script src="../js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/booNavigation.css">
<link rel="bookmark"   type="image/x-icon"  href="imgs/my.ico"/>
<link rel="shortcut icon" href="imgs/my.ico">
</head>
<body>
	<form action="movieController?op=movieAppend" method="post" enctype="multipart/form-data">	
			电影名:<input name="title" type="text"><br>
			导演:<input name="director" type="text"><br>
			豆瓣评分:<input name="rate" type="text"><br>
			主演:<input name="casts" type="text"><br>
			编剧:<input name="adaptor" type="text"><br>
			上映日期:<input name="date" type="text"><br>
			片长:<input name="timelen" type="text"><br>
			简介:<input name="summary" type="text"><br>
			图片:<input name="cover" type="file"><br>
			
			类型:<select>
			<c:forEach items="${types}" var="type">
				<option name="type" value="${type.getId()}">${type.getName() }</option>
			</c:forEach>
			</select>
			<br>
			
			<input type="submit" value="提交">
		</form>
		
		<div class="footer">
		<iframe frameborder=0 width="100%" height="320px" scrolling="no"
			src="footer.html"></iframe>

	</div>		
</body>
</html>