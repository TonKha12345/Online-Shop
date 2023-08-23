var user = {
    init: function () {
        user.loadProvinceID();
        user.registerEvent();
    },
    
    registerEvent: function () {
        $('#ddlProvince').off('change').on('change', function () {
            var id = $(this).val();
            if (id != '') {
                user.loadDistrict(parseInt(id));
            }
            else {
                $('ddlDistrict').html('');
            }
        });
    },
    loadProvinceID: function () {
        $.ajax({
            url: '/Register/LoadProvince',
            dataType: "json",
            type: "Post",
            success: function (res) {
                if (res.status == true) {
                    var html = '<option value="">--Chọn tỉnh thành--</option>';
                    var data = res.data;
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.ID + '">' + item.Name + '</option>'
                    });
                    $('#ddlProvince').html(html);
                }
            }
        });
    },

    loadDistrict: function (id) {
        $.ajax({
            url: '/Register/LoadDistrict',
            data: { provinceID: id },
            dataType: 'json',
            type: 'post',
            success: function (res) {
                if (res.status == true) {
                    var data = res.data;
                    var html = '<option value="">--Chọn quận huyện--</option>';
                    $.each(data, function (i, item) {
                        html += '<option value="' + item.ID + '">' + item.Name + '</option>'
                    });
                    $('#ddlDistrict').html(html);
                }
            }
        });
    }
}
user.init();