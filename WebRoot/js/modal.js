
function modalHide() {
	$('#modalAlert').modal('hide');
	$('#modalRefresh').modal('hide');
}

function modalRefresh(title) {
	modalHide();
	var modal = $('#modalRefresh');
	modal.find('.modal-title').text(title);
	modal.modal('show');
}

function modalAlert(title, text) {
	modalHide();
	var modal = $('#modalAlert');
	modal.find('.modal-title').text(title);
	modal.find('.modal-body p').text(text);
	modal.modal('show');
}

