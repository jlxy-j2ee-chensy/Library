<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jlxy.chensy.common.Borrow"%>
<%@ page import="jlxy.chensy.common.User"%>
<%@ page import="jlxy.chensy.common.Book"%>
<jsp:useBean id="borrows" class="jlxy.chensy.db.Borrows" scope="page" />
<jsp:useBean id="books" class="jlxy.chensy.db.Books" scope="page" />
<%
	int userid = ((User) session.getAttribute("CurrentUser")).getId();
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	out.clear();
	if (borrows.get(userid, bookid) == null) {
		out.print("您未预约此书！");
	} else if (borrows.get(userid, bookid).getStatus() == Borrow.STATUS_BORROWED) {
		out.print("请携带图书至图书馆还书！");
	} else {
		Borrow borrow = new Borrow(userid, bookid);
		borrow.setStatus(Borrow.STATUS_RETURNED);
		borrows.set(borrow);
	}
%>
