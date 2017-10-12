<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面-影片设置</title>

     <style type="text/css">
      a{
       color:#ef4238;
    }
  
  a:hover{
			color:#000;
		
		}
		 a:active{ color: #969; }
		 a:link {
			text-decoration: none;
		}
	 a:visited {
			text-decoration: none;
		}
	 a:hover {
		text-decoration: none;
		}
	 a:active {
		text-decoration: none;
		} 
		.div1 {
	width: 90%;
	height: 650px;
	float: right;
}

.div2 {
	width: 650px;
	height: 650px;
	margin-right: -670px;
	margin-top: -260px;
	float: right;
	border: 1px solid #E6E6FA;
}


a {
	text-decoration: none;
	color: #999;
}

.sth {
	width: 170px;
	height: 40px;
	background-color: white;
	color:black;
	margin-top:30px;
	margin-left:-70px;
	border-radius:30px 30px 30px 30px;
	cursor:pointer;
	border: 1px solid #ef4238;
}
.sth:hover {
    background-color: #ef4238;
    color: white;
}  
  </style>
</head>
	<jsp:include page="../public/title.jsp"></jsp:include>
<body>
	<div class="div1">
		<div style="text-align: center; margin-left: -190px;">
			<h1>欢迎您，管理员</h1>
		</div>
			<div style="width: 150px;; height: 650px; border: 1px solid #E6E6FA;">
			<h1
				style="height: 40px; color: black; text-align: center; font-size: 22px;">我的设置</h1>
			<div
				style="height: 60px; background-color:white; font-size: 17px; color: black; text-align: center;">
				<p style="margin-top: -10px;margin-bottom: 20px;">
					<a href="margfirst.jsp"><br />影片增加</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p style="margin-top: 10px;">
					<a href="margscond.jsp"> <br />影片删除
					</a>
				</p>
			</div>
			<div
				style="margin-top:5px; height:60px;border-radius:20px; background-color: #FF6347; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margscond.jsp"> <br />场次增加
					</a>
				</p>
			</div>
			<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: 20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margfourth.jsp"><br />用户删除</a>
				</p>
			</div>
		<div
				style="height: 60px; background-color: white; font-size: 17px; color: black; text-align: center; margin-top: -20px;">
				<p style="margin-top: 10px; margin-bottom: 5px;">
					<a href="margsixth.jsp"><br />影评删除</a>
				</p>
			</div>
			<div class="div2" style="margin-top:-320px;">
				<h2 style="font-size: 19px; color: #FF6347; text-align: center">
					<br />场次添加<br>
				</h2>
				<a href="mgrController?op=showallscene&page=1"><p style="margin-left: 390px; ">查看排场</p></a>

				<form action="mgrController?op=addscene" method="post" enctype="multipart/form-data">
					
						 
				<div class="input-group" style="width:300px;outline-style: none; margin-top:15px; margin-left:130px;">
					<input type="text" name="m_title" class="form-control" placeholder="请输入需要排版的电影" style="border-radius:20px; border-color:#ef4238; outline-style: none; margin-bottom:15px;">
                  
                    <input type="text" name="s_time" class="form-control" placeholder="请输入开始时间" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:15px;">
             
                    <input type="text" name="e_time" class="form-control" placeholder="请输入结束时间" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:15px;">
                    <span style="color:#ef4238 ">&nbsp;&nbsp; 请选择影厅号</span>&nbsp;&nbsp;
                    <label><input name="hall_id" type="radio" value="1" />一号</label>&nbsp; 
					<label><input name="hall_id" type="radio" value="2" />二号</label>&nbsp; 
					<label><input name="hall_id" type="radio" value="3" />三号</label>
                    
                    <input type="text"  name="price" class="form-control" placeholder="请输入票价" style="border-radius:20px; border-color:#ef4238; outline-style: none;margin-bottom:15px;">
 
                  
                       <input type="submit" style="margin-left:200px; height:30px; margin-top:15px;" 
							value="确定添加" class="sth"> &nbsp; &nbsp; 
							<c:forEach items="${yes}">
							<c:if test="${yes != null }">
							  <span style="color: red; font-size: 18px;" id ="success">添加成功!</span>
							</c:if>
							   
							</c:forEach>
					</form>
					<h2 style="font-size: 19px; color: #FF6347; text-align: center">批量添加</h2>
					<form action="mgrController?op=insertExcel" method="post" enctype="multipart/form-data">	
						在这里上传excel<input type="file" name="excel">
						<input type="submit" style="margin-left:200px; height:30px; margin-top:15px;" 
							value="确定添加" class="sth"> 	
            </form>	
				
			</div>
		</div>
	</div>
	
	<div class="footer">
		<iframe frameborder=0 width="100%" height="320px" scrolling="no"
			src="../public/footer.html"></iframe>
	</div>
	<script>
		
		
		$(".input-group").click(function(){
			  $("#success").css("display", "none");
		});
	</script>
	
</body>
</html>