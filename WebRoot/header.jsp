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
			<%-- 未登录时 --%>
			<a type="button" class="btn-link" onclick="login()">登录</a> <a
				type="button" class="btn-link" onclick="register()">注册</a>
			<%
				} else {
			%>
			<%-- 已登录时 --%>
			<span><%="欢迎，" + user.getUsername() + "！"%></span>
			<div class="dropdown">
				<a id="btnUser" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="true"> 用户中心 <span
					class="caret"></span>
				</a>
				<ul id="menuUser" class="dropdown-menu" aria-labelledby="btnUser">
					<li><a href="#">查看借阅</a></li>
					<li><a href="#">修改密码</a></li>
					<li role="separator" class="divider"></li>
					<%
						if (user.getRole() >= User.ROLE_ADMIN) {
					%>
					<li><a href="/Library/user_list.jsp">管理用户</a></li>

					<li role="separator" class="divider"></li>
					<%
						}
					%>
					<li><a onclick="logout()">退出登录</a></li>
				</ul>
			</div>
			<%-- div.dropdown --%>
			<%
				}
			%>
		</div>
		<%-- div.pull-right --%>
	</div>
	<%-- div.container --%>
</div>
<%-- #top-row --%>

<%-- 标题图片 --%>
<div id="title-row">
	<div id="title-container" class="container"></div>
</div>

<%-- 导航条 --%>
<div id="nav-row">
	<div class="container">
		<ul class="nav nav-pills nav-justified hidden-xs">
			<li role="presentation"><a href="/Library/index.jsp">图书馆首页</a></li>
			<li role="presentation"><a href="/Library/book_list.jsp">图书资源</a></li>
			<li role="presentation"><a href="/Library/news.jsp">新闻公告</a></li>
			<li role="presentation"><a href="/Library/about.jsp">关于图书馆</a></li>
		</ul>
		<!-- 窄屏幕 -->
		<ul class="nav nav-pills visible-xs">
			<li role="presentation"><a href="/Library/index.jsp">图书馆首页</a></li>
			<li role="presentation"><a href="/Library/book_list.jsp">图书资源</a></li>
			<li role="presentation"><a href="/Library/news.jsp">新闻公告</a></li>
			<li role="presentation"><a href="/Library/about.jsp">关于图书馆</a></li>
		</ul>
	</div>
</div>


<%
	if (user == null) {
%>
<script>
	function login() {
		modalHide();
		$('#modalRegister').modal('hide');
		$('#modalLogin').modal('show');
		$('#modalLoginUsername').focus();
	}
	function register() {
		modalHide();
		$('#modalLogin').modal('hide');
		$('#modalRegister').modal('show');
		$('#modalRegisterUsername').focus();
	}
	$(document).ready(function() {
		$('#modalLogin').on('show.bs.modal', function(event) {
			$('#modalLoginUsername').val('');
			$('#modalLoginPassword').val('');
			$('#modalLoginError').text('');
		})
		$('#modalRegister').on('show.bs.modal', function(event) {
			$('#modalRegisterUsername').val('');
			$('#modalRegisterPassword').val('');
			$('#modalRegisterError').text('');
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
		$('#modalLoginError').load("/Library/login-check.jsp",
				$('#modalLoginForm').serialize(), function(data) {
					if (data == '') {
						$('#modalLogin').modal('hide');
						modal("登录成功", "<p>登录成功，点击“确定”刷新页面。</p>", "refresh");
					}
				});
	}
	function registerCheck() {
		if ($('#modalRegisterUsername').val() == '') {
			$('#modalRegisterError').text('用户名不能为空！');
			$('#modalRegisterUsername').focus();
			return;
		}
		if ($('#modalRegisterPassword').val() == '') {
			$('#modalRegisterError').text('密码不能为空！');
			$('#modalRegisterPassword').focus();
			return;
		}
		if ($('#modalRegisterPassword').val() != $('#modalRegisterPassword2')
				.val()) {
			$('#modalRegisterError').text('两次密码输入不一致！');
			$('#modalRegisterPassword').focus();
			$('#modalRegisterPassword').val('');
			;
			$('#modalRegisterPassword2').val('');
			return;
		}

		$('#modalRegisterError').load(
				"/Library/register-check.jsp",
				$('#modalRegisterForm').serialize(),
				function(data) {
					if (data == '') {
						$('#modalRegister').modal('hide');
						modal("注册成功", "<p>注册成功，用户已登录。点击“确定”刷新页面。</p>",
								"refresh");
					}
				});
	}
</script>
<%-- 登录框 --%>
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
	aria-labelledby="">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="modalLoginForm" id="modalLoginForm" method="post"
				onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">用户登录</h4>
				</div>
				<%-- div.modal-header --%>
				<div class="modal-body">
					<div class="form-group">
						<label for="modalLoginUsername">用户名</label> <input name="username"
							id="modalLoginUsername" type="text" class="form-control"
							placeholder="用户名">
					</div>
					<div class="form-group">
						<label for="modalLoginPassword">密码</label> <input name="password"
							id="modalLoginPassword" type="password" class="form-control"
							placeholder="密码">
					</div>
					<div class="error" id="modalLoginError"></div>
				</div>
				<%-- div.modal-body --%>
				<div class="modal-footer">
					<span class="pull-left small"> 没有账户？ <a class="btn-link"
						onclick="register()">去注册</a>
					</span>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary"
						onclick="loginCheck()">登录</button>
				</div>
				<%-- div.modal-footer --%>
			</form>
		</div>
		<%-- div.modal-content --%>
	</div>
	<%-- div.dialog --%>
</div>
<%-- div.modal --%>
<%-- 注册框 --%>
<div class="modal fade" id="modalRegister" tabindex="-1" role="dialog"
	aria-labelledby="">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="modalRegisterForm" id="modalRegisterForm" method="post"
				onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">用户注册</h4>
				</div>
				<%-- div.modal-header --%>
				<div class="modal-body">
					<div class="form-group">
						<label for="modalRegisterUsername">用户名</label> <input
							name="username" id="modalRegisterUsername" type="text"
							class="form-control" placeholder="用户名">
					</div>
					<div class="form-group">
						<label for="modalRegisterPassword">密码</label> <input
							name="password" id="modalRegisterPassword" type="password"
							class="form-control" placeholder="密码">
					</div>
					<div class="form-group">
						<label for="modalRegisterPassword2">重复密码</label> <input
							name="password2" id="modalRegisterPassword2" type="password"
							class="form-control" placeholder="重复密码">
					</div>
					<div class="error" id="modalRegisterError"></div>
				</div>
				<%-- div.modal-body --%>
				<div class="modal-footer">
					<span class="pull-left small"> 已有账户？ <a class="btn-link"
						onclick="login()">去登录</a>
					</span>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary"
						onclick="registerCheck()">注册</button>
				</div>
				<%-- div.modal-footer --%>
			</form>
		</div>
		<%-- div.modal-content --%>
	</div>
	<%-- div.modal-dialog --%>
</div>
<%-- div.modal --%>
<%
	} else {
%>
<script>
	function logout() {
		modal("确认登出", "<p>您确定要退出登录吗？</p>", function() {
			console.log("退出登录");
			$.get("/Library/user/logout.jsp", function(data) {
				if (data == "登出成功") {
					modal("登出成功", "<p>您的用户已经退出。点击“确定”刷新页面。</p>", "refresh");
				} else {
					modal("登出失败", "<p>" + data + "</p>", null, "close");
				}
			});
		}, "close");
	}
</script>
<%
	}
%>