<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="news" scope="page" class="jlxy.chensy.db.News" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>新闻公告－XX图书馆</title>

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

	<div class="container section">
		 
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
				</div>
			</div>
</div>
		<%@ include file="footer.jsp"%>
</body>
</html>