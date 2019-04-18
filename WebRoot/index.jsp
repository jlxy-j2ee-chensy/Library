<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>XX图书馆首页</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap（离线） -->
<link rel="stylesheet" type="text/css" href="/Library/style/bootstrap.min.css" />
<!-- Bootstrap（在线） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- 通用样式 -->
<link rel="stylesheet" type="text/css" href="/Library/style/common.css" />
<!-- 首页专用样式 -->
<link rel="stylesheet" type="text/css" href="/Library/style/index.css" />

</head>

<body>
	<%@ include file="header.jsp"%>

	<!-- 主体容器 -->
	<div class="container section">
		<div class="row">
			<!-- 搜索框组 -->
			<div class="col-md-12">
				<form action="book-serach.jsp" method="post">
					<div class="input-group" id="search-group">
						<input class="form-control" type="text" placeholder="请输入关键字" /> <span
							class="input-group-btn">
							<button class="btn btn-default" type="submit">搜索</button>
						</span>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<!-- 新闻公告 -->
			<div class="col-md-6">
				<h3>新闻公告</h3>
				<div class="list-group">
					<a class="list-group-item" href="#">
						新闻1：xxxxxxxxxxxx
						<div class="pull-right small">xx月xx日</div>
					</a>
					<a class="list-group-item" href="#">
						新闻1：xxxxxxxxxxxx
						<div class="pull-right small">xx月xx日</div>
					</a>
					<a class="list-group-item" href="#">
						新闻1：xxxxxxxxxxxx
						<div class="pull-right small">xx月xx日</div>
					</a>
					<a class="list-group-item" href="#">
						新闻1：xxxxxxxxxxxx
						<div class="pull-right small">xx月xx日</div>
					</a>
					<a class="list-group-item" href="#">
						新闻1：xxxxxxxxxxxx
						<div class="pull-right small">xx月xx日</div>
					</a>
				</div>
			</div>
			<!-- 热门图书 -->
			<div class="col-md-6">
				<h3>热门图书</h3>
				<div class="list-group">
					<a class="list-group-item" href="#">
						<div class="media">
							<div class="media-left">
								<img class="media-object" src="/Library/image/book/小王子.jpg" alt="小王子" />
							</div>
							<div class="media-body">
								<h4 class="media-heading">小王子</h4>
								<small>《小王子》描写了居住在遥远星球上的小王子，因为与骄傲的玫瑰花吵架，离开自己的星球，去众多不同星球旅行，最后来到地球，邂逅了落难的飞行员。……</small>
							</div>
						</div>
					</a>
					<a class="list-group-item" href="#">
						<div class="media">
							<div class="media-left">
								<img class="media-object" src="/Library/image/book/小王子.jpg" alt="小王子" />
							</div>
							<div class="media-body">
								<h4 class="media-heading">小王子</h4>
								<small>《小王子》描写了居住在遥远星球上的小王子，因为与骄傲的玫瑰花吵架，离开自己的星球，去众多不同星球旅行，最后来到地球，邂逅了落难的飞行员。……</small>
							</div>
						</div>
					</a>
					<a class="list-group-item" href="#">
						<div class="media">
							<div class="media-left">
								<img class="media-object" src="/Library/image/book/小王子.jpg" alt="小王子" />
							</div>
							<div class="media-body">
								<h4 class="media-heading">小王子</h4>
								<small>《小王子》描写了居住在遥远星球上的小王子，因为与骄傲的玫瑰花吵架，离开自己的星球，去众多不同星球旅行，最后来到地球，邂逅了落难的飞行员。……</small>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
