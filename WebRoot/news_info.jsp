<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="news" scope="page" class="jlxy.chensy.db.News" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>新闻详情－XX图书馆</title>

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
		<%
			String action = request.getParameter("action");
			if (action == null)
				action = "view";
			int id;
			try {
				id = Integer.parseInt(request.getParameter("newsid"));
			} catch (NumberFormatException e) {
				id = 0;
			}
			if ("delete".equals(action)) {
				news.delete(id);
				response.sendRedirect("/Library/index.jsp");
			}
			if ("submit".equals(action)) {
				NewsPiece newsPiece = new NewsPiece();
				newsPiece.setId(id);
				newsPiece.setTitle(Util.getParameter(request, "title"));
				newsPiece.setContent(Util.getParameter(request, "content"));
				newsPiece.updateTime();
				id = news.update(newsPiece).getId();
			}
			NewsPiece newsPiece = news.get(id);
			if ("new".equals(action))
				newsPiece = new NewsPiece();
			String error = null;
			if (("new".equals(action) || "edit".equals(action)) && (user == null || user.getRole() < User.ROLE_ADMIN))
				error = "权限不足！";
			if (newsPiece == null)
				error = "新闻不存在：" + id;

			if (error != null) {
		%>
		<p class="error"><%=error%></p>
		<%
			} else if ("view".equals(action) || "submit".equals(action)) {
		%>
		<%-- 查看 --%>
		<div class="row">
			<div class="col-md-10">
				<h2><%=newsPiece.getTitle()%></h1>
					<p><%=newsPiece.getContent()%></p>
			</div>
			<%-- 操作 --%>
			<div class="col-md-2">
				<%-- 管理员操作 --%>
				<%
					if (user != null && user.getRole() >= User.ROLE_ADMIN) {
				%>
				<div class="btn-group-vertical" role="group" aria-label="..."
					style="margin-top: 72px;">
					<a type="button" class="btn btn-default"
						href="/Library/news_info.jsp?newsid=<%=id%>&action=edit">编辑此新闻</a>
					<a type="button" class="btn btn-default"
						href="/Library/news_info.jsp?newsid=<%=id%>&action=delete">删除此新闻</a>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<%
			} else if ("edit".equals(action) || ("new".equals(action))) {
		%>
		<%-- 编辑 --%>
		<form action="/Library/news_info.jsp?newsid=<%=id%>&action=submit"
			method="post" class="form-horizontal">
			<div class="row">
				<div class="col-md-10">
					<div class="form-group">
						<label for="inputTitle" class="control-label">标题</label>
						<div>
							<input type="text" class="form-control" id="inputTitle"
								name="title" placeholder="标题" value='<%=newsPiece.showTitle()%>' />
						</div>
					</div>
					<div class="form-group">
						<label for="textareaContent" class="control-label">内容</label>
						<div>
							<textarea class="form-control" id="textareaContent"
								name="content" placeholder="标题" rows="8"><%=newsPiece.showContent()%></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="btn-group-vertical" role="group" aria-label="..."
						style="margin-top: 72px;">
						<button type="submit" class="btn btn-default">提交</button>
						<button type="button" class="btn btn-default"
							onclick="window.history.back();">取消</button>
					</div>
				</div>
			</div>
		</form>
		<%
			}
		%>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>