<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
        <meta charset=utf-8>
        <title>My boo Navigation</title>
        <link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,500,700,900' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/booNavigation.css">
       	<link href="bootstrap\css\bootstrap.min.css" rel="stylesheet">
		<script src="bootstrap\js\jquery.min.js"></script>
	    <script src="bootstrap\js\bootstrap.min.js"></script>
    <style type="text/css">
	    header a:hover{
			color:#ef4238;
		
		}
		header a:active{ color: #969; }
		header a:link {
			text-decoration: none;
		}
		header a:visited {
			text-decoration: none;
		}
		header a:hover {
		text-decoration: none;
		}
		header a:active {
		text-decoration: none;
		}   
		header input:focus {
	   	color: #fff;
	    border: 1px solid #ef4238;
	    background-color: #ef4238;
	    }
	  
	    header .div1 ul li{
		display: inline;
		list-style-type:none;
		font-size: 15px;
	    }
	   
	</style>

	<header>
    <div style="width:100%; background-color: #FFF; height:60px; border-bottom: 1px solid  #CCC; border-bottom-style:dashed;">
	    <a href="aboutUs.jsp" class="tou">联系我们</a>
	    <a href="joinUs.jsp" class="tou">加入我们</a>
     	<a href="connectUs.jsp" class="tou">关于我们</a>   
    <div class="col-lg-6" >
				<div class="input-group" style="width:300px; margin-left:600px; margin-top:15px;">
					<form action="movieController?op=searchMovie&pageNum=1" method="post">
						<input type="text" name="title" class="form-control" placeholder="请搜索你想要查询的电影" style="border-radius:20px; border-color:#fff; outline-style: none;width: 250px;">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit" style=" margin-right:-60px;inline-block; border-color:#CCC;border-radius:90px; height:40px; width:40px; outline-style: none; border-style:dashed;">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
			</div>
		</div>
        
    <div class="dropdown" style=" list-style: none; float:right; margin-right:20px; margin-top:-53px;">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<c:if test="${user==null}">
						<img src="img/97.png" class="img-circle" alt="用户" style="height:50px; width:50px;">
							 <b class="caret"></b>
						</a>
		                <ul class="dropdown-menu" style="background-color: #fff; color:#ef4238; width:30px; margin-right:100px;">
							<li style="width:30px; margin-right:100px;">
							<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="background-color:#fff; width:40px; margin-left:1px; height:20px; border-color:#fff; margin-top:-15px; color:#ef4238;"><span class="glyphicon glyphicon-home"></span> 登入</button></li>
							<li class="divider"></li>
							 <li style="width:100%;width:30px; margin-right:100px;">
							<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1" style="background-color:#fff; width:40px;; margin-left:1px; height:20px; border-color:#FFF; margin-top:-15px; color:#ef4238;">
							<a href="regist.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></button></li>
						</ul>
					</c:if>	    		
					
						
					<c:if test="${user!=null}">
						<img src="${user.touxiang}" class="img-circle" alt="用户" style="height:50px; width:50px;">
							 <b class="caret"></b>
						</a>
						 <ul  id="xiaoshi" class="dropdown-menu" style="background-color: #fff; color:#ef4238; width:30px; margin-right:100px;">
							<li style="width:30px; margin-right:100px;">
							<a href="user/userSetting1.jsp">
								<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="background-color:#fff; width:40px; margin-left:1px; height:20px; border-color:#fff; margin-top:-15px; color:#ef4238;"><span class="glyphicon glyphicon-home"></span><a href="">主页</a></button></li>
							</a>
							<li class="divider"></li>
							 <li style="width:100%;width:30px; margin-right:100px;">
						    <a href="UserController?op=logout&to=<%=request.getRequestURL().append("?").append(request.getQueryString()).toString() %>">
								<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1" style="background-color:#fff; width:40px;; margin-left:1px; height:20px; border-color:#FFF; margin-top:-15px; color:#ef4238;"><span class="glyphicon glyphicon-user"></span> 注销</button></li>
							</a>
						</ul>    
					</c:if>
				  
				</div>
                
    </div>
    <div style="height:100px; background-color:#FFF">  <img src="img/02.png" alt="cup cup" style="height:90px; width:230px; margin-top:5px; margin-left:130px;"> </div>
    
<div class="wrapper" >
            <nav id="booNavigation" class="booNavigation">
                <ul>
                    <li class="navItem">
                     <a href="../index.jsp" title="First Item"><span>电影首页</span></a>
                    </li>

                    <li class="navItem">
                        <a href="#" title="Second Item"><span>电影分类</span></a>
                        <ul class="navContent">
                            <li>
                                <ul>
                                    <li><a href="movieController?op=showFirst&type=剧情&pageNum=1">剧情</a></li> 
									<li><a href="movieController?op=showFirst&type=家庭&pageNum=1">家庭</a></li> 
									<li><a href="movieController?op=showFirst&type=文艺&pageNum=1">文艺</a></li> 
									<li><a href="movieController?op=showFirst&type=科幻&pageNum=1">科幻</a></li> 
									<li><a href="movieController?op=showFirst&type=音乐&pageNum=1">音乐</a></li> 
									<li><a href="movieController?op=showFirst&type=暴力&pageNum=1">暴力</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
	                  				<li><a href="movieController?op=showFirst&type=恐怖&pageNum=1">恐怖</a></li> 
									<li><a href="movieController?op=showFirst&type=战争&pageNum=1">战争</a></li> 
									<li><a href="movieController?op=showFirst&type=传记&pageNum=1">传记</a></li> 
									<li><a href="movieController?op=showFirst&type=幽默&pageNum=1">幽默</a></li> 
									<li><a href="movieController?op=showFirst&type=情色&pageNum=1">情色</a></li> 
									<li><a href="movieController?op=showFirst&type=喜剧&pageNum=1">喜剧</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul>
                                    <li><a href="movieController?op=showFirst&type=爱情&pageNum=1">爱情</a></li> 
									<li><a href="movieController?op=showFirst&type=青春&pageNum=1">青春</a></li> 
									<li><a href="movieController?op=showFirst&type=悬疑&pageNum=1">悬疑</a></li> 
									<li><a href="movieController?op=showFirst&type=励志&pageNum=1">励志</a></li> 
									<li><a href="movieController?op=showFirst&type=黑色&pageNum=1">黑色</a></li> 
									<li><a href="movieController?op=showFirst&type=动作&pageNum=1">动作</a></li> 
									<li><a href="movieController?op=showFirst&type=犯罪&pageNum=1">犯罪</a></li> 
								        
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="navItem">
                        <a href="#" title="Third Item"><span>电影榜单</span></a>
                        <ul class="navContent" style="width:250px;margin-left:450px;" >
                            <li >
                                <ul>
                                    <li style="margin-left:15px; width:200px;"><a href="#" title="Boo the cat">热度排行</a><li/>
                                    <li style="margin-left:15px; width:200px;"><a href="#" title="The invisible cat">搜索排行</a><li/>
                                    <li style="margin-left:15px; width:200px;"><a href="#" title="The amazing cat">TOP100</a><li/>
									<li style="margin-left:15px; width:200px;"><a href="movieController?op=showFirst&type=最新&pageNum=1">最新上映</a></li> 
									<li style="margin-left:15px; width:200px;"><a href="movieController?op=showFirst&type=热门&pageNum=1">真在热播</a></li> 
								        
                                </ul>
                            </li>
                            
                        </ul>
                    </li>
                    <li class="navItem">
                     <a href="movieNews.jsp" title="First Item"><span>电影资讯</span></a>
                    </li>
                      <li class="navItem">
                     <a href="#" title="First Item"><span>热门预告</span></a>
                    </li>
                     <li class="navItem">
                     <a href="#" title="First Item"><span>观影指南</span></a>
                    </li>
                </ul>
                
            </nav>

        </div>

   </div>
    <!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document" style=" width:400px; height:500px">
	<div class="modal-content">
	  <div class="modal-header" style=" background-color: #ef4238; ">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="myModalLabel"><p style="color:#FFF">登陆</p></h4>
	  </div>
	  <div class="modal-body">
				<form action="UserController?op=login" method="post">  
					<div class="form-group">  
						<label for="recipient-name" class="control-label">用户名:</label>  
						<input type="text" class="form-control" id="recipient-name"
						 placeholder="请输入你的用户名" name="username"  style="width:250px">  
					</div>  
					<div class="form-group">  
						<label for="message-text" class="control-label">密码:</label>  
						<input type="password"  name="password" class="form-control" id="recipient-name" 
						placeholder="请输入你的密码" style=" width:250px">  
					</div>
					<div style="float:right; margin-top:-125px">
					   <img src="img/lo.png">
					</div>
					<input type="submit" value="提交" class="btn btn-primary" style="float:right; background-color:#ef4238;">  
				</form>
	  </div>
	  <div class="modal-footer">
	  </div>
	</div>
	</div>
	</div>

 
 <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/booNavigation.js"></script>
        <script>
        (function() {

            $('#booNavigation').booNavigation({
                slideSpeed: 400
            });

            $('#booNavigationTwo').booNavigation({
                slideSpeed: 200
            });

        })();

        </script>
        
	</header>
</html>

