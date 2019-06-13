<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jlxy.chensy.common.Util" %>
<jsp:useBean id="users" class="jlxy.chensy.db.Users" scope="page" />
<%
	out.clear();
	String username = Util.getParameter(request, "username");
	users.delete(username);
	out.print("删除成功");
%>