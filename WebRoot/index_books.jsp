<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="book" scope="page" class="jlxy.chensy.db.Book" />

<h3>热门图书</h3>
<div id="index_books" class="list-group">
	<%
		String hb_title;
		String hb_picture;
		String hb_description;
		HashSet<Integer> hashSet = new HashSet<Integer>();
		int count = book.count();
		Random random = new Random();
		while (hashSet.size() < 3)
			hashSet.add(random.nextInt(count) + 1);
		for (int i : hashSet) {
			HashMap<String, String> info = book.getInfoById(i);
			hb_title = info.get("title");
			if (info.get("subtitle") != null)
				hb_title = hb_title + "：" + info.get("subtitle");
			hb_picture = info.get("ISBN") + ".jpg";
			hb_description = info.get("description");
	%>
	<a class="list-group-item" href="#">
		<div class="media">
			<div class="media-left">
				<img class="media-object" src='<%=request.getContextPath() + "/image/book/" + hb_picture%>' alt="<%=hb_title%>" />
			</div>
			<div class="media-body">
				<h4 class="media-heading"><%=hb_title%></h4>
				<small><%=hb_description%></small>
			</div>
		</div>
	</a>
	<%
		}
	%>
</div>