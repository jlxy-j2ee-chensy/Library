<%@ page language="java" import="java.util.*,java.sql.*,jlxy.chensy.db.*" pageEncoding="UTF-8"%>
<jsp:useBean id="users" scope="page" class="jlxy.chensy.db.Users" />
<%
	// 若已处于登录状态，则跳转至首页
	if (session.getAttribute("CurrentUser") != null) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

	// 提交注册表单时的操作
	if ("submit".equals(request.getParameter("action"))) {
		String username = request.getParameter("txtUsername");
		String password = request.getParameter("txtPassword");
		String password2 = request.getParameter("txtPassword2");
		User user = users.register(username, password, password2);
		if (user != null) {
			// 注册成功，登录用户
			out.print("<script>alert('注册成功！');window.location.href('index.jsp');</script>");
			session.setAttribute("CurrentUser", user);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>用户注册－XX图书馆</title>

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
		<form name="form1" id="form1" method="post" action='<%=request.getContextPath() + "/register.jsp?action=submit"%>'>
			<div class="form-group">
				<%
					// 填入上次提交的用户名
					String username = "";
					if ("submit".equals(request.getParameter("action"))) {
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
			<div class="form-group">
				<label for="txtPassword">重复密码</label>
				<input name="txtPassword2" id="txtPassword2" type="password" class="form-control" placeholder="重复密码">
			</div>
			<%
				// 注册失败提示
				if ("submit".equals(request.getParameter("action")))
					out.print("<div class='error'>" + users.getExtra() + "</div>");
			%>
			<button name="btnSubmit" id="btnSubmit" type="submit" class="btn btn-default">注册</button>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
