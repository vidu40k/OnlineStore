<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Rc-design</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/styles/header_footer.css">
    <link rel="stylesheet" href="../static/styles/cart.css">

    <style>
        input[type="number"] {
            width: 50px;
        }

        .table td {
            text-align: center;
            vertical-align: baseline;
        }

        thead {
            background-color: #28622b;

            color: white;
        }

        thead .th1 {
            border-top-left-radius: 20px;
        }

        thead .delete {
            border-top-right-radius: 20px;
        }

        .bt {
            color: #181818;
            border: none;
            height: 40px;
            width: 40px;
            border-radius: 30%;
        }

        .bt:hover {
            color: #ffffff;
            border: none;
            background-color: #982121;
            transition: all 0.3s ease;
            border-radius: 30%;
            height: 40px;
            width: 40px;
        }

        .td1 {
            display: flex;
            flex-direction: row;
        }

        thead
    </style>
</head>

<body>

<header>
    <div class="right_block">
        <div class="logo">
            <img src="../static/images/logo.jpg" alt="Логотип">
        </div>

        <#if userDetails?? >
            <#if userDetails.isManager()>
                <div class="dropdown">
                    <h6>Менеджер меню</h6>
                    <div class="dropdown-content">
                        <a href="/manager/view">Просмотр заказов</a>
                        <a href="/manager/products">Управление Продуктами</a>
                    </div>
                </div>
            </#if>

            <#if userDetails.isAdmin()>
                <div class="admin">
                    <a href="/admin/users" class="link-ellipse">Пользователи</a>
                </div>
            </#if>
        </#if>
    </div>

    <div class="left_block">

        <#if userDetails?? >


            <div class="dropdown">
                <h6>Аккаунт</h6>
                <div class="dropdown-content">

                    <div class="cart">
                        <a href="/cart/checkout" class="link-ellipse">Корзина</a>
                    </div>
                    <div class="products">
                        <a href="/history" class="link-ellipse">История заказов</a>
                    </div>
                    <div class="products">
                        <a href="/user/add/balance" class="link-ellipse">Пополнить счет</a>
                    </div>
                    <div class="logout">
                        <a href="/logout" class="link-ellipse">Выход из аккаунта</a>
                    </div>

                </div>
            </div>

            <div class="products">
                <a href="/products" class="link-ellipse">Продукты</a>
            </div>

            <div class="products">
                <h6>На счету: ${userDetails.money}$ </h6>
            </div>

        <#else>


            <div class="logout">
                <a href="/auth/login" class="link-ellipse">Войти в аккаунт</a>
            </div>
        </#if>

    </div>
</header>

<div class="content" style="padding-top: 0">

    <#list userDetails.orders as order>

        <#if order.orderStatus == "Одобрен">

            <div class="alert alert-success" role="alert">
                <strong>${userDetails.name}</strong>, ваш заказ №${order.id} Передан в службу доставки.
            </div>

        <#elseif order.orderStatus == "Не одобрен">
            <div class="alert alert-danger" role="alert">
                <strong>${userDetails.name}</strong>, к сожалению, ваш заказ №${order.id} отклонен.
                Вскоре вам вернут ваши деньги.
            </div>
        <#else >
            <div class="alert alert-info" role="alert">
                <strong>${userDetails.name}</strong>, ваш заказ №${order.id}
                оплачен и в скором времени будет обработан менеджером.
            </div>
        </#if>


    </#list>

</div>
<div class="foot_container">
    <!-- Footer -->
    <footer class="text-center text-lg-start bg-white text-muted">
        <!-- Section: Social media -->
        <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
            <!-- Left -->
            <div class="me-5 d-none d-lg-block">
                <span>Get connected with us on social networks:</span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 link-secondary">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3 text-secondary"></i>Rc-design
                        </h6>
                        <p>
                            Мы предлагаем разнообразие моделей радиоуправляемых машинок, включая спортивные автомобили,
                            внедорожники, гоночные машины, грузовики и многое другое.
                            Наш каталог включает модели от ведущих производителей, известных своим качеством и
                            инновационными решениями в области радиоуправления.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Наши поставщики
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Porsche</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Ferrari</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Lamborghini</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Le Yu Toys</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Полезные ссылки
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">О компании</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Пользоваетельское соглашение</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Реклама</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Техподдержка</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">Контакты</h6>
                        <p><i class="fas fa-home me-3 text-secondary"></i> Минск, 220004, Беларусь</p>
                        <p>
                            <i class="fas fa-envelope me-3 text-secondary"></i>
                            rc_design@gmail.com
                        </p>
                        <p><i class="fas fa-phone me-3 text-secondary"></i> + 375(44) 123-22-32</p>
                        <p><i class="fas fa-print me-3 text-secondary"></i> + 375(29) 234-56-78</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
            © 2001—2023 Rc-design
        </div>
        <!-- Copyright -->
    </footer>
