<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CodePen - Form card credit</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato|Liu+Jian+Mao+Cao&display=swap">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css'>
    <link rel="stylesheet" href="../static/styles/bank_card.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/styles/header_footer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
          crossorigin="anonymous">
    <style>


        body {
            background-color: #c9c9c9;
        }

        .content {
            background-color: white;
            width: 1400px;
            margin: auto;
            min-height: 1000px;
            padding: 20px;
        }

        header {
            width: 1400px;
            height: 70px;
            background-color: #28622b;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            margin: auto;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        header a {
            font-weight: bold;
            font-size: 18px;
        }

        .card {
            margin-top: 30px;
            height: 600px;
            display: block;
        }

        .card-blockImg {
            height: 250px;
            display: flex;
            flex-direction: column-reverse ;
        }

        .card-block {
            height: auto;
            max-height: 20%;
            margin: auto;
        }


        .card-blockImg img {
            max-height: 200px;
            max-width: 200px;

            overflow: hidden;
            margin-bottom: 20px;
        }

        /* Стили для логотипа */
        .logo img {
            width: 100px;
            height: auto;
        }

        .mcontent{
            background-color: #ffffff;

        }

        .admin, .products, .cart, .logout {

            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 300px;
            width: auto;
        }

        h6 {
            margin-left: 20px;
            margin-right: 50px;
            margin-top: 5px;
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
            font-size:18px ;
        }

        /* Стили для кнопки "Выход из аккаунта" */
        .admin a, .products a, .cart a, .logout a {
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
        }

        /* Стили для выплывающих меню */
        .dropdown {
            position: relative;
            display: flex;
            align-items: center;
        }

        /* Стили для кнопок выплывающих меню */
        .dropdown button {
            background-color: transparent;
            border: none;
            color: #333;
            cursor: pointer;
            padding: 10px;
            font-weight: bold;
        }

        button {
            color: white;
        }

        /* Стили для выплывающего контента меню */
        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            background-color: #28622b;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            transition: all 0.3s ease;
        }

        /* Стили для подпунктов выплывающих меню */
        .dropdown-content a {
            color: #ffffff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        /* Стили для подпунктов выплывающих меню при наведении */
        .dropdown-content a:hover {
            background-color: #ffffff;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            color: #181818;

        }

        /* Стили для активного выплывающего меню */
        .dropdown:hover .dropdown-content {
            display: block;
            transition: all 0.3s ease;
        }

        /* Стили для ссылок в элипсе */
        .link-ellipse {
            display: inline-block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 200px; /* Измените на желаемую максимальную ширину */
            border-radius: 20px;
            padding: 5px 10px;
            transition: background-color 0.3s ease;
        }

        /* Стили для подсветки фона ссылок после наведения */
        .link-ellipse:hover {
            background-color: #ffffff;
            transition: all 0.3s ease;
            color: #181818;
        }

        .right_block {
            display: flex;
            flex-direction: row;
            width: 50%;
            height: 100%;
        }

        .left_block {
            display: flex;
            flex-direction: row-reverse;
            width: 50%;
            height: 100%;
        }

        .logo img {
            height: 50px;
            width: 50px;
            border-radius: 10px;
        }

        .foot_container {
            width: 1400px;
            height: 140px;
            margin: auto;
        }

        footer {
            background-color: #28622b;
        }

        .row.mt-3 {
            margin-top: 0;
        }
        .mt-3 {
            margin-top: 0;
        }

        .text-center{


            text-align: center;
        }
        .text-center .p-4{

            text-align: center;
        }

        .mx-auto{
            width: 25%;
        }


        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        *:focus {
            outline: 0;
        }

        html {
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }

        body {
            background-color: #ddeefc;
            font-family: 'Lato', sans-serif;
        }

        .container {
            align-items: center;
            display: flex;
            flex-direction: column;
            margin: auto;
            max-width: 1000px;
            padding: 40px 20px;
            width: 90%;
        }

        /* Tarjeta */
        .card {
            color: #ffffff;
            cursor: pointer;
            max-width: 550px;
            position: relative;
            transform: rotateY(0);
            transform-style: preserve-3d;
            transition: transform 0.3s ease;
            width: 100%;
            z-index: 3;
            height: 320px;
        }

        .card.active {
            transform: rotateY(180deg);
        }

        .card > div {
            border-radius: 15px;
            box-shadow: 0 10px 10px rgba(90, 116, 148, 0.3);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 315px;
            padding: 30px;
        }

        /* Parte delantera tarjeta */
        .card .front-card {
            background: url('https://firebasestorage.googleapis.com/v0/b/fire-fotos-8e3f9.appspot.com/o/img%2Fbg-tarjeta-01.jpg?alt=media&token=73e17b4c-192d-449b-9be7-f9f045b57880') #000000 0 0 / cover no-repeat scroll;
            width: 100%;
        }

        .card .front-card .logo-card {
            height: 50px;
            text-align: right;
        }

        .card .front-card .logo-card img {
            height: 100%;
            max-width: 100px;
            object-fit: cover;
            width: 100%;
        }

        .card .front-card .chip {
            margin-bottom: 20px;
            max-width: 50px;
            width: 100%;
        }

        .card .front-card .info-card-front .label-card {
            color: #7d8994;
            font-size: 1rem;
            margin-bottom: 5px;
        }

        .card .front-card .info-card-front .group-number-card .number-card,
        .card .front-card .info-card-front .group-name-card .name-card,
        .card .front-card .info-card-front .group-expiration-card, .expiration-card {
            color: #ffffff;
            font-size: 22px;
            text-transform: uppercase;
        }

        .card .front-card .info-card-front .flexbox {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        /* Parte trasera tarjeta */
        .card .back-card {
            backface-visibility: hidden;
            background: url('https://firebasestorage.googleapis.com/v0/b/fire-fotos-8e3f9.appspot.com/o/img%2Fbg-tarjeta-03.jpg?alt=media&token=73e17b4c-192d-449b-9be7-f9f045b57880') #1c1c1c 0 0 / cover no-repeat scroll;
            position: absolute;
            top: 0;
            transform: rotateY(180deg);
            left: 0;
            width: 100%;
        }

        .card .back-card .magnetic-bar-card {
            background-color: #000000;
            height: 40px;
            left: 0;
            position: absolute;
            top: 30px;
            width: 100%;
        }

        .card .back-card .info-card-back {
            display: flex;
            justify-content: space-between;
            margin-top: 60px;
        }

        .card .back-card .info-card-back p {
            margin-bottom: 5px;
        }

        .card .back-card .info-card-back .group-firm-card {
            width: 70%;
        }

        .card .back-card .info-card-back .group-firm-card .firm-card {
            background-image: repeating-linear-gradient(
                    #87ceeb 0,
                    #87ceeb 5px,
                    #ffa500 5px,
                    #ffa500 10px
            );
            height: 40px;
        }

        .card .back-card .info-card-back .group-firm-card .firm-card p {
            color: #000000;
            font: normal 30px 'Liu Jian Mao Cao', cursive;
            line-height: 40px;
            padding: 0 10px;
            text-transform: capitalize;
        }

        .card .back-card .info-card-back .group-ccv-card {
            width: 20%;
        }

        .card .back-card .info-card-back .group-ccv-card .ccv-card {
            background-color: #ffffff;
            color: #000000;
            height: 40px;
            padding: 10px;
            text-align: center;
        }

        .card .back-card .legend-card {
            font-size: 14px;
            line-height: 24px;
        }

        .container .card .back-card .link-bank-card {
            color: #ffffff;
            font-size: 14px;
            text-decoration: none;
        }

        /*  Contenedor botón abrir formulario */
        .ctn-btn .btn-open-form-card {
            background-color: #2364d2;
            border-radius: 100%;
            border-style: none;
            bottom: 25px;
            box-shadow: 5px 4px 8px rgba(24, 56, 182, 0.4);
            color: #ffffff;
            cursor: pointer;
            font-size: 20px;
            height: 50px;
            line-height: 20px;
            padding: 5px;
            position: relative;
            transition: background-color 0.3s ease-in-out,
            transform 0.3s ease-in-out;
            width: 50px;
            z-index: 4;
        }

        .ctn-btn .btn-open-form-card:hover,
        .ctn-btn .btn-open-form-card:focus,
        .ctn-btn .btn-open-form-card:active {
            background-color: #1850b1;
        }

        .ctn-btn .btn-open-form-card.active {
            transform: rotateZ(45deg);
        }

        /* Formulario Tarjeta */
        .form-card {
            background-color: #ffffff;
            border-radius: 10px;
            bottom: 150px;
            clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
            padding: 150px 30px 30px 30px;
            max-width: 700px;
            position: relative;
            transition: clip-path 0.3s ease-in-out;
            width: 100%;
            z-index: 2;
        }

        .form-card.active {
            clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
        }

        .form-card label {
            color: #7d8994;
            display: block;
            font-size: 1rem;
            margin-bottom: 5px;
        }

        .form-card input,
        .form-card select,
        .form-card .btn-send-form-card {
            border: 2px solid #ced6e0;
            border-radius: 5px;
            font-size: 18px;
            height: 50px;
            padding: 5px 12px;
            transition: border-color 0.3s ease-in-out,
            box-shadow 0.3s ease-in-out,
            outline 0.3s ease-in-out;
            width: 100%;
        }

        .form-card input {
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .form-card select {
            appearance: none;
        }

        .form-card input:hover,
        .form-card input:active,
        .form-card select:hover,
        .form-card select:active {
            border-color: #93bded;
        }

        .form-card input:focus,
        .form-card select:focus {
            box-shadow: 1px 7px 10px -5px rgba(90, 116, 148, 0.3);
            outline: #000000;
        }

        .form-card .flexbox {
            display: flex;
            justify-content: space-between;
        }

        .form-card .flexbox .group-expiration-card-form {
            width: 100%;
        }

        .form-card .flexbox .group-expiration-card-form .group-select {
            margin-right: 1rem;
            position: relative;
            width: 100%;
        }

        .form-card .flexbox .group-expiration-card-form .group-select i {
            color: #ced6e0;
            position: absolute;
            right: 1rem;
            top: 18px;
            transition: color 0.3s ease;
        }

        .form-card .flexbox .group-expiration-card-form .group-select:hover i,
        .form-card .flexbox .group-expiration-card-form .group-select:focus i,
        .form-card .flexbox .group-expiration-card-form .group-select:active i {
            color: #93bfed;
        }

        .form-card .flexbox .group-ccv-card-form {
            min-width: 100px;
        }

        .form-card .btn-send-form-card {
            background-color: #2364d2;
            box-shadow: 2px 2px 10px rgba(0, 85, 212, 0.4);
            border-style: none;
            color: #ffffff;
            cursor: pointer;
            font-size: 22px;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        .form-card .btn-send-form-card:hover,
        .form-card .btn-send-form-card:focus,
        .form-card .btn-send-form-card:active {
            background-color: #1850b1;
        }

        @media screen and (max-width: 550px) {
            .card > div {
                min-height: 200px;
                padding: 15px 15px;
            }

            .card .front-card .logo-card {
                position: absolute;
                right: 10px;
            }

            .card .front-card .logo-card img {
                max-width: 75px
            }

            .card .front-card .chip {
                max-width: 35px;
                margin-top: 10px;
            }

            .card .front-card .info-card-front .label-card {
                font-size: 14px;
            }

            .card .front-card .info-card-front .group-number-card .number-card,
            .card .front-card .info-card-front .group-name-card .name-card,
            .card .front-card .info-card-front .group-expiration-card,
            .expiration-card {
                font-size: 18px;
            }

            .card .back-card .legend-card,
            .container .card .back-card .link-bank-card {
                font-size: 10px;
            }

            .card .back-card .magnetic-bar-card {
                height: 30px;
                top: 15px;
            }

            .card .back-card .info-card-back {
                margin-top: 40px;
            }

            .card .back-card .info-card-back .group-firm-card .firm-card p {
                line-height: 40px;
            }

            .card .back-card .info-card-back p {
                font-size: 13px;
            }

            .form-card .flexbox {
                flex-direction: column;
            }

            .form-card select {
                margin-bottom: 1rem;
            }
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
    <div class="container">
        <!-- Tarjeta -->
        <section id="card" class="card">
            <div class="front-card">
                <div id="logo-card" class="logo-card"></div>
                <img src="https://firebasestorage.googleapis.com/v0/b/fire-fotos-8e3f9.appspot.com/o/img%2Fchip-tarjeta.png?alt=media&token=489dc6be-d75d-47db-b544-e7020041cc90"
                     alt="Chip" title="Chip" class="chip">

                <div class="info-card-front">
                    <div id="group-number-card" class="group-number-card">
                        <p class="label-card">
                            Номер карты
                        </p>

                        <p class="number-card">
                            #### #### #### ####
                        </p>
                    </div>

                    <div class="flexbox">
                        <div id="group-name-card" class="group-name-card">
                            <p class="label-card">
                                Номер карты
                            </p>

                            <p class="name-card">
                                -------
                            </p>
                        </div>

                        <div id="group-expiration-card" class="group-expiration-card">
                            <p class="label-card">
                                Срок действия
                            </p>

                            <p class="expiration-card">
							<span class="mounth-expiration-card">
								ММ
							</span>
                                /
                                <span class="year-expiration-card">
								ГГ
							</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="back-card">
                <div class="magnetic-bar-card"></div>

                <div class="info-card-back">
                    <div id="group-firm-card" class="group-firm-card">
                        <p class="label-card">
                            Роспись
                        </p>

                        <div class="firm-card">
                            <p>
                                -------
                            </p>
                        </div>
                    </div>

                    <div id="group-ccv-card" class="group-ccv-card">
                        <p class="label-card">
                            CCV
                        </p>

                        <p class="ccv-card"></p>
                    </div>
                </div>

                <p class="legend-card">
                    Круглосуточная сервисная служба: +375 (17) 299 25 25
                </p>

                <a class="link-bank-card" href="javascript:void(0);">
                    www.BelarusBank.by
                </a>
            </div>
        </section>


        <div class="ctn-btn">
            <button type="button" id="btn-open-form-card" class="btn-open-form-card">
                <i class="fas fa-plus"></i>
            </button>
        </div>

        <form action="/user/add/balance" method="post" id="form-card" class="form-card active">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div>
                <label for="number-card-form">
                    Номер карты
                </label>

                <input type="text" id="number-card-form" maxlength="19" autocomplete="off">
            </div>

            <div>
                <label for="name-card-form">
                    Владелец
                </label>

                <input type="text" id="name-card-form" maxlength="20" autocomplete="off">
            </div>

            <div class="flexbox">
                <div class="group-expiration-card-form">
                    <label for="mounth-expiration-card-form">
                        Срок действия
                    </label>

                    <div class="flexbox">
                        <div class="group-select">
                            <select id="mounth-expiration-card-form">
                                <option disabled="disabled" selected="selected">
                                    Мес
                                </option>
                            </select>
                            <i class="fas fa-angle-down"></i>
                        </div>

                        <div class="group-select">
                            <select id="year-expiration-card-form">
                                <option disabled="disabled" selected="selected">
                                    Год
                                </option>
                            </select>
                            <i class="fas fa-angle-down"></i>
                        </div>
                    </div>
                </div>

                <div class="group-ccv-card-form">
                    <label for="ccv-card-form">
                        CCV
                    </label>

                    <input type="text" id="ccv-card-form" maxlength="3" autocomplete="off">
                </div>


            </div>


            <label for="name-card-form">
                Сумма пополнения
            </label>

            <input type="number" id="name-card-form" name="money" min="0" autocomplete="off">


            <button type="submit" class="btn-send-form-card">
                Пополнить
            </button>
        </form>
    </div>
</div>

    <script>

        const card = document.querySelector('#card');
        const logoCard = document.getElementById('logo-card');
        const numberCard = document.querySelector('#card .number-card');
        const nameCard = document.querySelector('#card .name-card');
        const mounthExpirationCard = document.querySelector('#card .mounth-expiration-card');
        const yearExpirationCard = document.querySelector('#card .year-expiration-card');
        const firmCard = document.querySelector('#card .firm-card p');
        const ccvCard = document.querySelector('#card .ccv-card');


        const btnOpenForm = document.getElementById('btn-open-form-card');
        const formCard = document.getElementById('form-card');
        const numberCardForm = document.getElementById('number-card-form');
        const nameCardForm = document.getElementById('name-card-form');
        const selectMounthCardForm = document.getElementById('mounth-expiration-card-form');
        const selectYearCardForm = document.getElementById('year-expiration-card-form');
        const ccvCardForm = document.getElementById('ccv-card-form');

        const showFrontCard = () => {
            if (card.classList.contains('active')) {
                card.classList.remove('active');
            }
        }


        card.addEventListener('click', () => {
            card.classList.toggle('active');
        });


        btnOpenForm.addEventListener('click', () => {
            btnOpenForm.classList.toggle('active');
            formCard.classList.toggle('active');
        });

        for (let i = 1; i <= 12; i++) {
            let option = document.createElement('option');
            option.value = i;
            option.innerText = i;
            selectMounthCardForm.appendChild(option);
        }


        let currentYear = new Date().getFullYear();

        for (let i = currentYear; i <= currentYear + 8; i++) {
            let option = document.createElement('option');
            option.value = i;
            option.innerText = i;
            selectYearCardForm.appendChild(option);
        }


        numberCardForm.addEventListener('keyup', e => {
            let valueNumberCardForm = e.target.value
                .replace(/\s/g, '')

                .replace(/\D/g, '')

                .replace(/([0-9]{4})/g, '$1 ')
                .trim();
            numberCardForm.value = valueNumberCardForm;

            numberCard.textContent = valueNumberCardForm;

            if (valueNumberCardForm === '') {
                numberCard.textContent = '#### #### #### ####';
                logoCard.innerHTML = '';
            }

            if (valueNumberCardForm[0] === '4') {
                logoCard.innerHTML = '';
                let imgLogo = document.createElement('img');
                imgLogo.src = 'https://firebasestorage.googleapis.com/v0/b/fire-fotos-8e3f9.appspot.com/o/img%2Fvisa.png?alt=media&token=d1324d01-81f6-42d4-a37c-1edc19e1e0b1';
                logoCard.appendChild(imgLogo);
            } else if (valueNumberCardForm[0] === '5') {
                logoCard.innerHTML = '';
                let imgLogo = document.createElement('img');
                imgLogo.src = 'https://firebasestorage.googleapis.com/v0/b/fire-fotos-8e3f9.appspot.com/o/img%2Fmastercard.png?alt=media&token=1a5347d2-a282-436f-87a8-f193458830f4';
                logoCard.appendChild(imgLogo);
            }


            showFrontCard();

        });


        nameCardForm.addEventListener('keyup', e => {
            let valueNameCardForm = e.target.value.replace(/[0-9]/g, '');

            nameCardForm.value = valueNameCardForm;
            nameCard.textContent = valueNameCardForm;
            firmCard.textContent = valueNameCardForm;

            if (valueNameCardForm === '') {
                nameCard.textContent = 'John Doe';
            }

            showFrontCard();
        });

        // Select mes
        selectMounthCardForm.addEventListener('change', e => {
            mounthExpirationCard.textContent = e.target.value;
            showFrontCard();
        });


        // Select año
        selectYearCardForm.addEventListener('change', e => {
            yearExpirationCard.textContent = e.target.value.slice(2);
            showFrontCard();
        });

        // Ccv
        ccvCardForm.addEventListener('keyup', e => {
            if (!card.classList.contains('active')) {
                card.classList.add('active');
            }

            ccvCardForm.value = ccvCardForm.value

                .replace(/\s/g, '')

                .replace(/\D/g, '');

            ccvCard.textContent = ccvCardForm.value;
        });</script>
</body>
</html>