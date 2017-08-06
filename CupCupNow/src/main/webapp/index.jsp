<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset=utf-8>
        <title>CupCup</title>
        
        <link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,500,700,900' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/booNavigation.css">
        <link rel="stylesheet" href="css/medile.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        
       	<link href="bootstrap\css\bootstrap.min.css" rel="stylesheet">
		<script src="bootstrap\js\jquery.min.js"></script>
    	<script src="bootstrap\js\bootstrap.min.js"></script>
        <!-- 
	      	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
			<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
         -->
	    
	    <link rel="bookmark"  type="image/x-icon"  href="imgs/my.ico"/>
        <link rel="shortcut icon" href="imgs/my.ico">
    <style type="text/css">
     a:hover{
		color:#ef4238;
	
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
	input:focus {
    color: #fff;
     border: 1px solid #ef4238;
     background-color: #ef4238;
    }
    footer{
	width: 100%;
	height: 300px;
	background-color: #EAEAEA;
    }

   .div1 ul li{
	display: inline;
	list-style-type:none;
	font-size: 15px;
    }
   
	</style>

    </head>
	<%-- <%
		int len = (int) application.getAttribute("len");
		List<Category> categories = (List<Category>) request.getAttribute("categories");
		if(categories == null){
			CategoryServiceImpl categoryServiceImpl =new CategoryServiceImpl();
			categories = categoryServiceImpl.selectAllCateOrderByLevel();
			len = 19;
			application.setAttribute("len", len);
			application.setAttribute("categories", categories);
		}
	%>  --%>
    <body>
    <header>
	    <div style="width:100%; background-color: #FFF; height:60px; border-bottom: 1px solid  #CCC; border-bottom-style:dashed;">
	    <a href="connectUs.jsp" class="tou">联系我们</a>
	    <a href="joinUs.jsp" class="tou">加入我们</a>
	    <a href="aboutUs.jsp" class="tou">关于我们</a>
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
								<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="background-color:#fff; width:40px; margin-left:1px; height:20px; border-color:#fff; margin-top:-15px; color:#ef4238;"><span class="glyphicon glyphicon-home"></span>主页</button></li>
							</a>
							<li class="divider"></li>
							 <li style="width:100%;width:30px; margin-right:100px;">
						    <a href="UserController?op=logout&to=index.jsp">
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
	                     <a href="categoryController?op=show" title="First Item"><span>电影首页</span></a>
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
	        
        </header>
        <div id="myCarousel" class="carousel slide" style="margin-right:-10px;">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="img/4.jpg" alt="First slide"width="100%;" height="100%;">
			<div class="carousel-caption"><div class="bantou"> <h2>速度与激情系列</h2>
            <h2>-----------------------------------------</h2>
            <p style="color:#FFF;">《速度与激情》是罗伯·科恩执导的赛车题材的动作犯罪电影。</p><p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;该剧讲述了卧底探员布莱恩凭借出色的车技赢得了帮派老大多米尼克的欣赏和信任，同时也赢得了多米尼克的妹妹米娅的芳心。他和这个帮派老大逐渐建立了友谊，两人成了互相尊重、互相信任的好朋友。</p><p>受到友情和爱情的双重羁绊，布莱恩陷入了困境。</p>
            <button type="button" class="btn btn-default btn-sm" style="margin-top:10px; float:right; margin-right:10px;">
          <span class="glyphicon glyphicon-play-circle"></span> 详细信息
        </button>
            </div>
            </div>
		</div>
		<div class="item">
			<img  src="img/6 (2).jpg" alt="Second slide" width="100%;" height="100%;">
			<div class="carousel-caption"><div class="bantou">
             <h2>冰川时代4</h2>
            <h2>-----------------------------------------</h2>
            <p style="color:#FFF;">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;《冰川时代4》电影由史蒂夫·马蒂诺执导，约翰·雷吉扎莫、雷·罗马诺、等共同献声配音，于2012年7月27日在中国上映。</p><p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;该片讲述地球因为冰山上的一颗松果引发的蝴蝶效应，而分裂成了七大洲四大洋，史前动物曼尼、希德和迭戈只好重新踏上全新的大冒险之旅。它们途中遇上希德的怪姥姥和一群疯狂的海盗，为它们的冒险之旅增添不少的麻烦。</p>
            <button type="button" class="btn btn-default btn-sm" style="margin-top:10px; float:right; margin-right:10px;">
          <span class="glyphicon glyphicon-play-circle"></span> 详细信息
        </button>
            </div>
            </div>
		</div>
		<div class="item">
			<img src="img/7.jpg" alt="Third slide"width="100%;" height="100%;">
			<div class="carousel-caption"><div class="bantou">
                    <h2>招魂2</h2>
            <h2>-----------------------------------------</h2>
            <p style="color:#FFF;">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;《招魂2》是由美国新线电影公司发行的恐怖片，由温子仁执导，维拉·法米加、帕特里克·威尔森、弗兰西丝·奥康纳联合主演。影片于2016年6月10日在美国上映</p><p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;《招魂2》改编自真实事件，时间背景设定于1977年的英国伦敦的北郊恩菲尔德，讲述了艾德和罗琳夫妇帮助一位单亲妈妈和她的四个孩子驱魔时遭遇的种种危机的故事</p>
            <button type="button" class="btn btn-default btn-sm" style="margin-top:10px; float:right; margin-right:10px;">
          <span class="glyphicon glyphicon-play-circle"></span> 详细信息
        </button>
            </div>
            </div>
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>
</div> 
        
<div class="zhengti">
        <p class="biao" id="section-1" style="width:100%;">
	   <span style="color:#ef4238;"> <img  src="img/4.png" alt="cup" style="width:30px; height:40px; margin-left:-270px;">正在热映 <span class="glyphicon glyphicon-chevron-right"></span></span>
	   <span style="float:right; color:#ef4238;margin-right:-30px; margin-top:10px;"> <img src="img/king21.png" alt="cup" style="width:40px; height:30px; ">实时票房</span>
	   </p>
		
		<br>
		<ul  class="biao" style="margin-left:-250px;" >
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img  title="album-name" class="img-responsive"  src="img/01.jpg" alt="cup"></li>
		  <a href="gouPiaoController?op=xuanPiao&id=629524"> <li class="uuli"> 购 票</li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img  title="album-name" class="img-responsive"  src="img/02.jpg" alt="cup"></li>
		  <a href="gouPiaoController?op=xuanPiao&id=644666"> <li class="uuli"> 购 票</li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/03.jpg" alt="cup"></li>
		   <a href="gouPiaoController?op=xuanPiao&id=643813"> <li class="uuli"> 购 票</li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/04.jpg" alt="cup"></li>
		   <a href="gouPiaoController?op=xuanPiao&id=663007"> <li class="uuli"> 购 票</li></a></div>
	</ul><br>
	<ul  class="biao" style="margin-left:-250px;">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/05.jpg" alt="cup"></li>
		   <a href="gouPiaoController?op=xuanPiao&id=641954"> <li class="uuli"> 购 票</li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/06.jpg" alt="cup"></li>
		   <a href="gouPiaoController?op=xuanPiao&id=656946"> <li class="uuli"> 购 票</li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/07.jpg" alt="cup"></li>
		   <a href="gouPiaoController?op=xuanPiao&id=630017"> <li class="uuli"> 购 票</li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/08.jpg" alt="cup"></li>
		  <a href="gouPiaoController?op=xuanPiao&id=642783"> <li class="uuli"> 购 票</li></a></div>
	</ul>
		
		<ul class="list-group" style="width:340px; height:440px; margin-left:580px; margin-top:-600px; border-color:#ef4238; text-align:left;">
		<div id="nowtime"></div> 
		
		 
		<script type="text/javascript" language="javascript">  
		    $(document).ready(function () {  
		    	//以毫米为单位1000*60*5
		        setInterval("startRequest()",  1000*60*5);  
		    });  
		    function startRequest() {  
		        $('#nowtime').text((new Date()).toLocaleDateString() + " " + (new Date()).toLocaleTimeString());  
		  		
		    	var d = new Date().getTime();
		    	//jsonp跨域请求！！参考网页：
		    	//http://www.cnblogs.com/ada-zheng/p/4349840.html
		    	//https://stackoverflow.com/questions/7936610/json-uncaught-syntaxerror-unexpected-token
		    	//40分钟后放弃了
		        $.ajax({
		        	type: "get",
		            url: "boxOfficeContrller?op=spiderRank",  
		            success: function (Data) {
		            	
		            	
		            	var rankData = Data["data2"];
		                $("#lli1 b").text(rankData[0]["MovieName"]); $("#lli1 span").text(rankData[0]["BoxOffice"] + "万");  
		                $("#lli2 b").text(rankData[1]["MovieName"]); $("#lli2 span").text(rankData[1]["BoxOffice"] + "万");  
		                $("#lli3 b").text(rankData[2]["MovieName"]); $("#lli3 span").text(rankData[2]["BoxOffice"] + "万");  
		                $("#lli4 b").text(rankData[3]["MovieName"]); $("#lli4 span").text(rankData[3]["BoxOffice"] + "万");  
		                $("#lli5 b").text(rankData[4]["MovieName"]); $("#lli5 span").text(rankData[4]["BoxOffice"] + "万");  
		                $("#lli6 b").text(rankData[5]["MovieName"]); $("#lli6 span").text(rankData[5]["BoxOffice"] + "万");  
		                $("#lli7 b").text(rankData[6]["MovieName"]); $("#lli7 span").text(rankData[6]["BoxOffice"] + "万");  
		                $("#lli8 b").text(rankData[7]["MovieName"]); $("#lli8 span").text(rankData[7]["BoxOffice"] + "万");  
		                $("#lli9 b").text(rankData[8]["MovieName"]); $("#lli9 span").text(rankData[8]["BoxOffice"] + "万");  
		                $("#lli10 b").text(rankData[9]["MovieName"]); $("#lli10 span").text(rankData[9]["BoxOffice"] + "万");
		                
		            }, 
		            dataType: "JSON"  
		        });  
		    }  
		    
		    
		    $('#nowtime').text((new Date()).toLocaleDateString() + " " + (new Date()).toLocaleTimeString());  
	  		
	    	var d = new Date().getTime();
	    	//jsonp跨域请求！！参考网页：
	    	//http://www.cnblogs.com/ada-zheng/p/4349840.html
	    	//https://stackoverflow.com/questions/7936610/json-uncaught-syntaxerror-unexpected-token
	    	//40分钟后放弃了
	        $.ajax({
	        	type: "get",
	            url: "boxOfficeContrller?op=spiderRank",  
	            success: function (Data) {
	            	
	            	
	            	var rankData = Data["data2"];
	                $("#lli1 b").text(rankData[0]["MovieName"]); $("#lli1 span").text(rankData[0]["BoxOffice"] + "万");  
	                $("#lli2 b").text(rankData[1]["MovieName"]); $("#lli2 span").text(rankData[1]["BoxOffice"] + "万");  
	                $("#lli3 b").text(rankData[2]["MovieName"]); $("#lli3 span").text(rankData[2]["BoxOffice"] + "万");  
	                $("#lli4 b").text(rankData[3]["MovieName"]); $("#lli4 span").text(rankData[3]["BoxOffice"] + "万");  
	                $("#lli5 b").text(rankData[4]["MovieName"]); $("#lli5 span").text(rankData[4]["BoxOffice"] + "万");  
	                $("#lli6 b").text(rankData[5]["MovieName"]); $("#lli6 span").text(rankData[5]["BoxOffice"] + "万");  
	                $("#lli7 b").text(rankData[6]["MovieName"]); $("#lli7 span").text(rankData[6]["BoxOffice"] + "万");  
	                $("#lli8 b").text(rankData[7]["MovieName"]); $("#lli8 span").text(rankData[7]["BoxOffice"] + "万");  
	                $("#lli9 b").text(rankData[8]["MovieName"]); $("#lli9 span").text(rankData[8]["BoxOffice"] + "万");  
	                $("#lli10 b").text(rankData[9]["MovieName"]); $("#lli10 span").text(rankData[9]["BoxOffice"] + "万");
	                
	            }, 
	            dataType: "JSON"  
	        });  
		</script> 
	<div id="lli1"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom:5px;text-align:left; font-weight:100;"><img src="img/king.png"><b>悟空传</b>
	     <span class="badge" style=" background-color: #ef4238;margin-right:10px;">2020.26万</span></li></div>
	     
	<div id="lli2"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom:5px;text-align:left;"><img src="img/king2.png"> <b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238; margin-right:10px;">1791.81万</span></li></div>
	<div id="lli3"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;"><img src="img/king3.png"> <b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238;  margin-right:10px;">443.14万</span></li></div>
	<div id="lli4"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom:5px;text-align:left;"><a style="color: #848484; font-style:oblique; font-size:20px;">4 </a> <b>悟空传</b>
		  <span class="badge" style=" background-color: #ef4238; margin-right:10px;">324.45万</span></li></div>
	<div id="lli5"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;"><a style="color: #848484; font-style:oblique; font-size:20px;">5 </a> <b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238; margin-right:10px;">285.16万</span></li></div>
	<div id="lli6"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;"><a style="color: #848484; font-style:oblique; font-size:20px;">6 </a> <b>悟空传</b>
		  <span class="badge" style=" background-color: #ef4238; margin-right:10px;">244。17万</span></li></div>
	<div id="lli7"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;"><a style="color: #848484; font-style:oblique; font-size:20px;">7 </a><b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238; margin-right:10px;">244。17万</span></li></div>
	<div id="lli8"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;" ><a style="color: #848484; font-style:oblique; font-size:20px;">8 </a> <b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238; margin-right:10px;">244。17万</span></li></div>
	<div id="lli9"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;" ><a style="color: #848484; font-style:oblique; font-size:20px;">9 </a> <b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238; margin-right:10px;">244。17万</span></li></div>
	<div id="lli10"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;" ><a style="color: #848484; font-style:oblique; font-size:20px;">10 </a>	<b>悟空传</b>
	      <span class="badge" style=" background-color: #ef4238; margin-right:10px;">244。17万</span></li></div>

	</ul>
    
        <p class="biao" id="section-1" style="width:100%; margin-top:170px;">
	   <span style="color:#2DB3F8;"> <img  src="img/4.png" alt="cup" style="width:30px; height:40px; margin-left:-270px;">即将上映 <span class="glyphicon glyphicon-chevron-right"></span></span>
	   <span style="float:right; color:#FFB400;margin-right:-30px; margin-top:10px;"> <img src="img/33.png" alt="cup" style="width:40px; height:50px; ">最受期待</span>
	   </p>
		
		<br>
	<ul  class="biao" style="margin-left:-250px;" >
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img  title="album-name" class="img-responsive"  src="img/t1.png" alt="cup"></li>
		  <a href="#"> <li class="uum"> 让爱活下去<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"> <a href="gouPiaoController?op=xuanPiao&id=666443">预售</a></div></li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img  title="album-name" class="img-responsive"  src="img/t2.png" alt="cup"></li>
		  <a href="#"> <li class="uum"> 战狼2<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=666430">预售</a></div></li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/t3.png" alt="cup"></li>
		  <a href="#"> <li class="uum"> 建军大业<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=666444">预售</a></div></li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/t4.png" alt="cup"></li>
		   <a href="#"> <li class="uum">大耳朵图图之美食狂想曲<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=666445">预售</a></div></li></a></div>
	</ul><br>
	<ul  class="biao" style="margin-left:-250px;">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/t5.png" alt="cup"></li>
		   <a href="#"> <li class="uum"> 豆福传<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=666446">预售</a></div></li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/t6.png" alt="cup"></li>
		   <a href="#"> <li class="uum"> 玲珑井<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=666447">预售</a></div></li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/t7.png" alt="cup"></li>
		   <a href="#"> <li class="uum"> 夜半凶铃<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=666448">预售</a></div></li></a></div>
	</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/t8.png" alt="cup"></li>
		 <a href="#"> <li class="uum"> 和田玉传奇<div class="uum1"><span class="glyphicon glyphicon-play-circle"></span>预告</div><div class="uum2"><a href="gouPiaoController?op=xuanPiao&id=642970">预售</a></div></li></a></div>
	</ul>
		
		<ul class="list-group" style="width:340px; height:440px; margin-left:580px; margin-top:-650px; border-color:#ef4238; text-align:left;">
	<div id="lli1"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom:5px;text-align:left;border:1px solid #eaeaea;"><img src="img/t9.png"> 
         <p ><span style="font-size:18px; margin-top:-150px; float:right;">三生三世十里桃花</span><span style="color:#CCC; float:right; margin-top:-120px;">上映时间：2017-08-03</span><span style="color:#FFB400;margin-right:10px; font-weight:100; font-size:13px; float:right; margin-top:-90px; margin-right:40px;">2020.26万人想看</span></p>
	     </li></div>
	<div id="lli2"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom:5px;text-align:left; margin-left:-20px; width:190px;"> <img src="img/t10.png"> <p>战狼2</p> <p style="color:#FFB400;font-size:13px;">1980.26万人想看</p></li></div>
	<div id="lli3"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left; float:right; width:190px; margin-top:-210px; margin-right:-20px;"><img src="img/t11.png"> <p>蜘蛛侠：英雄归来<p style="color:#FFB400;font-size:13px;">1760.26万人想看</p></div>
	<div id="lli4"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom:5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">4 </span> 猩球崛起3：终极之战
		  <span style="color:#FFB400;margin-right:10px; font-weight:100; font-size:13px; float:right; margin-right:10px;">324.45万想看</span></li></div>
	<div id="lli5"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">5 </span> 建军大业 
	     <span style="color:#FFB400;margin-right:10px; font-weight:100; font-size:13px; float:right; margin-right:10px;">215.45万想看</span></li></div>
	<div id="lli6"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">6 </span> 银魂 真人版
		 <span style="color:#FFB400;margin-right:10px; font-weight:100; font-size:13px; float:right; margin-right:10px;">206.95万想看</span></li></div>
	<div id="lli7"><li class="list-group-item" style="color:#000; font-size:16px;border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">7 </span>心理罪 
	     <span style="color:#FFB400;margin-right:10px; font-weight:100; font-size:13px; float:right; margin-right:10px;">144.32万想看</span></li></div>
	</ul>
    
    <p class="biao" id="section-3" style="width:100%; margin-top:250px;"> <span style="color:#59acac; margin-top:70px;"> <img  src="img/4.png" alt="cup" style="width:30px; height:40px; margin-left:-270px;">热播电影 <span class="glyphicon glyphicon-chevron-right"></span></span> <span style="float:right; color:#FF8D1B; margin-right:2px; margin-top:20px;"> <img src="img/33.png" alt="cup" style="width:40px; height:50px; ">TOP100</span>
	<span style="font-size:12px; color:#000; margin-top:50px;"><a href="#">爱情</a><a href="#"> 喜剧</a> <a href="#">动作</a> <a href="#">恐怖</a><a href="#"> 动画</a>  <p class="bian" style="margin-left:-250px;">  <img src="img/301.png"></p>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/302.png" alt="cup"></li>
		</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/303.png" alt="cup"></li>
		</ul><br>
	<ul  class="biao"style="margin-left:-250px;">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/304.png" alt="cup"></li>
		</ul>
	<ul  class="biao" style="margin-left:8px;">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/305.png" alt="cup"></li>
		</ul>
	<ul  class="biao">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/306.png" alt="cup"></li>
		</ul>
	<ul  class="biao"  style="margin-left:28px;">
		   <div class="w3l-movie-gride-agile w3l-movie-gride-agile1"><li><img src="img/308.png" alt="cup"></li>
		</ul>
    
    <ul class="list-group" style="width:340px; height:440px; margin-left:580px; margin-top:-520px; border-color:#59acac;">
	<div id="lli1"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom:5px;text-align:left; margin-top:-110px;"><img src="img/309.png"> 霸王别姬
	     <span class="badge" style=" background-color: #FFB400;margin-right:10px; margin-top:25px;">9.6分</span></li></div>
	<div id="lli2"><li class="list-group-item" style="color:#000; font-size:16px;  border-color:#fff; margin-bottom:5px;text-align:left;"><span style="color:#FF8D1B; font-style:oblique; font-size:20px;">2 </span>肖申克的救赎
	      <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.5分</span></li></div>
	<div id="lli3"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color:#FF8D1B; font-style:oblique; font-size:20px;">3 </span> 罗马假日
	      <span class="badge" style=" background-color: #FFB400;  margin-right:10px;">9.1分</span></li></div>
	<div id="lli4"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom:5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">4 </span> 这个杀手不太冷
		  <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.5分</span></li></div>
	<div id="lli5"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">5 </span> 阿甘正传
	      <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.4分</span></li></div>
	<div id="lli6"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">6 </span> 泰坦尼克号
		  <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.5分</span></li></div>
	<div id="lli7"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;"><span style="color: #848484; font-style:oblique; font-size:20px;">7 </span> 教父
	      <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.3分</span></li></div>
	<div id="lli8"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;" ><span style="color: #848484; font-style:oblique; font-size:20px;">8 </span> 龙猫
	      <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.2分</span></li></div>
	<div id="lli9"><li class="list-group-item" style="color:#000; font-size:16px; border-color:#fff; margin-bottom: 5px;text-align:left;" ><span style="color: #848484; font-style:oblique; font-size:20px;">9 </span> 唐伯虎点秋香
	      <span class="badge" style=" background-color: #FFB400; margin-right:10px;">9.2分</span></li></div>
	
	</ul>

  

  
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
						<input type="text" name="username" class="form-control" id="recipient-name" placeholder="请输入你的用户名" style="width:250px">  
					</div>  
					<div class="form-group">  
						<label for="message-text" class="control-label">密码:</label>  
						<input type="password"  name="password" class="form-control" id="recipient-name" placeholder="请输入你的密码" style=" width:250px">  
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



	   


        <!-- Scripts for jQuery and the plugin -->
 <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/booNavigation.js"></script>
        <script>
        (function() {

            /**
             * This is the call we have to do to execute
             * the plugin giving a custom params
             */
            $('#booNavigation').booNavigation({
                slideSpeed: 400
            });

            $('#booNavigationTwo').booNavigation({
                slideSpeed: 200
            });

        })();

        </script>
        
        
    <footer style=" width:100%; margin-top:1480px; color:#FFF;">
		<div id="footer" >
		<div>
			<a href="#">
			<center > <div style="width:100%; height:70px; background-color:#FFF;border-top: 1px solid  #CCC; border-top-style:dashed;"><img alt="logo" src="img/02.png" style="width: 200px; height:70px;"></div>
			</center>
		
			</a>
		</div>
		<div class="div1">
			<ul>
			<center>
		    <br>
		    <br>
			<li><a href="joinUs.jsp">加入我们 |</a></li>
			<li><a href="connectUs.jsp">联系我们 |</a></li>
			<li><a href="aboutUs.jsp">关于我们 |</a></li>
			<li><a href="help1.jsp">帮助中心 |</a></li>
			<li><a href="hezuo.jsp">网站合作|</a></li>
			<li><a href="yingsi.jsp">隐私政策 </a></li>
			<br>
			</center>
			<li>
			<span style="font-size: 15px;color: black;float: right;margin-right: 60px;">微信公众号  &nbsp;&nbsp;&nbsp; 微信客服号</span></li>
			<br>
			<center>
			<li>cup&nbsp; cup有限公司Copyright 2017-2017 Mtime.com Inc. All rights reserved.</li></center>
			</ul>
		</div>
			<div>
				<a href="#">
				<img alt="erweima" src="img/wechat.png" style="width: 100px; float: right;margin-right: 150px;margin-top: -28px;">
				<img alt="erweima" src="img/1.png" style="width: 100px; float: right;margin-right: -210px;margin-top: -28px;">
				</a>
			</div>
		</div>
		<div class="div1">
			<ul>
				<center>
					<li><a href="#"><span style="font-size:10px; margin-left: 250px;">京ICP证00000号</span></a></li>
					<li><a href="#"><span style="font-size:10px; ">网络文化经营许可证</span></a></li>
					<li><a href="#"><span style="font-size:10px;">京公网安备：00000000000号</span></a></li>
					<li><a href="#"><span style="font-size:10px;">网络视听许可证0000000号</span></a></li>
				</center>
			</ul>
		</div>
	</footer>
			
</body>
</html>
