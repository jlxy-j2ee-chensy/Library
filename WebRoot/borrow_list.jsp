<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="borrows" scope="page" class="jlxy.chensy.db.Borrows" />
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />
<jsp:useBean id="users" scope="page" class="jlxy.chensy.db.Users" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>账号借阅情况－XX图书馆</title>

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

		<%
			String error = null;
			ArrayList<Borrow> list;
			if ("all".equals(request.getParameter("action"))) {
				if (user == null || user.getRole() < User.ROLE_ADMIN) {
		%>
		<div class="error">用户权限不足！</div>
		<%
			} else {
					list = borrows.getAll();
		%>
		<%-- 全部列表 --%>
		<table class="table table-hover" style="font-size: small;">
			<tr>
				<th>用户名</th>
				<th>书名</th>
				<th>状态更新时间</th>
				<th>当前状态</th>
			</tr>
			<%
				for (Borrow b : list) {
			%>
			<tr>
				<td style="line-height: 2;"><%=users.getUser(b.getUserId()).getUsername()%></td>
				<td style="line-height: 2;"><%=books.getBook(b.getBookId()).showFullTitle()%></td>
				<td style="line-height: 2;"><%=b.showTime()%></td>
				<td style="line-height: 2;"><%=b.showStatus()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
			} else if (!Util.isNullOrEmpty(request.getParameter("bookid"))) {
				if (user == null || user.getRole() < User.ROLE_ADMIN) {
		%>
		<div class="error">用户权限不足！</div>
		<%
			} else {
					list = borrows.getByBook(Integer.parseInt(request.getParameter("bookid")));
		%>
		<%-- 图书列表 --%>
		<table class="table table-hover" style="font-size: small;">
			<tr>
				<th>用户名</th>
				<th>书名</th>
				<th>状态更新时间</th>
				<th>当前状态</th>
			</tr>
			<%
				for (Borrow b : list) {
			%>
			<tr>
				<td style="line-height: 2;"><%=users.getUser(b.getUserId()).getUsername()%></td>
				<td style="line-height: 2;"><%=books.getBook(b.getBookId()).showFullTitle()%></td>
				<td style="line-height: 2;"><%=b.showTime()%></td>
				<td style="line-height: 2;"><%=b.showStatus()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
			} else {
				if (user == null) {
		%>
		<div class="error">未登录！</div>
		<%
			} else {
					list = borrows.getByUser(user.getId());
		%>
		<%-- 用户列表 --%>
		<table class="table table-hover" style="font-size: small;">
			<tr>
				<th>用户名</th>
				<th>书名</th>
				<th>状态更新时间</th>
				<th>当前状态</th>
			</tr>
			<%
				for (Borrow b : list) {
			%>
			<tr>
				<td style="line-height: 2;"><%=users.getUser(b.getUserId()).getUsername()%></td>
				<td style="line-height: 2;"><%=books.getBook(b.getBookId()).showFullTitle()%></td>
				<td style="line-height: 2;"><%=b.showTime()%></td>
				<td style="line-height: 2;"><%=b.showStatus()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
			}
		%>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>