/**
 * 隐藏所有模态框
 * @returns
 */
function modalHide() {
	$('#modalAlert').modal('hide');
	$('#modalRefresh').modal('hide');
}

/**
 * 显示刷新模态框
 * @param title 标题
 * @returns
 */
function modalRefresh(title) {
	modalHide();
	var modal = $('#modalRefresh');
	modal.find('.modal-title').text(title);
	modal.modal('show');
}

/**
 * 显示警告/提示模态框
 * @param title 标题
 * @param text 提示文字
 * @returns
 */
function modalAlert(title, text) {
	modalHide();
	var modal = $('#modalAlert');
	modal.find('.modal-title').text(title);
	modal.find('.modal-body p').text(text);
	modal.modal('show');
}

