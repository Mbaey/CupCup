<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="css/gou.css" />
 <link rel="stylesheet" href="css/footer.css">
 
 <script language="javascript" type="text/javascript" src="js/goupiao.js"></script>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 

<link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,500,700,900' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/booNavigation.css">
        <link rel="stylesheet" href="css/medile.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
       <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	 
	 <script type="text/javascript">
	     var zuoweipiao = 0;
	     var arr=new Array(200);
	     var arr2=new Array(200);
	     var arr3=new Array(200);
	     for(var i = 1; i < 200; i++){
	    	 arr[i] = 0;//用来记录每个座位是否被选
	    	 arr2[i] = 0;//只有4个有用，保存所选的位置
	    	 arr3[i] = 0;//保存选择的票的位置号
	     }
	     
	      $(function(){
	    	  //点击座位后算出座位位置
	    	  //并改变其css
	    	  $(".zuo").click(function(){
	    		  /* var zuoweihao = 'zuo1';
	    		  var div1 = document.getElementById(zuoweihao);
	    		  var tep = "1";
	    		  $("#p1").html("1排1座");
	    		  var tep =  $(this).attr("id");
	    		  var test = "#" + tep;*/
	    		  
	    		  if(zuoweipiao < 4){
	    			  $(this).toggleClass("zuoweise");
		    		  
		    		  var tep =  $(this).attr("id");
		    		  var tep2 = parseInt(tep);
		    		  
		    		  arr[tep2]++;
	    			  
	    			  if(arr[tep2] % 2 != 0){
		    			  for(var i = 1; i < 5; i++){
		    				  if(arr2[i] == 0){
		    					  arr3[tep2] = i;
		    					  var val = "#p"+i;
		    					  arr2[i] = tep2;
		    					  
		    					  if(tep % 15 == 0){
		    						  int1 = 15;
		    					  }else{
		    						  int1 = tep2 % 15;
		    					  }
		    					  var int2 = Math.ceil(tep2 / 15);
		    					  if(int2 > 4 && int2 < 8){
		    						  int1 += 2;
		    					  }else if(int2 == 8){
		    						  int1 += 4;
		    					  }
		    					  $(val).html(int2+"排"+int1+"座");
		    					  zuoweipiao++;
		    					  break;
		    				  }
		    			  }
		    		  }else if(arr[tep2] % 2 == 0){
		    			  var val1 = arr3[tep2];
		    			  arr2[val1] = 0;
		    			  var val = "#p"+ val1;
		    			  $(val).html("");
		    			  arr3[tep2] == 0;
		    			  zuoweipiao--;
		    		  }
	    		  }else if(zuoweipiao >= 4){
	    			  alert("每人只能买4张票哟");
	    		  }
	    		  
	    	  });
	    	  
	    	  //最终提交购票
	    	  $("#zuizhongtijiao").click(function(){
	    		  $.post("gouPiaoController?op=gouPiao",
	    				  {"zuo1":arr2[1], "zuo2":arr2[2], "zuo3":arr2[3],"zuo4":arr2[4]},
							function(data){
	    					  
	    					  if(data["flag"] == -1){ 
	    					  //var res = JSON.stringify(data);
									for(var p in data){//遍历json对象的每个key/value对,p为key
										var res1 = data[p];
										$("#" + res1).css("background-color", "#EF4238");
										$("#" + res1).removeClass("zuo");
										$("#" + res1).unbind("click");
										zuoweipiao = 0;
											for(var i = 1; i < 200; i++){
												arr[i] = 0;//用来记录每个座位是否被选
												arr2[i] = 0;//只有4个有用，保存所选的位置
												arr3[i] = 0;//保存选择的票的位置号
											}
									}
									alert("订票成功");
	    					  }else {
									alert("请先登录再买票哦");
									window.location.replace('login.jsp');
							  }
							},
	    				  "json");
	    	  });
	    	  
	    	  //每次页面一刷新就访问数据库
	    	  //局部刷新座位的信息
	    	  $.post("gouPiaoController?op=selectSeat",
    				  {"zuo1":arr2[1], "zuo2":arr2[2], "zuo3":arr2[3],"zuo4":arr2[4]},
						function(data){
    					  //var res = JSON.stringify(data);
							for(var p in data){//遍历json对象的每个key/value对,p为key
								  var res1 = data[p];
								  $("#" + res1).removeClass("zuo");
		    					  $("#" + res1).css("background-color", "#EF4238");
		    					  //一定要解除绑定，不然就算上面去掉了class再点击也会有事件！！！！
		    					  $("#" + res1).unbind("click"); 
							}
			  },"json");
	    	  
	     });
	      
	 </script>
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
  
  <div style="width:980px; height:718px; margin:0px auto; ">
      <div id="goupiao">
                          <artical>
                      <div id="artical">
                          <br />
                          <hr  style="height:1px;border:none;border-top:1px dotted #DDDDDD; width:680px; margin-left:20px"/>
                          
                          
                          
                          <div>
                              <div id="yingmu">
                                 <ul style="margin-left:190px"><img src="img/log2.png" /></ul>
                                 <ul style="margin-left:10px"><img src="img/log3.png" /></ul>
                              </div>
                              
                              <div id="xuanzuo">
                                  <ul style="cursor:pointer">
                                     <span class="pai">1排</span>
                                     <li class="zuo" id="1"></li>
                                     <li class="zuo" id="2"></li>
                                     <li class="zuo" id="3"></li>
                                     <li class="zuo" id="4"></li>
                                     <li class="zuo" id="5"></li>
                                     <li class="zuo" id="6"></li>
                                     <li class="zuo" id="7"></li>
                                     <li class="zuo" id="8"></li>
                                     <li class="zuo" id="9"></li>
                                     <li class="zuo" id="10"></li>
                                     <li class="zuo" id="11"></li>
                                     <li class="zuo" id="12"></li>
                                     <li class="zuo" id="13"></li>
                                     <li class="zuo" id="14"></li>
                                     <li class="zuo" id="15"></li>
                                  </ul><br />
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai">2排</span>
                                     <li class="zuo" id="16"></li>
                                     <li class="zuo" id="17"></li>
                                     <li class="zuo" id="18"></li>
                                     <li class="zuo" id="19"></li>
                                     <li class="zuo" id="20"></li>
                                     <li class="zuo" id="21"></li>
                                     <li class="zuo" id="22"></li>
                                     <li class="zuo" id="23"></li>
                                     <li class="zuo" id="24"></li>
                                     <li class="zuo" id="25"></li>
                                     <li class="zuo" id="26"></li>
                                     <li class="zuo" id="27"></li>
                                     <li class="zuo" id="28"></li>
                                     <li class="zuo" id="29"></li>
                                     <li class="zuo" id="30"></li>
                                  </ul><br />
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai">3排</span>
                                     <li class="zuo" id="31"></li>
                                     <li class="zuo" id="32"></li>
                                     <li class="zuo" id="33"></li>
                                     <li class="zuo" id="34"></li>
                                     <li class="zuo" id="35"></li>
                                     <li class="zuo" id="36"></li>
                                     <li class="zuo" id="37"></li>
                                     <li class="zuo" id="38"></li>
                                     <li class="zuo" id="39"></li>
                                     <li class="zuo" id="40"></li>
                                     <li class="zuo" id="41"></li>
                                     <li class="zuo" id="42"></li>
                                     <li class="zuo" id="43"></li>
                                     <li class="zuo" id="44"></li>
                                     <li class="zuo" id="45"></li>
                                  </ul><br />
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai2">4排</span>
                                     <li class="zuo" id="121"></li>
                                     <li class="zuo" id="122"></li>
                                     <li class="zuo" id="123" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="124" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="46"></li>
                                     <li class="zuo" id="47"></li>
                                     <li class="zuo" id="48"></li>
                                     <li class="zuo" id="49"></li>
                                     <li class="zuo" id="50"></li>
                                     <li class="zuo" id="51"></li>
                                     <li class="zuo" id="52"></li>
                                     <li class="zuo" id="53"></li>
                                     <li class="zuo" id="54"></li>
                                     <li class="zuo" id="55"></li>
                                     <li class="zuo" id="56"></li>
                                     <li class="zuo" id="57"></li>
                                     <li class="zuo" id="58"></li>
                                     <li class="zuo" id="59"></li>
                                     <li class="zuo" id="60"></li>
                                     <li class="zuo" id="125" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="126" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="127"></li>
                                     <li class="zuo" id="128"></li>
                                  </ul><br />
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai2">5排</span>
                                     <li class="zuo" id="129"></li>
                                     <li class="zuo" id="130"></li>
                                     <li class="zuo" id="131" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="132" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="61"></li>
                                     <li class="zuo" id="62"></li>
                                     <li class="zuo" id="63"></li>
                                     <li class="zuo" id="64"></li>
                                     <li class="zuo" id="65"></li>
                                     <li class="zuo" id="66"></li>
                                     <li class="zuo" id="67"></li>
                                     <li class="zuo" id="68"></li>
                                     <li class="zuo" id="69"></li>
                                     <li class="zuo" id="70"></li>
                                     <li class="zuo" id="71"></li>
                                     <li class="zuo" id="72"></li>
                                     <li class="zuo" id="73"></li>
                                     <li class="zuo" id="74"></li>
                                     <li class="zuo" id="75"></li>
                                     <li class="zuo" id="133" style="border: #FFF solid 1px;"></li></a>
                                     <li class="zuo" id="134" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="135"></li>
                                     <li class="zuo" id="136"></li>
                                  </ul><br />
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai2">6排</span>
                                     <li class="zuo" id="137"></li>
                                     <li class="zuo" id="138"></li>
                                     <li class="zuo" id="139" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="140" style="border: #FFF solid 1px;"></li></a>
                                     <li class="zuo" id="76"></li>
                                     <li class="zuo" id="77"></li>
                                     <li class="zuo" id="78"></li>
                                     <li class="zuo" id="79"></li>
                                     <li class="zuo" id="80"></li>
                                     <li class="zuo" id="81"></li>
                                     <li class="zuo" id="82"></li>
                                     <li class="zuo" id="83"></li>
                                     <li class="zuo" id="84"></li>
                                     <li class="zuo" id="85"></li>
                                     <li class="zuo" id="86"></li>
                                     <li class="zuo" id="87"></li>
                                     <li class="zuo" id="88"></li>
                                     <li class="zuo" id="89"></li>
                                     <li class="zuo" id="90"></li>
                                     <li class="zuo" id="141" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="142" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="143"></li>
                                     <li class="zuo" id="144"></li>
                                  </ul><br />
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai2">7排</span>
                                     <li class="zuo" id="145"></li>
                                     <li class="zuo" id="146"></li>
                                     <li class="zuo" id="147" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="148" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="91"></li>
                                     <li class="zuo" id="92"></li>
                                     <li class="zuo" id="93"></li>
                                     <li class="zuo" id="94"></li>
                                     <li class="zuo" id="95"></li>
                                     <li class="zuo" id="96"></li>
                                     <li class="zuo" id="97"></li>
                                     <li class="zuo" id="98"></li>
                                     <li class="zuo" id="99"></li>
                                     <li class="zuo" id="100"></li>
                                     <li class="zuo" id="101"></li>
                                     <li class="zuo" id="102"></li>
                                     <li class="zuo" id="103"></li>
                                     <li class="zuo" id="104"></li>
                                     <li class="zuo" id="105"></li>
                                     <li class="zuo" id="149" style="border: #FFF solid 1px;"></li></a>
                                     <li class="zuo" id="150" style="border: #FFF solid 1px;"></li>
                                     <li class="zuo" id="151"></li>
                                     <li class="zuo" id="152"></li>
                                  </ul><br />
                                  
                                  
                                  
                                  <ul style="cursor:pointer">
                                     <span class="pai2">8排</span>
                                     <li class="zuo" id="153"></li>
                                     <li class="zuo" id="154"></li>
                                     <li class="zuo" id="155"></li>
                                     <li class="zuo" id="156"></li>
                                     <li class="zuo" id="106"></li>
                                     <li class="zuo" id="107"></li>
                                     <li class="zuo" id="108"></li>
                                     <li class="zuo" id="109"></li>
                                     <li class="zuo" id="110"></li>
                                     <li class="zuo" id="111"></li>
                                     <li class="zuo" id="112"></li>
                                     <li class="zuo" id="113"></li>
                                     <li class="zuo" id="114"></li>
                                     <li class="zuo" id="115"></li>
                                     <li class="zuo" id="116"></li>
                                     <li class="zuo" id="117"></li>
                                     <li class="zuo" id="118"></li>
                                     <li class="zuo" id="119"></li>
                                     <li class="zuo" id="120"></li>
                                     <li class="zuo" id="157"></li>
                                     <li class="zuo" id="158"></li>
                                     <li class="zuo" id="159"></li>
                                     <li class="zuo" id="160"></li>
                                  </ul><br />
                                  
                              </div>
                           </div>
                
                          
                      </div>
                    </artical>
      </div>
      
      
      
      <div id="goupiaoxinxi">
           <div style="width:100%; height:138px">
              <img style=" width:70px; height:103px;float:left; margin-top:16px; margin-left:15px" src="${sessionScope.movie.cover }">
              <div class="xuanzuobiaoti"><a style="color:#000" href="#">${sessionScope.movie.title }</a></div>
           </div>
           <p style=" margin-left:100px; margin-top:-50px; font-size:9px">导演&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${sessionScope.movie.director }</span></p>
           <p style=" margin-left:100px; margin-top:-10px; font-size:9px">时长&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${sessionScope.movie.timelen }</span></p>
           
           <hr  style="border-top:1px solid #DDDDDD; width:233px; margin-left:15px; margin-top:16px"/>
           
           <dl class="liebiao">
             <dd><span>影院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>cupcup国际影城</dd>
             <dd><span>影厅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${sessionScope.moviescene }号厅-cupcup电影网购票</dd>
             <dd><span>版本&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${type }</dd>
             <dd><span>场次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${stime }-${etime }</dd>
             <dd><span>票价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>¥${price }/张<span>（含服务费¥3.5）</span></dd>  
           </dl>
           
           <hr  style="border-top:1px solid #DDDDDD; width:233px; margin-left:15px; margin-top:16px"/>
           
            <dl class="liebiao">
             <dd><span>座位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>点击左侧座位直接选择</dd>
             <dd><span>您选的座位</dd>  
           </dl>
           
           <ul class="zuoweipiao">
               <li style="margin-left:60px"><img src="img/log7.png"><p id="p1"></p></li>
               <li><img src="img/log7.png"><p id="p2"></p></li><br/><br/>
               <li style="margin-left:60px"><img src="img/log7.png"><p id="p3"></p></li>
               <li><img src="img/log7.png"><p id="p4"></p></li>
           </ul>
           
           <form>
              <input type="button" id="zuizhongtijiao" class="btn btn-info btn-lg" value="提交订单" style=" background-color:#FF8F0B; border-color:#FF8F0B; width:230px; margin-left:16px; margin-top:15px;">
           </form>
           
           <hr  style="border-top:1px solid #DDDDDD; width:233px; margin-left:15px; margin-top:16px"/>
           <img style="margin-left:20px; border:#FFF solid 1px;" src="img/log8.png">
           <a href="gouPiaoController?op=dianYingPiao"><button class="btn btn-info btn-lg" style="width:230px;height:40px;background-color:#FF8F0B;margin-left:15px"><p style="font-size: 18px">查看电影票</p></button></a>
      </div>
     
  </div>
  <div id="tishi">
     <span class="zi"><p style="font-size:18px">简单三步，选座购票</p></span>
     <hr  style="border-top:1px solid #DDDDDD; width:950px; position:absolute; margin-left:15px; margin-top:50px;"/>
     <img style=" margin-top:60px; margin-left:50px" src="img/log9.png">
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
