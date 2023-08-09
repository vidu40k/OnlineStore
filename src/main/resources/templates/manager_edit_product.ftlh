<!DOCTYPE html>
<html lang="ru">

<head>
    <title>Rc-design</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="/static/styles/header_footer.css">

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
    <form name="add_car" class="form-horizontal" action="/manager/product/update" method="post">
        <fieldset>


            <input type="hidden" value="${car.id}" name="car_id">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="product_name">Название товара</label>
                <div class="col-md-4">
                    <input id="product_name" name="name" placeholder="Название товара" class="form-control input-md"
                           required="" type="text" value="${car.name}">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="product_name_fr">Бренд</label>
                <div class="col-md-4">
                    <input id="product_name_fr" name="brand_name" placeholder="Бренд"
                           class="form-control input-md" required="" type="text" value="${car.brand.name}">
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="product_categorie">Тип товара</label>
                <div class="col-md-4">
                    <input id="product_name_fr" name="type_name" placeholder="Тип"
                           class="form-control input-md" required="" type="text"
                           value="${car.type.name}">
                </div>
            </div>


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="product_weight">Вес товара</label>
                <div class="col-md-4">
                    <input id="product_weight" name="weight" placeholder="Вес товара"
                           class="form-control input-md" required="" type="number"
                           value="${car.carInfo.specification.weight}">

                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="product_description">Описание товара</label>
                <div class="col-md-4">
                    <input id="product_name_fr" name="description" placeholder="Описание"
                           class="form-control input-md" required="" type="text"
                           value="${car.carInfo.description}">
                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="product_name_fr">Длина</label>
                <div class="col-md-4">
                    <input id="percentage_discount" name="length" placeholder="Длина"
                           class="form-control input-md" required="" type="number"
                           value="${car.carInfo.specification.length}">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="percentage_discount">Ширина</label>
                <div class="col-md-4">
                    <input id="percentage_discount" name="width" placeholder="Ширина"
                           class="form-control input-md" required="" type="number"
                           value="${car.carInfo.specification.width}">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="stock_alert">Мощность</label>
                <div class="col-md-4">
                    <input id="stock_critical" name="power" placeholder="Мощность"
                           class="form-control input-md" required="" type="number"
                           value="${car.carInfo.specification.power}">
                </div>
            </div>

            <!-- Search input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="stock_critical">Максимальная скорость (м/с)</label>
                <div class="col-md-4">
                    <input id="stock_critical" name="maxSpeed" placeholder="Максимальная скорость"
                           class="form-control input-md" required="" type="number"
                           value="${car.carInfo.specification.maxSpeed}">

                </div>
            </div>


            <!-- Search input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="tutorial_fr">Цена</label>
                <div class="col-md-4">
                    <input id="tutorial_fr" name="price" placeholder="Цена" class="form-control input-md"
                           required="" type="number" value="${car.price}">
                </div>
            </div>



            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="form-group">
                <label class="col-md-4 control-label" for="singlebutton">Single Button</label>
                <div class="col-md-4">
                    <button id="singlebutton" name="singlebutton" type="submit" class="btn btn-primary">Button</button>
                </div>
            </div>

        </fieldset>
    </form>
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
                            Мы предлагаем разнообразие моделей радиоуправляемых машинок, включая спортивные автомобили, внедорожники, гоночные машины, грузовики и многое другое.
                            Наш каталог включает модели от ведущих производителей, известных своим качеством и инновационными решениями в области радиоуправления.
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

</body>
</html>