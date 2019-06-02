<%@ page language="java" import="java.util.*,java.sql.*,jlxy.chensy.db.*" pageEncoding="UTF-8"%>
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>图书检索－XX图书馆</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
<!-- js -->
<script src="/Library/js/jquery-3.4.1.min.js"></script>
<script src="/Library/js/bootstrap.min.js"></script>

</head>
<body onload="time();">
	<%@ include file="header.jsp"%>

	<div class="container section">

		<%@ include file="book_search.jsp"%>

		<%
			ArrayList<Book> list = books.search(search);
		%>
		共用<%=list.size()%>条结果。
		<table class="table table-hover table-striped" style="font-size: small;">
			<tr>
				<th>书名</th>
				<th>作者</th>
			</tr>
			<%
				for (Book book : list) {
			%>
			<tr>
				<td>
					<a href='<%=request.getContextPath() + "/book_info.jsp?bookid=" + book.getId()%>'>
						<%=book.getDisplayFullTitle()%>
					</a>
				</td>
				<td><%=book.getDisplayAuthor()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>