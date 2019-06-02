<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	if ("logout".equals(request.getParameter("action"))) {
		// 退出登录
		session.setAttribute("CurrentUser", null);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>XX图书馆首页</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/Library/css/bootstrap.min.css" />
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
			<!-- 搜索框组 -->
			<div class="col-md-12">
				<form action='<%=request.getContextPath() + "/book_list.jsp"%>' method="post">
					<div class="input-group" id="search-group">
						<input class="form-control" type="text" placeholder="请输入关键字" name="text" />
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
				<div id="index_news" class="list-group">
					<%
						String title;
						String date;
						for (int i = 1; i <= 6; i++) {
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
				<%@ include file="index_books.jsp"%>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
