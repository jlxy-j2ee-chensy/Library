<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>XX图书馆首页</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap（离线） -->
<link rel="stylesheet" type="text/css" href="/Library/style/bootstrap.min.css" />
<!-- Bootstrap（在线） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
				<form action="#" method="post">
					<div class="input-group" id="search-group">
						<input class="form-control" type="text" placeholder="请输入关键字" />
						<span class="input-group-btn">
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
					<%
						String title;
						String date;
						for (int i = 1; i <= 7; i++) {
							title = "新闻" + i + "：xxxxxxxxxxxx";
							date = "4月" + i + "日";
					%>
					<a class="list-group-item" href="#">	
						<%=title%>
						<div class="pull-right small"><%=date%></div>
					</a>
					<%
						}
					%>
				</div>
			</div>
			<!-- 热门图书 -->
			<div class="col-md-6">
				<h3>热门图书</h3>
				<div class="list-group">
					<%
						String picture;
						String description;
						for (int i = 1; i <= 3; i++) {
							title = "小王子";
							picture = "小王子.jpg";
							description = "《小王子》描写了居住在遥远星球上的小王子，因为与骄傲的玫瑰花吵架，离开自己的星球，去众多不同星球旅行，最后来到地球，邂逅了落难的飞行员。……";
					%>
					<a class="list-group-item" href="#">
						<div class="media">
							<div class="media-left">
								<img class="media-object" src='<%=request.getContextPath() + "/image/book/" + picture%>' alt="<%=title%>" />
							</div>
							<div class="media-body">
								<h4 class="media-heading"><%=title%></h4>
								<small><%=description%></small>
							</div>
						</div>
					</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
