$().ready(function() {
	validateRule();
    $("#workType").children("option").each(function(){
        if($(this).val() == $("#type").val()){
            $(this).attr("selected",true);
        }
    });
});

$.validator.setDefaults({
	submitHandler : function() {
		update();
	}
});
function update() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/worker/worker/update",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);

			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}
function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    jQuery.validator.addMethod("isMobile", function (value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length			 == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");
    $("#signupForm").validate({
        rules : {
            workName : {
                required : true
            },
            workNo : {
                required : true
            },
            phone: {
                required: true,
                minlength: 11,
                isMobile: true
                // remote: {//更新时不验证
                //     param: {
                //         url: sys.rootPath + '/worker/withoutAuth/validateWorkerPhone.html',
                //         cache: false
                //     },
                //     depends: function () {
                //         return typeof ($("#workerId").val()) == "undefined";
                //     }
                //  }
            },
        },
        messages : {

            workName : {
                required : icon + "请输入姓名"
            },
            workNo : {
                required : icon + "请输入员工编号"
            },
            phone: {
                required: "请输入手机号",
                minlength: "确认手机不能小于11位",
                isMobile: "请正确填写您的手机号码"
                // remote: "该手机号码已注册,请使用其他手机号码"
            },
        }
	})
}