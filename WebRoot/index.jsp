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

<title>XX图书馆首页</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
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
				<form action="/Library/book_list.jsp" method="post">
					<div class="input-group" id="index-search">
						<input class="form-control" type="text" placeholder="请输入关键字" name="text" />
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">搜索</button>
						</span>
					</div>
				</form>
			</div><%-- div.col --%>
		</div><%-- div.row --%>
		<div class="row">
			<!-- 新闻公告 -->
			<div class="col-md-6">
				<h3>新闻公告</h3>
				<div id="index-news" class="list-group">
					<%
						ArrayList<NewsPiece> list = news.getLatest(6);
						for (NewsPiece newsPiece : list) {
					%>
					<a class="list-group-item" href="/Library/news_info.jsp?newsid=<%=newsPiece.getId()%>">
						<%=newsPiece.getTitle()%>
						<div class="pull-right small"><%=newsPiece.showDate()%></div>
					</a>
					<%
						}
					%>
				</div><%-- div.list-group --%>
			</div><%-- div.col --%>
			<!-- 热门图书 -->
			<div class="col-md-6">
				<%@ include file="index_books.jsp"%>
			</div><%-- div.col --%>
		</div><%-- div.row --%>
	</div><%-- div.container --%>

	<%@ include file="footer.jsp"%>
</body>
</html>

