/**
 * 隐藏所有模态框
 * @returns
 */
function modalHide() {
	$('#modal').modal('hide');
}

/**
 * 显示模态框
 * @param title 标题
 * @param body 内容
 * @param button1 按钮1功能：function / "refresh"
 * @param button2 按钮2功能：function / "close"
 * @returns
 */
function modal(title, body, button1, button2) {
	var modal = $("#modal");
	modal.removeClass("fade");
	modal.modal("hide");
	modal.addClass("fade");
	modal.find("#modal-title").text(title);
	modal.find("#modal-body").html(body);
	if (button1 == null) {
		modal.find("#modal-button1").hide();
	} else if (typeof (button1) == "function") {
		modal.find("#modal-button1").click(button1);
		modal.find("#modal-button1").show();
	} else if (button1 == "refresh") {
		modal.find("#modal-button1").click(function() {
			window.location.reload();
		});
		modal.find("#modal-button1").show();
	}
	if (button2 == null) {
		modal.find("#modal-button2").hide();
	} else if (typeof (button2) == "function") {
		modal.find("#modal-button2").removeAttr("data-dismiss");
		modal.find("#modal-button2").click(button2);
		modal.find("#modal-button2").show();
	} else {
		modal.find("#modal-button2").attr("data-dismiss", "modal");
		modal.find("#modal-button2").click(null);
		modal.find("#modal-button2").show();
	}
	modal.modal("show");
}