<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	if ("login".equals(request.getParameter("action"))) {
		String txtUsername = request.getParameter("txtUsername");
		String txtPassword = request.getParameter("txtPassword");
		String remember = request.getParameter("remember");
//		out.print("<script>alert('" + txtUsername + " " + txtPassword + " " + remember + "')</script>");
		if (true) {
			session.setAttribute("CurrentUser", txtUsername);
			session.setAttribute("RememberState", "on".equals(remember));
		}
// 		System.out.println("用户名：" + txtUsername);
// 		System.out.println("密码：" + txtPassword);
// 		System.out.println("记住：" + remember);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

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
	<%@ include file="header.jsp"%>

	<div class="container section">
		<form name="form1" id="form1" method="post" action="login.jsp?action=login">
			<div class="form-group">
				<label for="txtUsername">用户名</label>
				<input name="txtUsername" id="txtUsername" type="text" class="form-control" placeholder="用户名">
			</div>
			<div class="form-group">
				<label for="txtPassword">密码</label>
				<input name="txtPassword" id="txtPassword" type="password" class="form-control" placeholder="密码">
			</div>
			<div class="checkbox">
				<label><input name="remember" id="remember" type="checkbox">记住登录状态</label>
			</div>
			<button name="btnSubmit" id="btnSubmit" type="submit" class="btn btn-default">登录</button>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
