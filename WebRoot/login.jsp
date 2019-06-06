<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="users" scope="page" class="jlxy.chensy.db.Users" />
<%
	// 若已处于登录状态，则跳转至首页
	if (session.getAttribute("CurrentUser") != null) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

	// 提交登录表单时的操作
	if ("submit".equals(request.getParameter("action"))) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = users.login(username, password);
		if (user != null) {
			// 登录成功
			session.setAttribute("CurrentUser", user);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>用户登录－XX图书馆</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- css -->
<link rel="stylesheet" type="text/css" href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
<!-- js -->
<script src="/Library/js/jquery-3.4.1.min.js"></script>
<script src="/Library/js/bootstrap.min.js"></script>
<script>
	function check() {
		if ($("#txtUsername").val() == "") {
			$("#error").text("请输入用户名");
			$("#txtUsername").focus();
			return false;
		}
		if ($("txtPassword").val() == "") {
			$("#error").text("请输入密码");
			$("#txtPassword").focus();
			return false
		}
	}
</script>
</head>

<body onload="time();">
	<%@ include file="header.jsp"%>
	<div class="container section">
		<form name="form1" id="form1" method="post" action='<%=request.getContextPath() + "/login.jsp?action=submit"%>' onsubmit="return check(this)">
			<div class="form-group">
				<%
					// 填入上次提交的用户名
					String username = "";
					if ("submit".equals(request.getParameter("action"))) {
						username = request.getParameter("username");
					}
				%>
				<label for="txtUsername">用户名</label>
				<input name="username" id="txtUsername" type="text" class="form-control" placeholder="用户名" value='<%=username%>'>
			</div>
			<div class="form-group">
				<label for="txtPassword">密码</label>
				<input name="password" id="txtPassword" type="password" class="form-control" placeholder="密码">
			</div>
			<div class="error" id="error">
				<%
					if ("submit".equals(request.getParameter("action")) && user == null) {
				%><%=users.getExtra()%>
				<%
					}
				%>
			</div>
			<button name="btnSubmit" id="btnSubmit" type="submit" class="btn btn-default">登录</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
