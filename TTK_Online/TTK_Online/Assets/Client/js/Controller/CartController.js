var cart = {
    init: function () {
        cart.registerEvent();
    },
    registerEvent: function () {
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = "/";
        });

        $('#btnPayment').off('click').on('click', function () {
            $.ajax({
                url: 'Cart/Payment',
                dataType: 'json',
                type: 'post',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "thanh-toan-user"
                    }
                    else {
                        window.location.href = "thanh-toan-khong-user"
                    }
                }
            })
        });


        $('#btnUpdate').off('click').on('click', function () {
            var listProduct = $('.txtQuantity');
            var cartList = [];
            $.each(listProduct, function (i, item) {
                cartList.push({
                    Quantity: $(item).val(),
                    Product: {
                        ID: $(item).data('id')
                    }
                });
            });

            $.ajax({
                url: '/Cart/Update',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'Json',
                type: 'Post',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang"
                    }
                }
            });
        });

        $('#btnDeleteAll').off('click').on('click', function () {
            $.ajax({
                url: "Cart/DeleteAll",
                dataType: 'json',
                type: 'post',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            });
        });
    }
}
cart.init();