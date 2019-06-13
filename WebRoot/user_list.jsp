<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="users" scope="page" class="jlxy.chensy.db.Users" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>图书检索－XX图书馆</title>

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
			if (session.getAttribute("CurrentUser") == null
					|| ((User) session.getAttribute("CurrentUser")).getRole() < User.ROLE_ADMIN) {
		%>
		<div class="error">用户权限不足！</div>
		<%
			} else {
		%>
		<script>
			function userDelete(user) {
				modal("确认删除", "<p>您确定要删除此用户吗？</p>", function() {
					$.post("/Library/user/user_delete.jsp", {
						username : user
					}, function(data) {
						if (data == "删除成功") {
							modal("删除成功", "用户已删除。点击“确定”刷新页面。", "refresh");
						} else {
							modal("删除失败", "用户删除失败！", "refresh");
						}
					});
				}, "close")
			}
		</script>
		<%-- 列表 --%>
		<%
			ArrayList<User> list = users.getUsers();
		%>
		<div style="margin-top: 24px;">
			<span class="pull-left"> 共有<%=list.size()%>条结果。
			</span>

		</div>
		<table class="table table-hover" style="font-size: small;">
			<tr>
				<th>用户名</th>
				<th>权限</th>
				<th>注册时间</th>
				<th>最后登录时间</th>
				<th></th>
			</tr>
			<%
				for (User u : list) {
			%>
			<tr>
				<td style="line-height: 2;"><%=u.getUsername()%></td>
				<td style="line-height: 2;"><%=User.ROLE_INFO[u.getRole()]%></td>
				<td style="line-height: 2;"><%=u.showRegister_time()%></td>
				<td style="line-height: 2;"><%=u.showLogin_time()%></td>
				<td><button class="btn btn-default btn-sm" type="button"
						onclick="userDelete('<%=u.getUsername()%>')">删除</button></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>