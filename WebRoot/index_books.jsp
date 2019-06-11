<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="jlxy.chensy.common.Book"%>
<jsp:useBean id="books" scope="page" class="jlxy.chensy.db.Books" />

<h3>馆藏图书</h3>
<div id="index-books" class="list-group">
	<%
		// 生成3个随机不同的数
		int m = books.max();
		HashSet<Book> hashSet = new HashSet<Book>();
		Random random = new Random();
		while (hashSet.size() < 3) {
			Book book = books.getBook(random.nextInt(m) + 1);
			if (book != null) {
				hashSet.add(book);
			}
		}

		// 显示3本书的信息
		for (Book book : hashSet) {
	%>
	<a class="list-group-item" href="/Library/book_info.jsp?bookid=<%=book.getId()%>">
		<div class="media">
			<div class="media-left">
				<img class="media-object" src="/Library<%=book.getPicturePath()%>" alt="<%=book.showFullTitle()%>" />
			</div>
			<div class="media-body">
				<h4 class="media-heading"><%=book.showFullTitle()%></small>
				</h4>
				<small><%=book.showDescription()%></small>
			</div>
		</div>
	</a>
	<%
		}
	%>
</div>