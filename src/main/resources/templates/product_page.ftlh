<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CodePen - Product Page With Zoom</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rc-design</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css">
    <link rel="stylesheet" href="https://awik.io/demo/webshop-zoom/drift-basic.min.css">
    <link rel="stylesheet" href="../styles/product_page_style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/styles/header_footer.css">
</head>
<body>
<!-- partial:index.partial.html -->
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
    <div class="columns">
        <div class="column">
            <div class="thumbnail-container">
                <img class="drift-demo-trigger" data-zoom="../static/images/${car.imageUrl}"
                     src="../static/images/${car.imageUrl}" style="max-width: 400px; max-height: 400px">
            </div>
        </div>

        <div class="column">
            <div class="details">
                <h1>${car.name}</h1>
                <p class="price">$${car.price}</p>
                <p class="description">${car.carInfo.description}</p>

                <div class="columns">


                    <div class="column" id="buy-container">
                        <form action="/cart/add/${car.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="button buy-button">
            <span class="icon is-small">
                <i class="fas fa-shopping-bag"></i>
              </span>
                                <span>В корзину</span>
                            </button>
                        </form>
                    </div>

                </div>

                <ul>
                    <li class="specifications"><p class="spec">Бренд: ${car.brand.name}</p></li>
                    <li class="specifications"><p class="spec">Тип: ${car.type.name}</p></li>
                    <li class="specifications"><p class="spec">Скорость: ${car.carInfo.specification.maxSpeed} м/с</p>
                    </li>
                    <li class="specifications"><p class="spec">Мощность: ${car.carInfo.specification.power} вт</p></li>
                    <li class="specifications"><p class="spec">Вес: ${car.carInfo.specification.weight} грамм</p></li>
                    <li class="specifications"><p class="spec">Длина: ${car.carInfo.specification.length} мм</p></li>
                    <li class="specifications"><p class="spec">Ширина: ${car.carInfo.specification.width} мм</p></li>

                </ul>

            </div>
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

<script src='https://awik.io/demo/webshop-zoom/Drift.min.js'></script>
<script src="../static/scripts/product_page_script.js"></script>

</body>
</html>
