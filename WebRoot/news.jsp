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
<link rel="stylesheet" type="text/css"
	href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
<!-- js -->
<script src="/Library/js/jquery-3.4.1.min.js"></script>
<script src="/Library/js/bootstrap.min.js"></script>
</head>


<body onload="time();">

	<%@ include file="header.jsp"%>

	<div class="container section">

		<!-- 新闻公告 -->
		<h3>新闻公告</h3>
		<table class="table table-hover" style="font-size: small;">
			<!-- 			<tr>
				<th>新闻标题</th>
				<th>新闻时间</th>
			</tr> -->
			<%
				ArrayList<NewsPiece> list = news.getLatest(0);
				for (NewsPiece n : list) {
			%>
			<tr>
				<td style="line-height: 2;"><a
					href="/Library/news_info.jsp?newsid=<%=n.getId()%>"><%=n.showTitle()%></a>
				</td>
				<td style="line-height: 2;"><%=n.showDate()%></td>
				<%
					if (user != null && user.getRole() >= User.ROLE_ADMIN) {
				%>
				<td>
					<button class="btn btn-default btn-sm" type="button"
						onclick="newsDelete'<%=n.getId()%>')">删除</button>
				</td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>