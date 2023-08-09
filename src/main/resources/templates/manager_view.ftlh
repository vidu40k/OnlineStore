<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rc-design</title>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdn.datatables.net/buttons/1.2.2/css/buttons.bootstrap.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles/header_footer.css">
    <style>
        h6 {
            margin-left: 20px;
            margin-right: 50px;
            margin-top: 5px;
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
        }
        h5 {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            font-size: 17px;
            font-weight: 600;

        }

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
<div class="content">
    <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th><h3>Заказчик</h3></th>
            <th><h3>Содержание заказа</h3></th>
            <th><h3>Дата заказа</h3></th>
            <th><h3>Адрес доставки</h3></th>
            <th><h3>Стоимость</h3></th>
            <th><h3>Статус</h3></th>
        </tr>
        </thead>
        <tbody>
        <#list orders as order>

            <#if order.orderStatus == "Одобрен">
                <tr style="background-color: #b3cbb2">

                    <td><h5> ${order.customer.name} <br>${order.customer.email} <br>${order.customer.phone} </h5></td>
                    <td>
                        <#list order.cars as car>
                            <h5>
                                ${car.car.name} - ${car.quantity}шт
                            </h5>
                        </#list>
                    </td>
                    <td><h5>${order.orderDate}</h5></td>
                    <td><h5>${order.customer.address}</h5></td>
                    <td><h5>${order.totalPrice}$</h5></td>

                    <td>
                        <span class="badge badge-outline-success" style="background-color: #42c42c">Завершен</span>
                        <form action="/manager/order/delete/${order.id}" method="post">
                            <button type="submit" class="btn btn-danger">Удалить</button>
                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                        </form>
                    </td>

                </tr>

            <#elseif order.orderStatus == "Не одобрен" >

                <tr style="background-color: #dec0c0">


                    <td><h5> ${order.customer.name} <br>${order.customer.email} <br>${order.customer.phone} </h5></td>
                    <td>
                        <#list order.cars as car>
                            <h5>
                                ${car.car.name} - ${car.quantity}шт
                            </h5>
                        </#list>
                    </td>
                    <td><h5>${order.orderDate}</h5></td>
                    <td><h5>${order.customer.address}</h5></td>
                    <td><h5>${order.totalPrice}$</h5></td>

                    <td>
                        <span class="badge badge-outline-danger" style="background-color: #c21919">Отменен</span>
                        <form action="/manager/order/delete/${order.id}" method="post">
                            <button type="submit" class="btn btn-danger">Удалить</button>
                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                        </form>
                    </td>
                </tr>

            <#else >
                <tr style="background-color: #b7b7b7">

                    <td><h5> ${order.customer.name} <br>${order.customer.email} <br>${order.customer.phone} </h5></td>
                    <td>
                        <#list order.cars as car>
                            <h5>
                                ${car.car.name} - ${car.quantity}шт
                            </h5>
                        </#list>
                    </td>
                    <td><h5>${order.orderDate}</h5></td>
                    <td><h5>${order.customer.address}</h5></td>
                    <td><h5>${order.totalPrice}$</h5></td>

                    <td>
                        <span class="badge badge-warning" style="background-color: #cebf1e">Оплачено</span>
                        <form method="post" action="/manager/order/status/done/${order.id}">
                            <button type="submit" class="btn btn-success">Передать в доставку</button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>

                        <form method="post" action="/manager/order/status/undone/${order.id}">
                            <button type="submit" class="btn btn-danger">Отменить заказ</button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>

                    </td>

                </tr>

            </#if>
        </#list>
        </tbody>
    </table>
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


<#--<a href="/manager/add"> Добавить продукт</a>-->
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js'></script>
<script src='https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js'></script>
<script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'></script>
<script src='https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js'></script>
<script src='https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js'></script>

<script>

    // function submit(form){
    //     form.submit()
    // }

    // $(document).ready(function () {
    //     //Only needed for the filename of export files.
    //     //Normally set in the title tag of your page.
    //     document.title = "Card View DataTable";
    //     // DataTable initialisation
    //     $("#example").DataTable({
    //         dom: '<"dt-buttons"Bf><"clear">lirtp',
    //         paging: true,
    //         autoWidth: true,
    //         buttons: [
    //             "colvis",
    //         ],
    //         initComplete: function (settings, json) {
    //             $(".dt-buttons .btn-group").append(
    //                 '<a id="cv" class="btn btn-primary" href="#">CARD VIEW</a>'
    //             );
    //             $("#cv").on("click", function () {
    //                 if ($("#example").hasClass("card")) {
    //                     $(".colHeader").remove();
    //                 } else {
    //                     var labels = [];
    //                     $("#example thead th").each(function () {
    //                         labels.push($(this).text());
    //                     });
    //                     $("#example tbody tr").each(function () {
    //                         $(this)
    //                             .find("td")
    //                             .each(function (column) {
    //                                 $("<span class='colHeader'>" + labels[column] + ":</span>").prependTo(
    //                                     $(this)
    //                                 );
    //                             });
    //                     });
    //                 }
    //                 $("#example").toggleClass("card");
    //             });
    //         }
    //     });
    // });


</script>
</body>
</html>
