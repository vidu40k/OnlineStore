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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    <style>

        .filter {
            border-radius: 40px;
            border: none;
            width: 50px;
        }

        a {
            color: #181818;
            text-decoration: none;
        }

        h6 {
            margin-left: 20px;
            margin-right: 50px;
            margin-top: 5px;
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
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

            <div class="products">
                <h6>На счету: ${userDetails.money}$ </h6>
            </div>

            <div class="products">
                <a href="/products" class="link-ellipse">Продукты</a>
            </div>

            <div class="dropdown">
                <h6>Аккаунт</h6>
                <div class="dropdown-content acc">

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





        <#else>


            <div class="logout">
                <a href="/auth/login" class="link-ellipse">Войти в аккаунт</a>
            </div>
        </#if>

    </div>
</header>


<nav class="navbar navbar-expand-xl navbar-dark bg-dark" style="width: 1400px; margin: auto">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarDark"
                aria-controls="navbarDark" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse show" id="navbarDark" >
            <ul class="navbar-nav me-auto mb-2 mb-xl-0" style="margin: auto">

                <form method="get" action="/products" enctype="multipart/form-data" style="display: flex; flex-direction: row">
                    <fieldset>
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <#--                        <input type="number" value="${filter.minSpeed}" name="min_speed">-->
                        <#--                        <input type="number" value="${filter.maxSpeed}" name="max_speed">-->
                        <#--                        <input type="number" value="${filter.minPower}" name="min_power">-->
                        <#--                        <input type="number" value="${filter.maxPower}" name="max_power">-->
                        <#--                        <input type="number" value="${filter.minPrice}" name="min_price">-->
                        <#--                        <input type="number" value="${filter.maxPrice}" name="max_price">-->


                        <li class="nav-item">
                            <div class="brand_block">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                            data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        Бренд
                                    </button>
                                    <ul class="dropdown-menu">
                                        <#assign check="checked">
                                        <#list brands as brand>
                                            <div class="form-check">


                                                <#list filter.brandName as brandInFilter>

                                                    <#if brand.name == brandInFilter >
                                                        <#assign check="checked">
                                                        <#break >
                                                    <#else>  <#assign check = "" >
                                                    </#if>

                                                </#list>
                                                <input class="form-check-input" name="brand_name" type="checkbox"
                                                       value="${brand.name}" id="formCheckChecked"
                                                        ${check}>
                                                <label class="form-check-label"
                                                       for="formCheckChecked">${brand.name}</label>
                                            </div>
                                        </#list>
                                        <#--                                <div class="form-check">-->
                                        <#--                                    <input class="form-check-input" type="checkbox" value="" id="formCheckChecked"-->
                                        <#--                                           checked="">-->
                                        <#--                                    <label class="form-check-label" for="formCheckChecked">Checked</label>-->
                                        <#--                                </div>-->
                                    </ul>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <div class="speed_block" style="width: 200px; color: white">
                                <label for="formRange" class="form-label">Скорость:</label><br>
                                <label for="formRange" class="form-label">от:</label>
                                <input type="number" class="filter" value="${filter.minSpeed}" name="min_speed">
                                <#--                        <input type="range" class="form-range" min="0" max="20" step="1" id="formRange">-->
                                <label for="formRange" class="form-label">До:</label>
                                <#--                                <#if filter.maxSpeed = 10000 >-->
                                <#--                                    <#assign filter.maxSpeed = 0>-->
                                <#--                                </#if>-->
                                <input type="number" class="filter" value="${filter.maxSpeed}" name="max_speed">
                                <#--                        <input type="range" class="form-range" min="0" max="5" step="0.5" id="formRange">-->
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="power_block" style="width: 200px; color: white">
                                <label for="formRange" class="form-label">Мощность от:</label><br>
                                <label for="formRange" class="form-label">от:</label>
                                <input type="number" class="filter" value="${filter.minPower}" name="min_power">
                                <#--                        <input type="range" class="form-range" min="0" max="20" step="1" id="formRange">-->
                                <label for="formRange" class="form-label">До:</label>
                                <#--                                <#if filter.maxPower = 10000 >-->
                                <#--                                    <#assign filter.maxPower = 0>-->
                                <#--                                </#if>-->
                                <input type="number" class="filter" value="${filter.maxPower}" name="max_power">
                                <#--                        <input type="range" class="form-range" min="0" max="5" step="0.5" id="formRange">-->
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="price_block" style="width: 200px; color: white">
                                <label for="formRange" class="form-label">Цена:</label><br>
                                <label for="formRange" class="form-label">от:</label>
                                <input type="number" class="filter" value="${filter.minPrice}" name="min_price">
                                <#--                        <input type="range" class="form-range" min="0" max="20" step="1" id="formRange">-->
                                <label for="formRange" class="form-label">До:</label>
                                <#--                                <#if filter.maxPrice = 10000 >-->
                                <#--                                    <#assign filter.maxPrice = 0>-->
                                <#--                                </#if>-->
                                <input type="number" class="filter" value="${filter.maxPrice}" name="max_price">
                                <#--                        <input type="range" class="form-range" min="0" max="5" step="0.5" id="formRange">-->
                            </div>
                        </li>

                    </fieldset>
                    <div >
                        <button class="btn btn-outline-light" type="submit">Применить</button>
                    </div>

                </form>
            </ul>
            <#--            <form class="d-flex">-->
            <#--                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
            <#--                <button class="btn btn-outline-light" type="submit">Search</button>-->
            <#--            </form>-->
        </div>
    </div>
</nav>


<#--<header class="header">-->

<#--    <div class="hbot">-->
<#--        <div class="container">-->
<#--            <nav class="navbar navbar-full navbar-dark bg-inverse" style="min-width: 100%">-->

<#--                <button class="navbar-toggler light float-xs-right hidden-sm-up" type="button" data-toggle="collapse"-->
<#--                        data-target="#nvbar"></button>-->
<#--                <div id="nvbar" class="collapse navbar-toggleable-xs" style="max-height: 50px; ">-->
<#--&lt;#&ndash;                    <div class="image" style="max-width: 20px"><img src="../static/images/logo.jpg" style="height: 50px;width: 50px; "> </div>&ndash;&gt;-->
<#--                    <ul class="nav navbar-nav float-sm-right ">-->
<#--                        <li class="nav-item"><a class="nav-link" href="/index">Home</a></li>-->
<#--                        <li class="nav-item"><a class="nav-link" href="/products">Products</a></li>-->
<#--                        <li class="nav-item account">-->
<#--                            <div class="acc-block"><a class="nav-link acc" href="/logout">Выйти</a></div>-->
<#--                        </li>-->

<#--                    </ul>-->
<#--                </div>-->
<#--            </nav>-->
<#--        </div>-->
<#--    </div>-->

<#--    <div class="htop">-->
<#--        <div id="checkoutdiv " class="container">-->
<#--            <div class="row">-->
<#--                <div class="col-md-6 text-xs-right ">(<span class="items text-muted"></span> <small>items</small>) <span-->
<#--                            class="total"></span></div>-->
<#--                <div class="col-md-6 text-xs-right"><span class="btn btn-success" data-toggle="modal"-->
<#--                                                          data-target="#cart">Оформить заказ</span><a-->
<#--                            href="/cart/checkout" class="btn btn-primary">Открыть корзину</a></div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->

<#--</header>-->
<div class="content">
    <!-- content changes on each page -->
    <div class="container">
        <div class="row">


            <#list cars as car>

                <div class="col-md-3">
                    <div class="card" style="align-items: center">
                        <div class="card-blockImg"><a href="/product_page/${car.id}">
                                <img src="../static/images/${car.imageUrl}" style="max-width: 200px; max-height: 200px"
                                     class="img-fluid">
                                <h3 class="card-title" style="color: #181818">${car.name}</h3>
                                <h6 class="card-subtitle text-muted">$${car.price}</h6>
                            </a>
                        </div>

                        <div class="card-block">
                            <ul>
                                <li class="specifications"><p class="spec">
                                        Скорость: ${car.carInfo.specification.maxSpeed}
                                        м/с</p></li>
                                <li class="specifications"><p class="spec">Батарея: ${car.carInfo.specification.power}
                                        Вт</p></li>
                                <li class="specifications"><p class="spec">Вес: ${car.carInfo.specification.weight}
                                        грамм</p></li>
                            </ul>
                        </div>

                        <div class="card-block">
                            <div class="card-text"> ${car.carInfo.description} <br><br>
                                <a onclick="addToCart(this,'${_csrf.token}')"
                                   class="card-link productItem btn btn-primary"
                                   data-name="${car.name}"
                                   data-price="${car.price}" data-id="${car.id}">В Корзину</a></div>
                        </div>

                    </div>
                </div>
            </#list>


        </div>
    </div>


    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">

            <#if cur_page!=0 >
                <li class="page-item">
                    <a class="page-link" href="/products?page=${cur_page-1}" tabindex="-1">Предыдущая</a>
                </li>
            <#else  >
                <li class="page-item disabled">
                    <a class="page-link" href="/products?page=${cur_page-1}" tabindex="-1">Предыдущая</a>
                </li>
            </#if>
            <#list 0..total/8  as page >
                <li class="page-item"><a class="page-link" href="/products?page=${page}">${page+1}</a></li>
            </#list>
            <#if cur_page + 1 < total/8 >
                <li class="page-item">
                    <a class="page-link" href="/products?page=${cur_page+1}">Следущая</a>
                </li>
            <#else >

                <li class="page-item disabled">
                    <a class="page-link" href="/products?page=${cur_page+1}" tabindex="-1">Следущая</a>
                </li>
            </#if>

        </ul>
    </nav>

</div>

<!-- Modals -->
<div class="modal fade" id="cart" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title">Shopping Cart</h4>
            </div>
            <div class="modal-body">
                <table class="table table-hover">
                    <thead class="thead-inverse">
                    <tr>
                        <th>Qty</th>
                        <th>Item Name</th>
                        <th>Cost</th>
                        <th class="text-xs-right">Subtotal</th>
                    </tr>
                    </thead>
                    <tbody id="output"></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Continue Shopping</button>
                <a href="/checkout" class="btn btn-primary">Proceed to checkout</a></div>
        </div>
    </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
        integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
        integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
        crossorigin="anonymous"></script>


<script>
    var shopcart = [];
    $(document).ready(function () {
        outputCart();
        $(".productItem").click(function (e) {
            e.preventDefault();
            var iteminfo = $(this.dataset)[0];
            iteminfo.qty = 1;
            var itemincart = false;
            $.each(shopcart, function (index, value) {
                //console.log(index + '  ' + value.id);
                if (value.id == iteminfo.id) {
                    value.qty = parseInt(value.qty) + parseInt(iteminfo.qty);
                    itemincart = true;
                }
            })
            if (!itemincart) {
                shopcart.push(iteminfo);
            }
            sessionStorage["sca"] = JSON.stringify(shopcart);
            outputCart();
            ///
        })

        function outputCart() {
            if (sessionStorage["sca"] != null) {
                shopcart = JSON.parse(sessionStorage["sca"].toString());
                console.log(sessionStorage["sca"]);
                $('#checkoutdiv').show();
            }
            var holderHTML = '';
            var total = 0;
            var itemCnt = 0;
            $.each(shopcart, function (index, value) {
                console.log(value);
                var stotal = value.qty * value.price;
                total += stotal;
                itemCnt += parseInt(value.qty);
                holderHTML += '<tr><td>' + value.qty + '</td><td>#' + value.id + ' ' + value.name + '(' + value.s + ')</td><td> ' + formatMoney(value.price) + ' </td><td class="text-xs-right"> ' + formatMoney(stotal) + '</td></tr>';
            })
            holderHTML += '<tr><td colspan="3" class="text-xs-right">Total</td><td class="text-xs-right">' + formatMoney(total) + '</td></tr>';
            $('#output').html(holderHTML);
            $('.total').html(formatMoney(total));
            $('.items').html(itemCnt);
        }

        function formatMoney(n) {
            return '$' + (n / 100).toFixed(2);
        }
    })

    var account_block = document.querySelector(".account");
    account_block.addEventListener("mouseover", function (e) {
        var acc = document.querySelector(".acc");
        acc.innerHTML = `Выйти`;
        console.log("out");
    });

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


</script>
</body>

</html>