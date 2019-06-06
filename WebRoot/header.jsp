<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="jlxy.chensy.common.*"%>

<%
	User user = (User) session.getAttribute("CurrentUser");
%>

<script src="/Library/js/modal.js"></script>

<!-- 顶部横条 -->
<div id="top-row">
	<div class="container">
		<script src="/Library/js/time.js"></script>
		<div id="time" class="pull-left"></div>
		<div class="pull-right">
			<%
				if (user == null) {
			%>
			<!-- 未登录时 -->
			<a type="button" class="btn-link" onclick="login()">登录</a>
			<a type="button" class="btn-link" href='<%=request.getContextPath() + "/register.jsp"%>'>注册</a>
			<%
				} else {
			%>
			<!-- 已登录时 -->
			<span><%="欢迎，" + ((User) session.getAttribute("CurrentUser")).getUsername() + "！"%></span>
			<a type="button" class="btn-link" href='<%=request.getContextPath() + "/UserCenter.jsp?userid=" + user.getId()%>'>用户中心</a>
			<a type="button" class="btn-link" onclick="logout()">退出登录</a>
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
			<li role="presentation"><a href='<%=request.getContextPath() + "/book_list.jsp"%>'>图书资源</a></li>
			<li role="presentation"><a href="#">新闻公告</a></li>
			<li role="presentation"><a href="#">关于图书馆</a></li>
		</ul>
		<!-- 窄屏幕 -->
		<ul class="nav nav-pills visible-xs">
			<li role="presentation"><a href='<%=request.getContextPath() + "/index.jsp"%>'>图书馆首页</a></li>
			<li role="presentation"><a href='<%=request.getContextPath() + "/book_list.jsp"%>'>图书资源</a></li>
			<li role="presentation"><a href="#">新闻公告</a></li>
			<li role="presentation"><a href="#">关于图书馆</a></li>
		</ul>
	</div>
</div>


<%
	if (user == null) {
%>
<script>
	function login() {
		modalHide();
		$('#modalLogin').modal('show');
	}
	$(document).ready(function() {
		$('#modalLogin').on('show.bs.modal', function(event) {
			$('#modalLoginUsername').val('');
			$('#modalLoginPassword').val('');
			$('#modalLoginError').text('');
		})
	});
	function loginCheck() {
		if ($('#modalLoginUsername').val() == "") {
			$('#modalLoginError').text("请输入用户名！");
			$('#modalLoginUsername').focus();
			return;
		}
		if ($('#modalLoginPassword').val() == "") {
			$('#modalLoginError').text("请输入密码！");
			$('#modalLoginPassword').focus();
			return;
		}
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				$('#modalLoginError').html(xmlhttp.responseText);
				if ($('#modalLoginError').text().match(/\s*登录成功\s*/) != null) {
					$('#modalLogin').modal('hide');
					modalRefresh('登录成功');
				}
			}
		}
		xmlhttp.open("POST", "/Library/login-check.jsp", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("username=" + $('#modalLoginUsername').val()
				+ "&password=" + $('#modalLoginPassword').val());
	}
</script>
<%-- 登录框 --%>
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="modalLoginForm" id="modalLoginForm" method="post" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">用户登录</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="modalLoginUsername">用户名</label>
						<input name="username" id="modalLoginUsername" type="text" class="form-control" placeholder="用户名">
					</div>
					<div class="form-group">
						<label for="modalLoginPassword">密码</label>
						<input name="password" id="modalLoginPassword" type="password" class="form-control" placeholder="密码">
					</div>
					<div class="error" id="modalLoginError"></div>
				</div>
				<div class="modal-footer">
					<span class="pull-left small">
						没有账户？
						<a class="btn-link" href="/Library/register.jsp">去注册</a>
					</span>
					<button type="button" class="btn btn-default" name="modalLoginCancel" id="btnCancel" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary" name="modalLoginSubmit" id="btnSubmit" onclick="loginCheck()">登录</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%
	} else {
%>
<script>
	function logout() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "/Library/logout.jsp", true);
		xmlhttp.send();
		modalRefresh("登出成功");
	}
</script>
<%
	}
%>