</div>
<!-- Footer -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

    table.row.add(rowData).draw(false);
    //REMOVE EDIT AND DELETE EVENTS FROM ALL BUTTONS
    $('.dt-edit').off('click');
    $('.dt-delete').off('click');
    //CREATE NEW CLICK EVENTS
    $('.dt-edit').each(function () {
        $(this).on('click', function (evt) {
            $this = $(this);
            var dtRow = $this.parents('tr');
            $('div.modal-body').innerHTML = '';
            $('div.modal-body').append('Row index: ' + dtRow[0].rowIndex + '<br/>');
            $('div.modal-body').append('Number of columns: ' + dtRow[0].cells.length + '<br/>');
            for (var i = 0; i < dtRow[0].cells.length; i++) {
                $('div.modal-body').append('Cell (column, row) ' + dtRow[0].cells[i]._DT_CellIndex.column + ', ' + dtRow[0].cells[i]._DT_CellIndex.row + ' => innerHTML : ' + dtRow[0].cells[i].innerHTML + '<br/>');
            }
            $('#myModal').modal('show');
        });
    });

    function deleteFromCart(car, token) {
        console.log(car)
        let id = car.getAttribute('data-id');
        console.log("send delete to cart req. car-id =" + id)
        fetch('/cart/delete/' + id, {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': token,
                'Content-Type': 'application/json'
            },

        })
    }

    function addToCart(car, token) {
        let id = car.getAttribute('data-id');
        let isFavorite = true;
        console.log("send add to cart req. car-id =" + id)
        fetch('/cart/add/' + id, {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': token,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({isFavorite: isFavorite})
        })
    }

    // var shopcart = [];
    // $(document).ready(function () {
    //     outputCart();
    //     $('#output').on('change keyup', '.dynqua', function () {
    //         var iteminfo = $(this.dataset)[0];
    //         var itemincart = false;
    //         console.log(shopcart);
    //         var qty = $(this).val();
    //         if (qty < 0) {
    //             qty = 0;
    //             $(this).val(0);
    //         }
    //         $.each(shopcart, function (index, value) {
    //             if (value.id == iteminfo.id) {
    //                 shopcart[index].qty = qty;
    //                 itemincart = true;
    //             }
    //         })
    //         sessionStorage["sca"] = JSON.stringify(shopcart);
    //         outputCart();
    //     })

    // function outputCart() {
    //     if (sessionStorage["sca"] != null) {
    //         shopcart = JSON.parse(sessionStorage["sca"].toString());
    //     }
    //     console.log(sessionStorage["sca"]);
    //     console.log(shopcart);
    //     var holderHTML = '';
    //     var total = 0;
    //     var itemCnt = 0;
    //     $.each(shopcart, function (index, value) {
    //         var stotal = value.qty * value.price;
    //         var a = (index + 1);
    //         total += stotal;
    //         itemCnt += parseInt(value.qty);
    //         holderHTML += '<tr><td><input size="5"  type="number" class="dynqua" name="quantity_' + a + '" value="' + value.qty + '" data-id="' + value.id + '"></td><td><input type="hidden" name="item_name_' + a + '" value="' + value.name + ' ' + value.s + '">' + value.name + '(' + value.s + ')</td><td><input type="hidden" name="amount_' + a + '" value="' + formatMoney(value.price) + '"> $' + formatMoney(value.price) + ' </td><td class="text-xs-right"> ' + formatMoney(stotal) + '</td></tr>';
    //     })
    //     holderHTML += '<tr><td colspan="3" class="text-xs-right">Total</td><td class="text-xs-right">$' + formatMoney(total) + '</td></tr>';
    //     $('#output').html(holderHTML);
    // }

    // function formatMoney(n) {
    //     return (n / 100).toFixed(2);
    // }
    // })

    function totalMoney(car) {


    }
</script>
</body>

</html>