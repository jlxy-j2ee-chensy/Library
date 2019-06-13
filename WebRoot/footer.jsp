<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<footer class="container small">
	<p>XX图书馆管理系统</p>
	<p>
		<span class="glyphicon glyphicon-book"></span>
		&nbsp;南京大学金陵学院&nbsp;2016软件工程 <br />
		<span class="glyphicon glyphicon-user"></span>
		&nbsp;020陈思源&nbsp;012陈健男&nbsp;013陈炯睿&nbsp;023陈扬&nbsp;045郭继风<br />
		<span class="glyphicon glyphicon-link"></span>
		&nbsp;GitHub：
		<a href="https://github.com/jlxy-j2ee-chensy/Library">https://github.com/jlxy-j2ee-chensy/Library</a>
		<br />
	</p>

</footer>

<script>
	$(document).ready(
			// 按下回车键时，点击显示状态的模态框的确认按钮
			function() {
				$('body').keydown(
						function(event) {
							if (event.keyCode == 13) {
								if ($('#modalRefresh').hasClass('in')) {
									$('#modalRefresh').find(
											'.modal-footer button.btn-primary')
											.click()
								}
								if ($('#modalAlert').hasClass('in')) {
									$('#modalAlert').find(
											'.modal-footer button.btn-primary')
											.click()
								}
							}
						})
			})
</script>

<div class="modal fade" id="modal" tabindex="-1" rold="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modal-title"></h4>
			</div>
			<div class="modal-body" id="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="modal-button1">确定</button>
				<button type="button" class="btn btn-default" id="modal-button2">取消</button>
			</div>
		</div>
	</div>
</div>