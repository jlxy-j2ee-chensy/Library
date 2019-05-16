<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- 顶部横条 -->
<div id="top-row">
	<div class="container">
		<script src="/Library/js/time.js"></script>
		<div id="time" class="pull-left"></div>
		<div class="pull-right">
			<%
				if (session.getAttribute("CurrentUser") == null) {
			%>
			<!-- 未登录时 -->
			<a type="button" class="btn-link" href='<%=request.getContextPath() + "/login.jsp"%>'>登录</a>
			<a type="button" class="btn-link" href='<%=request.getContextPath() + "/register.jsp"%>'>注册</a>
			<%
				} else {
			%>
			<!-- 已登录时 -->
			<span><%="欢迎，" + session.getAttribute("CurrentUser") + "！"%></span>
			<a type="button" class="btn-link" href="#">用户中心</a>
			<a type="button" class="btn-link" href='<%=request.getContextPath() + "/index.jsp" + "?action=logout"%>'>退出登录</a>
			<%
				}
			%>
		</div>
	</div>
</div>
<!-- 标题图片 -->
<div id="title-row">
	<div id="title-container" class="container"></div>
</div>
<!-- 导航条 -->
<div id="nav-row">
	<div class="container">
		<ul class="nav nav-pills nav-justified hidden-xs">
			<li role="presentation"><a href='<%=request.getContextPath() + "/index.jsp"%>'>图书馆首页</a></li>
			<li role="presentation"><a href="#">图书资源</a></li>
			<li role="presentation"><a href="#">新闻公告</a></li>
			<li role="presentation"><a href="#">关于图书馆</a></li>
		</ul>
		<ul class="nav nav-pills visible-xs">
			<li role="presentation"><a href='<%=request.getContextPath() + "/index.jsp"%>'>图书馆首页</a></li>
			<li role="presentation"><a href="#">图书资源</a></li>
			<li role="presentation"><a href="#">新闻公告</a></li>
			<li role="presentation"><a href="#">关于图书馆</a></li>
		</ul>
	</div>
</div>
</div>