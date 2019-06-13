<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />
<jsp:useBean id="borrows" scope="page" class="jlxy.chensy.db.Borrows" />

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
				response.sendRedirect("/Library/book_list.jsp");
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
				book.setCount(Util.getParameter(request, "count"));
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
				<img alt="<%=book.showTitle()%>" src="/Library<%=book.getPicturePath()%>" style="max-width: 100%; float: right;">
			</div>
			<%-- 信息 --%>
			<div class="col-md-7">
				<h2><%=book.showTitle()%><small style="margin-left: 8px"><%=book.showSubtitle()%></small>
				</h2>
				<div><%=book.showSeries()%></div>
				<div><%=book.showLinkedAuthor()%></div>
				<table class="small" style="margin-top: 4px;">
					<tr>
						<td>馆藏总数</td>
						<td style="padding-left: 24px;"><%=book.getCount()%></td>
					</tr>
					<tr>
						<td>已借出</td>
						<td style="padding-left: 24px;"><%=borrows.getByBook(id).size()%></td>
					</tr>
				</table>
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
					<a type="button" class="btn btn-default" href="/Library/book_info.jsp?bookid=<%=id%>&action=edit">编辑本书信息</a>
					<a type="button" class="btn btn-default" href="/Library/borrow_list.jsp?bookid=<%=id%>">查看本书借阅记录</a>
					<a type="button" class="btn btn-default" href="/Library/book_info.jsp?bookid=<%=id%>&action=delete">从数据库删除本书</a>
				</div>
				<%
					}
				%>

				<%-- 用户操作 --%>
				<%
					if (user != null && user.getRole() >= User.ROLE_MEMBER) {
				%>
				<script src="/Library/js/borrow.js"></script>
				<div class="btn-group-vertical" role="group" aria-label="..." style="margin-top: 72px;">
					<%
						Borrow borrow = borrows.get(user.getId(), id);
								if (borrow == null) {
					%>
					<button type="button" class="btn btn-default" onclick="book('<%=id%>')">预约借阅本书</button>
					<%
						} else {
					%>
					<button type="button" class="btn btn-default disabled">
						您已<%=borrow.showStatus()%>本书
					</button>
					<button type="button" class="btn btn-default" onclick="unbook('<%=id%>')">取消预约本书</button>
					<%
						}
					%>
					<a type="button" class="btn btn-default" href="/Library/borrow_list.jsp">查看账号借阅情况</a>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<%-- 相关图书 --%>
		<div class="page-header">
			<h4>相关图书</h4>
		</div>
		<div class="row">
			<%
				ArrayList<Book> related = new ArrayList<Book>();
					related.add(book);
					for (String word : book.getSplitedKeywords()) {
						Book s = new Book();
						s.setKeywords(word);
						for (Book b : books.search(s)) {
							if (!related.contains(b)) {
								related.add(b);
							}
						}
					}
					while (related.size() < 5) {
						Book b = books.getBook((new Random()).nextInt(books.max()) + 1);
						if (!related.contains(b)) {
							related.add(b);
						}
					}
					for (int i = 1; i <= 4; i++) {
						Book b = related.get(i);
			%>
			<div class="col-md-3">
				<a href='/Library/book_info.jsp?bookid=<%=b.getId()%>' class="thumbnail" style="">
					<img src="/Library<%=b.getPicturePath()%>" alt="...">
					<div class="caption" style="text-align: center;">
						<%=b.showFullTitle()%>
					</div>
				</a>
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
	<form action="/Library/book_info.jsp?bookid=<%=id%>&action=submit" method="post" class="form-horizontal">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-7">
				<table class="table table-condensed" id="book-info-edit">
					<tr>
						<td>标题</td>
						<td colspan="3">
							<input type="text" class="form-control" id="inputTitle" name="title" value='<%=book.showTitle()%>' />
						</td>
					</tr>
					<tr>
						<td>副标题</td>
						<td colspan="3">
							<input type="text" class="form-control" id="inputSubtitle" name="subtitle" value='<%=book.showSubtitle()%>' />
						</td>
					</tr>
					<tr>
						<td>丛书名</td>
						<td colspan="3">
							<input type="text" class="form-control" id="inputSeries" name="series" value='<%=book.showSeries()%>' />
						</td>
					</tr>
					<tr>
						<td>作者</td>
						<td colspan="3">
							<input type="text" class="form-control" id="inputAuthor" name="author" value='<%=book.showAuthor()%>' />
						</td>
					</tr>
					<tr>
						<td>馆藏数量</td>
						<td>
							<input type="text" class="form-control" id="inputCount" name="count" value='<%=book.showCount()%>' />
						</td>
					</tr>
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
			<script>
				function importHTML() {
					$('#modalImport').modal('show');
					$('#modalImportTextarea').val('');
					$('#modalImportTextarea').focus();
				}
				function getData(i) {
					var a = $('#modalImportTextarea').val().match(
							/<td class="bizformdatacell"[^<^>]*>([^<^>]*)</g)[i]
							.replace(/\s+ /, " ").match(/.*>(.*)<.*/);
					if (a != null && a.length > 1)
						return a[1]
					else
						return '';
				}
				function importSubmit() {
					$('#modalImport').modal('hide');
					var s = $('#modalImportTextarea').val().match(
							/<td class="bizformdatacell"[^<^>]*>([^<^>]*)</g);
					$('#inputCIP').val(getData(0));
					$('#inputISBN').val(getData(1));
					$('#inputTitle').val(getData(2));
					$('#inputSeries').val(getData(3));
					$('#inputPub_ins').val(getData(4));
					$('#inputPub_loc').val(getData(5));
					$('#inputPub_time').val(getData(6));
					$('#inputAuthor').val(getData(7));
					$('#inputNum_edit').val(getData(8));
					$('#inputNum_print').val(getData(9));
					$('#inputPrice').val(getData(10));
					$('#inputLanguage').val(getData(11));
					$('#inputSize').val(getData(12));
					$('#inputBinding').val(getData(13));
					$('#inputCategory').val(getData(16));
					$('#inputKeywords').val(getData(17));
					$('#inputDescription').val(getData(18));
				}
			</script>
			<div class="modal fade" id="modalImport" tabindex="-1" role="dialog" aria-labelledby="">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">导入HTML</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<textarea style="margin: 0 auto; width: 90%" name="textarea" id="modalImportTextarea" type="text" class="form-control" placeholder="&lt;table&gt;标签" rows="8"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" onclick="importSubmit()">确定</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="btn-group-vertical" role="group" aria-label="..." style="margin-top: 72px;">
					<button type="button" class="btn btn-default" onclick="importHTML()">HTML代码导入</button>
					<button type="submit" class="btn btn-default">提交</button>
					<button type="button" class="btn btn-default" onclick="window.history.back();">取消</button>
				</div>
			</div>
		</div>
	</form>
	<%
		}
	%>


	<%@ include file="footer.jsp"%>

</body>
</html>