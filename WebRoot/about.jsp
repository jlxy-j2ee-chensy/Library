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

<title>关于图书馆-XX图书馆</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/index.css" />
<!-- js -->
<script src="/Library/js/jquery-3.4.1.min.js"></script>
<script src="/Library/js/bootstrap.min.js"></script>

</head>

<body onload="time();">
	<%@ include file="header.jsp"%>

	<!-- 主体容器 -->
	<div class="container section">
		<div class="row">
		<a herf="#">网站说明</a>
		<a herf="#">使用说明</a>
		<a herf="#">开发人员</a>
		</div>
		
	</div>
	 
		 

	<%@ include file="footer.jsp"%>
</body>
</html>

