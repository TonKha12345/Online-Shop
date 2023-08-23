
var content = {
    init: function () {
        content.registerEvent();
    },
    registerEvent: function () {
        $('.btn-active-content').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Content/ChangeStatus",
                data: { ID: id },
                dataType: 'json',
                type: 'Post',
                success: function (res) {
                    console.log(res);
                    if (res.status == true) {
                        btn.text("Kích hoạt");
                    }
                    else {
                        btn.text("Khóa");
                    }
                }
            });
        });
    }
}
content.init();