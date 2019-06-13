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
	if (borrows.get(userid, bookid) != null) {
		out.print("您已预约或借阅此书，不能重复预约！");
	} else if (borrows.getByUser(userid).size() >= 3) {
		out.print("超出数量");
	} else if (borrows.getByBook(bookid).size() >= books.getBook(bookid).getCount()) {
		out.print("馆藏数量不足！");
	} else {
		Borrow borrow = new Borrow(userid, bookid);
		borrow.setStatus(Borrow.STATUS_BOOKED);
		borrows.set(borrow);
		out.print("预约成功");
	}
	// 结尾不能加空行/空格！！
%>