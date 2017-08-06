<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta charset="utf-8"/>
<title>欢迎您的加入</title>
   <link type="text/css" href="css/deng.css" rel="stylesheet" />
   <link href="css/1140.css" rel="stylesheet"/>

    <link href="css/normalize.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/footer.css">

    
    <link href="css/jquery-ui.css" rel="stylesheet"/>
    <link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>
    
    <link href="css/styles.css" rel="stylesheet" media="all"/>
<!-- 
   <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
   <script src="bootstrap\js\jquery.min.js"></script>
   <script src="bootstrap\js\bootstrap.min.js"></script>
   -->
    	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    .error{
        color:red;
    }
    </style>
</head>

<body>
       
        <div><img  style="width:85%; height:100px; margin-left:120px" src="img/regist/rl_top.png" /></div>
        <div style="margin:0px auto; width:1000px; height:600px; margin-top:-10px">
            <div style="height:2px; width:100%; background-color: #CCC; margin-top:34px"><h5 style="margin-left:350px; position:absolute; font-size:36px; margin-top:-28px">欢迎加入CupCup~</h5></div>
            
           
            <div class="login-left">
                <ul>
                    <li class="den1"></li>
                    
                    <li class="den2">
                         <img src="img/regist/liantu.png" />
                    </li>
                    
                    <li class="den3">
                         <img src="img/regist/A}_XA8}YDTNG46A5RI09WRL.jpg" />
                         <h3 style="font-size:18px;margin-left:125px; margin-top:-100px">请扫二维码登陆<h3>
                    </li>
                </ul>
            </div>
             
            
            <div class="login-right">
            <div id="main">
               <div class="container clearfix">
                    <div class="row">
                         <div class="eightcol last">
<!-- Begin Form -->
                                <form action="UserController?op=regist" id="my-form" style="border-color: #FFF; margin-top:-10px" method="post">
                                      <div>        
						<script type="text/javascript">
							$(function(){
								$("#username").blur(function(){
									var uname = $("#username").val();
									$.post("UserController?op=u_nameDeplicatedCheck",
											{"uname":uname},
											function(data){
												var res = JSON.stringify(data);
												if(data.res == "exist"){
													//根据服务器返回的结果，在页面中给用户以提示
													$("#myAlert").css("display", "block");
												}
												else{
													$("#myAlert").css("display", "none");
												}
									},"json");
									
								})
							})
						</script>
											
												<div id="myAlert" class="alert alert-warning" style="display: none;">
													<a href="#" class="close" data-dismiss="alert">&times;</a>
													<strong>对不起</strong>您的用户名已被注册。
												</div>
											
                                          <div><input id="username" name="username" type="text" placeholder="请输入用户名"/></div>
                                          <div><input id="pass" name="password" type="password" placeholder="请输入密码"/></div>
                                          <div><input id="email" name="email" data-ideal="required email" type="email" placeholder="请输入邮件"/></div>
                                      </div>
                                      <div>
                                        <input type="submit" value="注册">
                                        <button id="reset" type="button">重置</button>
                                      </div>
                                </form>
    <!-- End Form -->           <img class="den8" src="img/regist/log7.jpg" />
                                <img  class="den10" src="img/regist/log6.jpg" />
                         </div>
                    </div>
               </div>
           </div>
          </div>


    
        <script src="js/jquery-ui.min.js"></script>
        
        <script src="js/jquery.idealforms.js"></script>

       <script>
							  var options = {
							
							
								inputs: {
							
								  'password': {
							
									filters: 'required pass',
							
								  },
							
								  'username': {
							
									filters: 'required username',
							
								  }
								}
							
							  };
							  var $myform = $('#my-form').idealforms(options).data('idealforms');
							  $('#reset').click(function(){ $myform.reset().fresh().focusFirst() });
							  $myform.focusFirst();
         </script>
    </div>
    
      <div class="footer">
            <div>
            <div style="background-color:#56ACAC">
            <a href="#">
            <center><img alt="logo" src="img/regist/logo2.jpg" style="width: 200px">
            </center>
            
            </a>
            </div>
            <div class="div1">
            <ul>
            <center>
            <li><a href="#">加入我们 |</a></li>
            <li><a href="#">联系我们 |</a></li>
            <li><a href="#">关于我们 |</a></li>
            <li><a href="#">帮助中心 |</a></li>
            <li><a href="#">网站合作 |</a></li>
            <li><a href="#">问题反馈 |</a></li>
            <li><a href="#">网站地图 |</a></li>
            <li><a href="#">隐私政策 |</a></li>
            <li><a href="#">关注我们  </a></li>
            </center>
            <li>
            <span style="font-size: 15px;color: black;float: right;">微信公众号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 微信客服号</span></li>
            <br>
          
            <li style="margin-left:400px;">cup&nbsp; cup有限公司Copyright 2017-2017 cupcup.com Inc. All rights reserved.</li>
            </ul>
            </div>
            <div>
            <a href="#">
            <img alt="erweima" src="img/regist/wechat.png" style="width: 100px; float: right;margin-right: 225px;margin-top: 10px;">
            <img alt="erweima" src="img/regist/1.png" style="width: 100px; float: right;margin-right: -210px;margin-top: 10px;">
            </a>
            </div>
            </div>
            <div class="div1">
            <ul>
            <center>
            <li><a href="#"><span style="font-size:10px; margin-left: 250px;">京ICP证00000号</span></li>
            <li><a href="#"><span style="font-size:10px; ">网络文化经营许可证</span></li>
            <li><a href="#"><span style="font-size:10px;">京公网安备：00000000000号</span></li>
            <li><a href="#"><span style="font-size:10px;">网络视听许可证0000000号</span></li>
            </center>
            </ul>
            </div>
   </div>
</body>
</html>
