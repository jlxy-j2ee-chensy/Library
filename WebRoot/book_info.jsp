<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />

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
			String action = request.getParameter("action");
			if (action == null)
				action = "view";
			int id;
			try {
				id = Integer.parseInt(request.getParameter("bookid"));
			} catch (NumberFormatException e) {
				id = 0;
			}
			if ("delete".equals(action)) {
				books.delete(id);
				response.sendRedirect(request.getContextPath() + "/book_list.jsp");
			}
			if ("submit".equals(action)) {
				Book book = new Book();
				book.setId(id);
				book.setTitle(Util.getParameter(request, "title"));
				book.setSubtitle(Util.getParameter(request, "subtitle"));
				book.setSeries(Util.getParameter(request, "series"));
				book.setAuthor(Util.getParameter(request, "author"));
				book.setCIP(Util.getParameter(request, "CIP"));
				book.setISBN(Util.getParameter(request, "ISBN"));
				book.setPub_ins(Util.getParameter(request, "pub_ins"));
				book.setPub_loc(Util.getParameter(request, "pub_loc"));
				book.setPub_time(Util.getParameter(request, "pub_time"));
				book.setNum_edit(Util.getParameter(request, "num_edit"));
				book.setNum_print(Util.getParameter(request, "num_print"));
				book.setPrice(Util.getParameter(request, "price"));
				book.setLanguage(Util.getParameter(request, "language"));
				book.setSize(Util.getParameter(request, "size"));
				book.setBinding(Util.getParameter(request, "binding"));
				book.setCategory(Util.getParameter(request, "category"));
				book.setKeywords(Util.getParameter(request, "keywords"));
				book.setDescription(Util.getParameter(request, "description"));
				id = books.update(book).getId();
			}

			Book book = books.getBook(id);
			if ("new".equals(action))
				book = new Book();
			String error = null;
			if (("new".equals(action) || "edit".equals(action)) && (user == null || user.getRole() < User.ROLE_ADMIN))
				error = "权限不足！";
			if (book == null)
				error = "图书不存在" + id;

			if (error != null) {
		%>
		<p class="error"><%=error%></p>
		<%
			} else if ("view".equals(action) || "submit".equals(action)) {
		%>
		<%-- 查看 --%>
		<div class="row">
			<%-- 图片 --%>
			<div class="col-md-3">
				<img alt="<%=book.showTitle()%>" src="<%=request.getContextPath() + book.getPicturePath()%>" style="max-width: 100%; float: right;">
			</div>
			<%-- 信息 --%>
			<div class="col-md-7">
				<h2><%=book.showTitle()%><small style="margin-left: 8px"><%=book.showSubtitle()%></small>
				</h2>
				<div><%=book.showSeries()%></div>
				<div><%=book.showLinkedAuthor()%></div>
				<table class="table table-condensed" style="margin-top: 8px; font-size: small;">
					<tr>
						<td style="width: 20%">
							<abbr title="图书在版编目（Cataloguing in Publication）">CIP</abbr>
						</td>
						<td style="width: 30%"><%=book.showCIP()%></td>
						<td style="width: 20%">
							<abbr title="国际标准书号（International Standard Book Number）">ISBN</abbr>
						</td>
						<td style="width: 30%"><%=book.showISBN()%></td>
					</tr>
					<tr>
						<td>出版单位</td>
						<td colspan="3"><%=book.showLinkedPub_ins()%></td>
					</tr>
					<tr>
						<td>出版地</td>
						<td><%=book.showPub_loc()%></td>
						<td>出版时间</td>
						<td><%=book.showPub_time()%></td>
					</tr>
					<tr>
						<td>版次</td>
						<td><%=book.showNum_edit()%></td>
						<td>印次</td>
						<td><%=book.showNum_print()%></td>
					</tr>
					<tr>
						<td>定价（元）</td>
						<td><%=book.showPrice()%></td>
						<td>正文语种</td>
						<td><%=book.getLinkedLanguage()%></td>
					</tr>
					<tr>
						<td>开本或尺寸</td>
						<td><%=book.showSize()%></td>
						<td>装帧方式</td>
						<td><%=book.showBinding()%></td>
					</tr>
					<tr>
						<td>中图法分类</td>
						<td colspan="3"><%=book.showCategory()%></td>
					</tr>
					<tr>
						<td>主题词</td>
						<td colspan="3"><%=book.showKeywords()%></td>
					</tr>
					<tr>
						<td>内容提要</td>
						<td colspan="3"><%=book.showDescription()%></td>
					</tr>
				</table>
			</div>
			<%-- 操作 --%>
			<div class="col-md-2">
				<%-- 管理员操作 --%>
				<%
					if (user != null && user.getRole() >= User.ROLE_ADMIN) {
				%>
				<div class="btn-group-vertical" role="group" aria-label="..." style="margin-top: 72px;">
					<a type="button" class="btn btn-default" href='<%=request.getContextPath() + "/book_info.jsp?bookid=" + id + "&action=edit"%>'>编辑本书信息</a>
					<a type="button" class="btn btn-default" href="#">查看本书借阅记录</a>
					<a type="button" class="btn btn-danger" href='<%=request.getContextPath() + "/book_info.jsp?bookid=" + id + "&action=delete"%>'>从数据库删除本书</a>
				</div>
				<%
					}
				%>

				<%-- 用户操作 --%>
				<%
					if (user != null && user.getRole() >= User.ROLE_MEMBER) {
				%>
				<div class="btn-group-vertical" role="group" aria-label="..." style="margin-top: 72px;">
					<button type="button" class="btn btn-default">预约借阅本书</button>
					<button type="button" class="btn btn-default">查看账号借阅情况</button>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<%
			} else if ("edit".equals(action) || ("new".equals(action))) {
		%>
		<%-- 编辑 --%>
		<form action='<%=request.getContextPath() + "/book_info.jsp?bookid=" + id + "&action=submit"%>' method="post" class="form-horizontal">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-7">
					<div class="row">
						<div class="col-md-6">
							<div class="input-group">
								<span class="input-group-addon">标题</span>
								<input type="text" class="form-control" id="inputTitle" name="title" placeholder="标题" value='<%=book.showTitle()%>' />
							</div>
						</div>
						<div class="col-md-6">
							<div class="input-group input-group-small">
								<span class="input-group-addon">副标题</span>
								<input type="text" class="form-control" id="inputSubtitle" name="subtitle" placeholder="副标题" value='<%=book.showSubtitle()%>' />
							</div>
						</div>
					</div>
					<div class="input-group input-group-small">
						<span class="input-group-addon">丛书名</span>
						<input type="text" class="form-control" id="inputSeries" name="series" placeholder="丛书名" value='<%=book.showSeries()%>' />
					</div>
					<div class="input-group input-group-small">
						<span class="input-group-addon">作者</span>
						<input type="text" class="form-control" id="inputAuthor" name="author" placeholder="作者" value='<%=book.showAuthor()%>' />
					</div>
					<table class="table table-condensed" id="book-info-edit">
						<tr>
							<td style="width: 20%">
								<abbr title="图书在版编目（Cataloguing in Publication）">CIP</abbr>
							</td>
							<td style="width: 30%">
								<input type="text" class="form-control" id="inputCIP" name="CIP" value='<%=book.showCIP()%>' />
							</td>
							<td style="width: 20%">
								<abbr title="国际标准书号（International Standard Book Number）">ISBN</abbr>
							</td>
							<td style="width: 30%">
								<input type="text" class="form-control" id="inputISBN" name="ISBN" value='<%=book.showISBN()%>' />
							</td>
						</tr>
						<tr>
							<td>出版单位</td>
							<td colspan="3">
								<input type="text" class="form-control" id="inputPub_ins" name="pub_ins" value='<%=book.showPub_ins()%>' />
							</td>
						</tr>
						<tr>
							<td>出版地</td>
							<td>
								<input type="text" class="form-control" id="inputPub_loc" name="pub_loc" value='<%=book.showPub_loc()%>' />
							</td>
							<td>出版时间</td>
							<td>
								<input type="text" class="form-control" id="inputPub_time" name="pub_time" value='<%=book.showPub_time()%>' />
							</td>
						</tr>
						<tr>
							<td>版次</td>
							<td>
								<input type="text" class="form-control" id="inputNum_edit" name="num_edit" value='<%=book.showNum_edit()%>' />
							</td>
							<td>印次</td>
							<td>
								<input type="text" class="form-control" id="inputNum_print" name="num_print" value='<%=book.showNum_print()%>' />
							</td>
						</tr>
						<tr>
							<td>定价（元）</td>
							<td>
								<input type="text" class="form-control" id="inputPrice" name="price" value='<%=book.showPrice()%>' />
							</td>
							<td>正文语种</td>
							<td>
								<input type="text" class="form-control" id="inputLanguage" name="language" placeholder="中文" value='<%=book.showLanguage()%>' />
							</td>
						</tr>
						<tr>
							<td>开本或尺寸</td>
							<td>
								<input type="text" class="form-control" id="inputSize" name="size" value='<%=book.showSize()%>' />
							</td>
							<td>装帧方式</td>
							<td>
								<input type="text" class="form-control" id="inputBinding" name="num_binding" value='<%=book.showBinding()%>' />
							</td>
						</tr>
						<tr>
							<td>中图法分类</td>
							<td colspan="3">
								<input type="text" class="form-control" id="inputCategory" name="category" value='<%=book.showCategory()%>' />
							</td>
						</tr>
						<tr>
							<td>主题词</td>
							<td colspan="3">
								<input type="text" class="form-control" id="inputKeywords" name=keywords value='<%=book.showKeywords()%>' />
							</td>
						</tr>
						<tr>
							<td>内容提要</td>
							<td colspan="3">
								<textarea class="form-control" rows="5" id="inputDescription" name="description"><%=book.showDescription()%></textarea>
							</td>
						</tr>
					</table>


				</div>
				<div class="col-md-2">
					<div class="btn-group-vertical" role="group" aria-label="..." style="margin-top: 72px;">
						<button type="submit" class="btn btn-info">提交</button>
						<button type="button" class="btn btn-default">取消</button>
					</div>
				</div>
			</div>
		</form>
		<%
			}
		%>

	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>