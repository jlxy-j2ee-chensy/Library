function book(id) {
	$.post(
		'/Library/borrow/borrow-check.jsp',
		{
			bookid : id
		},
		function(data) {
			if (data.match("预约成功")) {
				modal("预约成功", "您已成功预约此书。", "refresh");
			} else if (data == "超出数量") {
				modal(
					"预约失败",
					'<p>每个用户最多同时预约或借阅3本图书！</p><p><a href="/Library/borrow_list.jsp">点击此处</a>查看账户当前借阅情况。</p>',
					"refresh"
				);
			} else {
				modal("预约失败", data, "refresh");
			}
		}
	);
}
function unbook(id) {
	$.post(
		'/Library/borrow/unborrow-check.jsp', 
		{
			bookid : id
		},
		function(data) {
			if (data == "取消成功") {
				modal("取消预约成功", "<p>预约已成功取消。</p>", "refresh");
			} else {
				modal("取消预约失败", data, "refresh");
			}
		}
	);
}