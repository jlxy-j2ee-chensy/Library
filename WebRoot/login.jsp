<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="jlxy.chensy.db.User" />
<%
	if ("login".equals(request.getParameter("action"))) {
		String username = request.getParameter("txtUsername");
		String password = request.getParameter("txtPassword");
		if (user.login(username, password)) {
			// 登录成功
			session.setAttribute("CurrentUser", username);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}

	if ("logout".equals(request.getParameter("action"))) {
		// 退出登录
		session.setAttribute("CurrentUser", null);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>用户登录－XX图书馆</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Bootstrap样式 -->
<link rel="stylesheet" type="text/css" href="/Library/style/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 通用样式 -->
<link rel="stylesheet" type="text/css" href="/Library/style/common.css" />

</head>

<body>
	<%@ include file='header.jsp'%>

	<div class="container section">
		<form name="form1" id="form1" method="post" action='<%=request.getContextPath() + "/login.jsp?action=login"%>'>
			<div class="form-group">
				<%
					String username = "";
					if ("login".equals(request.getParameter("action"))) {
						username = request.getParameter("txtUsername");
					}
				%>
				<label for="txtUsername">用户名</label>
				<input name="txtUsername" id="txtUsername" type="text" class="form-control" placeholder="用户名" value='<%=username%>'>
			</div>
			<div class="form-group">
				<label for="txtPassword">密码</label>
				<input name="txtPassword" id="txtPassword" type="password" class="form-control" placeholder="密码">
			</div>
			<%
				// 登录失败提示
				if ("login".equals(request.getParameter("action")))
					out.print("<div class='error'>" + user.getExtra() + "</div>");
			%>
			<button name="btnSubmit" id="btnSubmit" type="submit" class="btn btn-default">登录</button>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
