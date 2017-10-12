<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>帮助中心-用户登陆</title>
<style type="text/css">
a {
	text-decoration: none;
	color: #999;
}

.font {
	font-size: 12px;
	color: #999;
}
</style>
<jsp:include page="title.jsp"></jsp:include>

</head>
<body>
	<div style="height: 1600px; background-color: #F1F7F7">
		<div style="width: 70%; margin: 0px auto;">
			<div
				style="width: 20%; border: 1px solid #999; font-size: 20px; text-align: center; display: inline-block;">
				<div
					style="height: 70px; background-color: #666; font-size: 30px; text-align: center; line-height: 70px">帮助中心</div>
				<p>
					<a href="help1.jsp">新用户注册</a>
				</p>
				<p>
					<a href="help2.jsp">用户登陆</a>
				</p>
				<p>
					<a href="help3.jsp">用户常见问题</a>
				</p>
				<p>
					<a href="help4.jsp">影城取票</a>
				</p>
				<p>购票常见问题</p>
			</div>
			<div style="width: 70%; float: right;">
				<h3>购票常见问题</h3>
				<br>
				<p>1.是否只有注册成为网站用户才能购票?</p>
				<p class="font">是的， 注册成功后即可购票。</p>
				<br>
				<p>2.影片开场前最迟多长时间就不开放影片的网上购票了?</p>
				<p class="font">只要您想购买影票的影片还未开场，您都可以在网上购买该场影片的影票。但我们建议您综合考虑交通等方面的问题，避免错过开场时间。</p>
				<br>
				<p>3.网上购票，最多可买多少张影票?</p>
				<p class="font">在同一笔订单内，您最多可购买4张影票。若购买量大于4张，您必须再进行一次购买流程。同时为了避免恶意订购的行为，每个帐号每天限购8张。</p>
				<br>
				<p>4.在卡噗官网上看到的影片场次和座位图是否跟影院一样？</p>
				<p class="font">是一样的，卡噗官网系统与影院售票系统直接相连，您在网上看到的座位图就是影城的实际座位图，请您放心选择自己喜欢的座位。</p>
				<br>
				<p>5.选定的座位，系统会一直保留吗？</p>
				<p class="font">您选定的座位提交订单后，系统会为您保留15分钟，等待您完成支付后，选定的座位将会为您锁定。如果超过15分钟您未完成支付，系统会将您选定的座位释放，以便其他用户购买。</p>
				<br>
				<p>6.为何我的电脑屏幕上无法显示座位图？</p>
				<p class="font">请尽量使用IE6.0及以上更高版本的IE浏览器。我们会努力支持更多浏览器。</p>
				<br>
				<p>7.为什么我点击"确认无误，支付"后页面无反应，刷新页面后，我选的座位变红了？返回座位图时显示我刚才选的座位已变成红色，这是为什么？我想换座怎么办？</p>
				<p class="font">当有2个或以上的会员同时选择某个座位并提交订单时，即会出现上面的情况。网速或操作较快的一方将订票成功；建议会员查看"用户中心"—"我的订单"，如金额未扣除并未有订单产生，则可进行重新购票操作。</p>
				<br>
				<p>8.为什么我支付时总是看不到支付的页面？</p>
				<p class="font">请您暂时关闭浏览器的弹出窗口拦截功能，如果已经关闭，还是看不到支付的页面，可能由于网络速度慢，可尝试刷新页面或关闭页面重新选择。</p>
				<br>
				<p>9.我购票支付后，网银支付结果显示已经扣费，但为什么我没有收到取票短信？</p>
				<p class="font">您可以在"订单记录"中查询到此单的交易状态，如果"支付状态"显示"未付或支付失败"，请您及时与万达电影网客服中心联系，我们会妥善处理的。</p>
				<br>
				<p>10.在网站购票成功后未收到兑换影票的密码串信息？</p>
				<p class="font">在网站购票成功后，兑换影票的电子密码串信息将在5分钟左右的时间内以短信的形式发送至您指定接收的手机上。如未及时收到，可进入用户中心"我的订单"选择密码重发功能。</p>
				<br>
				<p>11.购票成功后，有没有取票的最后时限?</p>
				<p class="font">网上购票成功后至该场影片放映结束前，您都可以在该影城大堂的自助取票机拿到您所购买的影票。</p>
				<br>
				<p>12.网上购票后，我怎样取票呢？</p>
				<p class="font">请携带您订票用的会员卡或者手机取票短信，到所选影城大堂的自助取票机取票。</p>
				<br>
				<p>13.我可否在卡噗官网上购买学生或老人优惠影票？</p>
				<p class="font">非常抱歉，由于无法检验证件，我们的网站目前不出售学生或老人优惠影票。</p>
				<br>

			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>