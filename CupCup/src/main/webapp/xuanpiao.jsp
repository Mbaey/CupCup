<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>选票</title>
<link type="text/css" rel="stylesheet" href="css/gou.css" />
 <script language="javascript" type="text/javascript" src="js/goupiao.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/footer.css">
 
        <link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,500,700,900' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/booNavigation.css">
        <link rel="stylesheet" href="css/medile.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
       <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	   <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
       
       <link href="css/pinglun2.css" rel="stylesheet" type="text/css" >
       
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

<body>
          <jsp:include page="title.jsp"></jsp:include>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" style=" width:400px; height:500px">
            <div class="modal-content">
              <div class="modal-header" style=" background-color: #ef4238; ">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><p style="color:#FFF">登陆</p></h4>
              </div>
              <div class="modal-body">
                        <form>  
                            <div class="form-group">  
                                <label for="recipient-name" class="control-label">username:</label>  
                                <input type="text" class="form-control" id="recipient-name" placeholder="please input your name" style="width:250px">  
                            </div>  
                            <div class="form-group">  
                                <label for="message-text" class="control-label">password:</label>  
                                <input type="text" class="form-control" id="recipient-name" placeholder="please input your password" style=" width:250px">  
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
      </div>
    
    
    
    
    
    
    
    <div style="width:980px; height:2000px; border: #FFF solid 2px; margin:0px auto; margin-top:10px">
    <div style="width:980px; height:450px; border:#FFF solid 2px;">
               <h1 style="margin-top:-2px">${movie.title }<font color="#888888"></font><h1>
                <div id="box3">
                    <img style="float:left;width:170px; height:236px; margin-top:-232px; margin-left:-160px" alt="" src="${movie.cover }"/>
                        <div style="float:left;width:300px;height:60px;margin:40px 10px;font-size:14px;">
                            <p style="test-overflow:ellipsis;overflow:hidden; margin-top:-270px;width:215px; height:30px; border:#FFF solid 1px"><font color="#000" style=" font-size:24px">${movie.title }</font></p>
                            <p style=" margin-top:-10px;width:215px; height:25px; border: #FFF solid 1px"><font color="#C1C1C1" style="font-size:18px">${movie.englishName }</font></p>
                            
                            <span>
                                <div style=" background-color:#EF4238; margin-right:5px; width:134px; height:40px; border: #FFF solid 1px; float: left; margin-top:-10px"><p style="text-align:center; margin-top:5px; color:#FFF;">今日实时票房<br />${movie.boxOffice }万</p></div>
                                <div style="background-color:#EF4238; width:134px; height:40px; border: #FFF solid 1px; float: left; margin-top:-10px"><p style="text-align:center; margin-top:5px; color:#FFF;">累计票房<br />17588万</p></div>
                            
                            </span>
                            
                            <p style="margin-top:50px;width:215px; height:25px; border:#FFF solid 1px"><font color="#888888"><font color="#888888">制式</font>2D/3D</p>
                            <p style="margin-top:-10px;width:215px; height:25px; border:#FFF solid 1px"><font color="#888888"></font>${movie.timelen }</font></p>
                            
                            <p style="margin-top:-10px;width:215px; height:25px; border:#FFF solid 1px"><font color="#888888"></font>${movie.type }</font></p>
            
                         
                            <p style="margin-top:-10px;width:280px; height:37px; border:#FFF solid 1px"><font color="#888888"></font>${movie.date }</font></p>
                         
                        </div>
                 </div>
        
                <div id="box2">
                        <p style="margin-top:-20px;"><font color="#888888" size="2px">卡噗评分</font></p>
                        <p style="margin-top:5px;"><font size="25px" face="SimSun" style="color:#EF4238">${movie.rate }</font></p>
                </div>
                
                     
                    <div id="juqin">
                        <hr  style="border-top:2px dotted  #DDDDDD; width:900px; margin-left:20px; position:absolute; margin-top:-40px"/>
                        <h6 style="margin-top:-23px;"><font color="#4F7722">剧情简介</font></h6>
                            <div id="wenzi">
                                <span>
                                    　<font size="2px">${movie.summary }</font>
                                </span>
                            </div>
                    </div>
    </div>
    
    
    
    
    
    <artical>
       <hr  style="border-top:2px dotted  #DDDDDD; width:900px; margin-left:20px; position:absolute; margin-top:6px"/> 
      <div id="artical2">
          <ul>
            <span>
                <li style="height:45px; width:90px; border-left:#DDDDDD solid 1px; border-right:#DDDDDD solid 1px; border-top:#2BB8AA solid 3px; margin-left:1px">
                <a href="#" style="margin-left:5px">电影购票</a>
                </li>
            </span>
            <span><li style="height:45px; width:630px; border:#AEAEAE solid 1px; margin-left:90px; margin-top:-45px"></li></span>
          </ul>
          
          <ul id="changci" style="margin-top:35px">
              <li><img src="img/log1.png" /></li>
              <li>时间：</li>
              <li><div><a href="">今天上映场次</a></div></li>
              <li><a href="">明天上映场次</a></li>
              <li><a href="">后天上映场次</a></li>
          </ul>
          <br />
          <hr  style="height:1px;border:none;border-top:1px dotted #AEAEAE; width:680px; margin-left:20px"/>
          
          <div id="biaodan">
              <ul class="biao1">
                 <li class="biaoli1" style=" padding-top:15px;"><span>放映时间</span></li>
                 <li class="biaoli2"><span>语言版本</span></li>
                 <li class="biaoli3" style=" padding-top:15px;"><span>放映厅</span></li>
                 <li class="biaoli4" style=" padding-top:15px;"><span>cupcup选座售价</span></li>
                 <li class="biaoli5"><span>在线选座</span></li>
              </ul>
              
              <c:forEach items="${scene }" var="scene">
	              <ul class="biao2">
	                 <li class="biaoli1" style=" padding-top:34px;">${scene.s_time }<span style=" color:#F76120"></span>&nbsp;−&nbsp;<span style="color: #999">${scene.e_time }</span></li>
	                 <li class="biaoli2" style=" padding-top:34px;"><span>${scene.type }</span></li>
	                 <li class="biaoli3" style=" padding-top:34px;"><span>${scene.hall_id }号厅-cupcup电影app购票直降手续费4-8元</span></li>
	                 <li class="biaoli4" style=" padding-top:34px;"><span style=" color:#F76120">${scene.price }</span></li>
	                 <a href="gouPiaoController?op=tiaoZhuan&movieid=${movie.m_id }&scene=${scene.hall_id }&stime=${scene.s_time }&etime=${scene.e_time }&price=${scene.price }&type=${scene.type }" style="color:#FFF;"><li class="biaoli5"><button class="btn btn-info" style="width:55px; height:88px; background-color:#FD7D0B; border-color:#FD7D0B">选<br />座<br />购<br />票</button></li></a>
	              </ul>
              </c:forEach>
              
          </div>
          
      </div>
    </artical>
    
    
    </div>
    
    
    
    
    
    
    <div>
                  
            <br>
                <footer>
                    <div id="footer1">
                        <div style="background-color: #FFF">
                            <a href="#">
                                <center>
                                    <img alt="logo" src="img/02.png" style="width: 200px">
                                </center>
            
                            </a>
                        </div>
                        <div class="div1">
                            <ul>
                                <center>
                                <br>
                                <br>
                                    <li><a href="#">加入我们 |</a></li>
                                    <li><a href="#">联系我们 |</a></li>
                                    <li><a href="#">关于我们 |</a></li>
                                    <li><a href="#">帮助中心 |</a></li>
                                    <li><a href="#">网站合作 |</a></li>
                                    <li><a href="#">问题反馈 |</a></li>
                                    <li><a href="#">网站地图 |</a></li>
                                    <li><a href="#">隐私政策 |</a></li> <br> <br>
                                    <li><a href="#">关注我们 </a></li>
                                </center>
                                <li><span
                                    style="font-size: 15px; color: black; float: right; margin-right: 60px;">微信公众号
                                        &nbsp;&nbsp;&nbsp; 微信客服号</span></li>
                                <br>
                                <center>
                                    <li>cup&nbsp; cup有限公司Copyright 2017-2017Inc. All
                                        rights reserved.</li>
                                </center>
                            </ul>
                        </div>
                        <div>
                            <a href="#"> <img alt="erweima" src="img/wechat.png"
                                style="width: 100px; float: right; margin-right: 150px; margin-top: -30px;">
                                <img alt="erweima" src="img/1.png"
                                style="width: 100px; float: right; margin-right: -210px; margin-top: -30px;">
                            </a>
                        </div>
                    </div>
                    <div class="div1">
                        <ul>
                            <center>
                                <li><a href="#"><span
                                        style="font-size: 10px; margin-left: 250px;">京ICP证00000号</span></li>
                                <li><a href="#"><span style="font-size: 10px;">网络文化经营许可证</span></li>
                                <li><a href="#"><span style="font-size: 10px;">京公网安备：00000000000号</span></li>
                                <li><a href="#"><span style="font-size: 10px;">网络视听许可证0000000号</span></li>
                            </center>
                        </ul>
                    </div>
                </footer>
   </div>    
    
    
</body>
</html>
