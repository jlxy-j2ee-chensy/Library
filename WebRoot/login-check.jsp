<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="users" class="jlxy.chensy.db.Users" scope="page" />
<%@ page import="jlxy.chensy.common.User"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User user = users.login(username, password);
	if (user == null) {
		out.println(users.getExtra());
	} else {
		out.println("登录成功");
		session.setAttribute("CurrentUser", user);
	}
%>