<%@ page language="java" import="java.util.*,java.sql.*,jlxy.chensy.db.*" pageEncoding="UTF-8"%>

<jsp:useBean id="util" scope="page" class="jlxy.chensy.util.Util" />

<%
	String link = request.getContextPath() + "/book_list.jsp";
	String method = "get";

	String[] tab_class = { "active", "", "", "" };
	String[] panel_class = { "", "", "" };

	Book search = new Book();

	String text = util.getParameter(request, "text");
	String ISBN = util.getParameter(request, "ISBN");
	String CIP = util.getParameter(request, "CIP");
	String title = util.getParameter(request, "title");
	String series = util.getParameter(request, "series");
	String author = util.getParameter(request, "author");
	String pub_ins = util.getParameter(request, "pub_ins");
	String language = util.getParameter(request, "language");

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

<div style="max-width: 720px; margin: 0 auto">
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
				<div class="input-group" id="search-group">
					<input class="form-control" type="text" placeholder="请输入关键字" value='<%=text%>' name="text" />
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">搜索</button>
					</span>
				</div>
			</form>
		</div>
		<div role="tabpanel" class="tab-pane fade <%=panel_class[1]%>" id="search_number">
			<form action="<%=link%>" method="<%=method%>" style="margin-top: 12px;">
				<div class="input-group" id="search-group">
					<span class="input-group-addon" style="width: 120px;">通过CIP查找</span>
					<input class="form-control" type="text" placeholder="图书在版编目编号（10位数字）" value='<%=CIP%>' name="CIP" />
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">搜索</button>
					</span>
				</div>
			</form>
			<form action="<%=link%>" method="<%=method%>">
				<div class="input-group" id="search-group">
					<span class="input-group-addon" style="width: 120px;">通过ISBN查找</span>
					<input class="form-control" type="text" placeholder="国际标准书号（13位数字，或XXX-X-XX-XXXXXX-X）" value='<%=ISBN%>' name="ISBN" />
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit">搜索</button>
					</span>
				</div>
			</form>
		</div>
		<div role="tabpanel" class="tab-pane fade <%=panel_class[2]%>" id="search_full">
			<form class="form-horizontal" action="<%=link%>" method="<%=method%>">
				<div class="row" style="margin-top: 12px;">
					<div class="form-group col-md-6">
						<label for="inputTitle" class="col-md-3 control-label">书名</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="inputTitle" name="title" placeholder="书名" value='<%=title%>' />
						</div>
					</div>
					<div class="form-group col-md-6">
						<label for="inputSeries" class="col-md-3 control-label">丛书名</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="inputSeries" name="series" placeholder="丛书名" value='<%=series%>' />
						</div>
					</div>
					<div class="form-group col-md-6">
						<label for="inputAuthor" class="col-md-3 control-label">作者</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="inputAuthor" name="author" placeholder="作者" value='<%=author%>' />
						</div>
					</div>
					<div class="form-group col-md-6">
						<label for="inputPub_ins" class="col-md-3 control-label">出版单位</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="inputPub_ins" name="pub_ins" placeholder="出版单位" value='<%=pub_ins%>' />
						</div>
					</div>
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
					</div>
					<button type="submit" class="btn btn-default pull-right" style="margin-right: 75px;">搜索</button>
				</div>
			</form>
		</div>
	</div>
</div>


