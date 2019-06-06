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

<div class="modal fade" id="modalRefresh" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<p>是否刷新页面？</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="location.reload()">刷新</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalAlert" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<p>是否刷新页面？</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>
