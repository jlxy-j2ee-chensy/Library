<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script>
	function checkCIP() {
		if ($('#inputCIP').val().match(/^\d{10}$/) == null) {
			modalAlert('参数错误', '请输入10位数字，如"2009010781"');
			return false;
		}
	}
	function checkISBN() {
		if ($('#inputISBN').val().match(/^(\d\-?){13}$/) == null) {
			modalAlert('参数错误',
					'请输入13位数字，或带分隔线的编号，如"9787302193449"或"978-7-302-19344-9"');
			return false;
		}
	}
</script>
</head>
<body onload="time();">
	<%@ include file="header.jsp"%>

	<div class="container section">
		<%-- 搜索 --%>
		<div style="max-width: 720px; margin: 0 auto">
			<%
				String link = "/Library/book_list.jsp";
				String method = "post";

				String[] tab_class = { "", "active", "", "" };
				String[] panel_class = { "in active", "", "" };

				Book search = new Book();

				String text = Util.getParameter(request, "text");
				String ISBN = Util.getParameter(request, "ISBN");
				String CIP = Util.getParameter(request, "CIP");
				String title = Util.getParameter(request, "title");
				String series = Util.getParameter(request, "series");
				String author = Util.getParameter(request, "author");
				String pub_ins = Util.getParameter(request, "pub_ins");
				String language = Util.getParameter(request, "language");

				search.setSearchText(text);
				search.setISBN(ISBN);
				search.setCIP(CIP);
				search.setTitle(title);
				search.setSeries(series);
				search.setAuthor(author);
				search.setPub_ins(pub_ins);
				search.setLanguage(language);

				if (!"".equals(text)) {
					tab_class = new String[] { "", "active", "", "" };
					panel_class = new String[] { "in active", "", "" };
				}
				if (!"".equals(ISBN) || !"".equals(CIP)) {
					tab_class = new String[] { "", "", "active", "" };
					panel_class = new String[] { "", "in active", "" };
					System.out.println("tab2");
				} else if (!"".equals(title) || !"".equals(series) || !"".equals(author) || !"".equals(pub_ins)
						|| (!"全部".equals(language) && !"".equals(language))) {
					tab_class = new String[] { "", "", "", "active" };
					panel_class = new String[] { "", "", "in active" };
					System.out.println("tab3");
				}
			%>

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="<%=tab_class[0]%>"><a href="<%=link%>">全部图书</a></li>
				<li role="presentation" class="<%=tab_class[1]%>"><a href="#search_text" aria-controls="search_text" role="tab" data-toggle="tab">图书检索</a></li>
				<li role="presentation" class="<%=tab_class[2]%>"><a href="#search_number" aria-controls="search_number" role="tab" data-toggle="tab">精确查找</a></li>
				<li role="presentation" class="<%=tab_class[3]%>"><a href="#search_full" aria-controls="search_full" role="tab" data-toggle="tab">详细查找</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane fade <%=panel_class[0]%>" id="search_text">
					<form action="<%=link%>" method="<%=method%>">
						<div class="input-group">
							<input class="form-control" type="text" placeholder="请输入关键字" value='<%=text%>' name="text" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div><%-- div.tab-pane --%>
				<div role="tabpanel" class="tab-pane fade <%=panel_class[1]%>" id="search_number">
					<form action="<%=link%>" method="<%=method%>" style="margin-top: 12px;" onsubmit="return checkCIP(this)">
						<div class="input-group">
							<span class="input-group-addon" style="width: 120px;">通过CIP查找</span>
							<input class="form-control" type="text" id="inputCIP" placeholder="图书在版编目编号（10位数字）" value='<%=CIP%>' name="CIP" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">搜索</button>
							</span>
						</div>
					</form>
					<form action="<%=link%>" method="<%=method%>" onsubmit="return checkISBN(this)">
						<div class="input-group">
							<span class="input-group-addon" style="width: 120px;">通过ISBN查找</span>
							<input class="form-control" type="text" id="inputISBN" placeholder="国际标准书号（13位数字或带分隔线的编号）" value='<%=ISBN%>' name="ISBN" />
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div><%-- div.tab-pane --%>
				<div role="tabpanel" class="tab-pane fade <%=panel_class[2]%>" id="search_full">
					<form class="form-horizontal" action="<%=link%>" method="<%=method%>">
						<div class="row" style="margin-top: 12px;">
							<div class="form-group col-md-6">
								<label for="inputTitle" class="col-md-3 control-label">书名</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="inputTitle" name="title" placeholder="书名" value='<%=title%>' />
								</div>
							</div><%-- div.form-group --%>
							<div class="form-group col-md-6">
								<label for="inputSeries" class="col-md-3 control-label">丛书名</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="inputSeries" name="series" placeholder="丛书名" value='<%=series%>' />
								</div>
							</div><%-- div.form-group --%>
							<div class="form-group col-md-6">
								<label for="inputAuthor" class="col-md-3 control-label">作者</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="inputAuthor" name="author" placeholder="作者" value='<%=author%>' />
								</div>
							</div><%-- div.form-group --%>
							<div class="form-group col-md-6">
								<label for="inputPub_ins" class="col-md-3 control-label">出版单位</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="inputPub_ins" name="pub_ins" placeholder="出版单位" value='<%=pub_ins%>' />
								</div>
							</div><%-- div.form-group --%>
							<div class="form-group col-md-6">
								<label for="selectLanguage" class="col-md-3 control-label">语言</label>
								<div class="col-md-9">
									<select class="form-control" id="selectLanguage" name="language">
										<option>全部</option>
										<%
											ArrayList<String> languages = books.getLanguages();
											for (String s : languages) {
										%>
										<option <%=s.equals(language) ? "selected" : ""%>><%=s%></option>
										<%
											}
										%>
									</select>
								</div>
							</div><%-- div.form-group --%>
							<button type="submit" class="btn btn-default pull-right" style="margin-right: 75px;">搜索</button>
						</div><%-- div.row --%>
					</form>
				</div><%-- div.form-horizontal --%>
			</div><%-- div.tab-pane --%>
		</div><%-- div.tab-content --%>

		<%-- 列表 --%>
		<%
			ArrayList<Book> list = books.search(search);
		%>
		<div style="margin-top: 24px;">
			<span class="pull-left">
				共有<%=list.size()%>条结果。
			</span>
			<%
				if (session.getAttribute("CurrentUser") != null
						&& ((User) session.getAttribute("CurrentUser")).getRole() >= User.ROLE_ADMIN) {
			%>
			<div class="btn-group pull-right" role="group" aria-label="...">
				<a type="button" class="btn btn-default" href="/Library/book_info.jsp?action=new">新增图书</a>
			</div>
			<%
				}
			%>
		</div>
		<table class="table table-hover" style="font-size: small;">
			<tr>
				<th>书名</th>
				<th>作者</th>
			</tr>
			<%
				for (Book book : list) {
			%>
			<tr>
				<td>
					<a href="/Library/book_info.jsp?bookid=<%=book.getId()%>">
						<%=book.showFullTitle()%>
					</a>
				</td>
				<td><%=book.showLinkedAuthor()%></td>
			</tr>
			<%
				}
			%>
		</table>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>