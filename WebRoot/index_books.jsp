<%@ page language="java" import="java.util.*,java.sql.*,jlxy.chensy.db.*" pageEncoding="UTF-8"%>
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />

<h3>热门图书</h3>
<div id="index_books" class="list-group">
	<%
		// 生成3个随机不同的数
		int count = books.count();
		HashSet<Integer> hashSet = new HashSet<Integer>();
		Random random = new Random();
		while (hashSet.size() < 3)
			hashSet.add(random.nextInt(count) + 1);

		// 显示3本书的信息
		Book book = null;
		for (int i : hashSet) {
			book = books.getBookById(i);
	%>
	<a class="list-group-item" href='<%=request.getContextPath() + "/book_info.jsp?bookid=" + i%>'>
		<div class="media">
			<div class="media-left">
				<img class="media-object" src='<%=request.getContextPath() + book.getDisplayPicture()%>' alt="<%=book.getDisplayFullTitle()%>" />
			</div>
			<div class="media-body">
				<h4 class="media-heading"><%=book.getDisplayFullTitle()%></small>
				</h4>
				<small><%=book.getDisplayDescription()%></small>
			</div>
		</div>
	</a>
	<%
		}
	%>
</div>