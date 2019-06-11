<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	out.clear();
	if (session.getAttribute("CurrentUser") == null) {
		out.print("未登录");
	} else {
		session.setAttribute("CurrentUser", null);
		out.print("登出成功");
	}
%>