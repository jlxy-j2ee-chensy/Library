<%@ page language="java" import="java.util.*,java.sql.*,jlxy.chensy.db.*" pageEncoding="UTF-8"%>
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />
<%
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("bookid"));
	} catch (NumberFormatException e) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	Book book = books.getBookById(id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>图书信息－XX图书馆</title>

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
		<%
			if (book == null) {
		%>
		<p class="error">无此图书</p>
		<%
			} else {
		%>
		<div class="row">
			<div class="col-md-3">
				<img alt="<%=book.getDisplayTitle()%>" src="<%=request.getContextPath() + book.getDisplayPicture()%>" style="max-width: 100%; float: right;">
			</div>
			<div class="col-md-7">
				<h2><%=book.getDisplayTitle()%><small style="margin-left: 8px"><%=book.getDisplaySubtitle()%></small>
				</h2>
				<div><%=book.getDisplaySeries()%></div>
				<div><%=book.getDisplayAuthor()%></div>
				<table class="table table-condensed" style="margin-top: 8px; font-size: small;">
					<tr>
						<td style="width: 20%">
							<abbr title="图书在版编目（Cataloguing in Publication）">CIP</abbr>
						</td>
						<td style="width: 30%"><%=book.getDisplayCIP()%></td>
						<td style="width: 20%">
							<abbr title="国际标准书号（International Standard Book Number）">ISBN</abbr>
						</td>
						<td style="width: 30%"><%=book.getDisplayISBN()%></td>
					</tr>
					<tr>
						<td>出版单位</td>
						<td colspan="3"><%=book.getDisplayPub_ins()%></td>
					</tr>
					<tr>
						<td>出版地</td>
						<td><%=book.getDisplayPub_loc()%></td>
						<td>出版时间</td>
						<td><%=book.getDisplayPub_time()%></td>
					</tr>
					<tr>
						<td>版次</td>
						<td><%=book.getDisplayNum_edit()%></td>
						<td>印次</td>
						<td><%=book.getDisplayNum_print()%></td>
					</tr>
					<tr>
						<td>定价（元）</td>
						<td><%=book.getDisplayPrice()%></td>
						<td>正文语种</td>
						<td><%=book.getDisplayLanguage()%></td>
					</tr>
					<tr>
						<td>开本或尺寸</td>
						<td><%=book.getDisplaySize()%></td>
						<td>装帧方式</td>
						<td><%=book.getDisplayBinding()%></td>
					</tr>
					<tr>
						<td>中图法分类</td>
						<td colspan="3"><%=book.getDisplayCategory()%></td>
					</tr>
					<tr>
						<td>主题词</td>
						<td colspan="3"><%=book.getDisplayKeywords()%></td>
					</tr>
					<tr>
						<td>内容提要</td>
						<td colspan="3"><%=book.getDisplayDescription()%></td>
					</tr>
				</table>
			</div>
		</div>
		<%
			}
		%>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>