<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="news" class="jlxy.chensy.db.News" scope="page" />

<%
	if ("logout".equals(request.getParameter("action"))) {
		// 退出登录
		session.setAttribute("CurrentUser", null);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>关于图书馆-XX图书馆</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/index.css" />
<!-- js -->
<script src="/Library/js/jquery-3.4.1.min.js"></script>
<script src="/Library/js/bootstrap.min.js"></script>

</head>

<body onload="time();">
	<%@ include file="header.jsp"%>

	<!-- 主体容器 -->
	<div class="container section">
		<div class="row">
			<ul id="myTabs" class="nav nav-pills nav-stacked col-sm-3"
				role="tablist">
				<li role="presentation" class="active"><a href="#intro"
					id="intro-tab" role="tab" data-toggle="tab" aria-controls="intro"
					aria-expanded="false">网站说明</a></li>
				<li role="presentation"><a href="#use" role="tab" id="use-tab"
					data-toggle="tab" aria-controls="use" aria-expanded="true">使用说明</a></li>
				<li role="presentation"><a href="#author" role="tab"
					id="author-tab" data-toggle="tab" aria-controls="author"
					aria-expanded="true">开发团队</a></li>
			</ul>
			<div id="myTabContent" class="tab-content col-sm-9">
				<div role="tabpanel" class="tab-pane fade active in" id="intro"
					aria-labelledby="intro-tab">
					<p>XX图书馆网站（www.xxlibrary.com)创建于2019年5月，隶属于XX图书馆旗下。XX图书馆网以带给读者优秀的咨询及借阅体验为宗旨，长期致力于改善用户体验，并已经取得了一定的成果。</p>
					<p>经过开发团队的不断努力，XX图书馆网已经逐步拥有了各项方便于用户的功能，比如图书分类检索、图书模糊查找、图书精确查找、在线预约借阅图书等实用功能。</p>
					<p>同时，在增加功能之外，XX图书馆网也不忘完善更新数据库、优化用户访问体验及效率、提高网站UI美观性，有力推动了XX图书馆的发展。</p>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="use"
					aria-labelledby="use-tab">
					<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla
						single-origin coffee squid. Exercitation +1 labore velit, blog
						sartorial PBR leggings next level wes anderson artisan four loko
						farm-to-table craft beer twee. Qui photo booth letterpress,
						commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
						vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic
						magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna
						velit sapiente labore stumptown. Vegan fanny pack odio cillum wes
						anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa
						terry richardson biodiesel. Art party scenester stumptown, tumblr
						butcher vero sint qui sapiente accusamus tattooed echo park.</p>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="author"
					aria-labelledby="author-tab">
					<p>Etsy mixtape wayfarers, ethical wes anderson tofu before
						they sold out mcsweeney's organic lomo retro fanny pack lo-fi
						farm-to-table readymade. Messenger bag gentrify pitchfork tattooed
						craft beer, iphone skateboard locavore carles etsy salvia banksy
						hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify
						squid 8-bit cred pitchfork. Williamsburg banh mi whatever
						gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk
						vice blog. Scenester cred you probably haven't heard of them,
						vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth
						chambray yr.</p>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>

