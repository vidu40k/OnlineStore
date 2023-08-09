<!DOCTYPE html>
<html lang="ru">
<head>

    <meta charset="UTF-8">
    <title>Rc-design</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="../static/styles/header_footer.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
          crossorigin="anonymous">
    <style>
        body {
            background-color: #a5afae;
            margin: 0;
            overflow: hidden;
        }

        a{
            color: #181818;
            text-decoration: none;
        }
        .check {
            position: relative;

            background-color: white;
            width: 970px;
            height: 370px;
            border: 5px solid white;
        }

        .border {
            width: 100%;
            height: 100%;
            overflow: auto;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            border: 2px solid black;
        }

        .container {
            background-color: #d9fad1;
            overflow: hidden;
            margin: 3px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            border: 1px solid black;
        }


        @import url(https://fonts.googleapis.com/css?family=Damion);
        @import url(https://fonts.googleapis.com/css?family=Mrs+Saint+Delafield);

        /* pattern from subtlepatterns.com */
        /* https://subtlepatterns.com/patterns/sneaker_mesh_fabric.png */

        /* font-family: 'Damion', cursive; */

        * {
            box-sizing: border-box;
            font-family: Helvetica;

        }

        .one {
            width: 100%;
        }

        .title {
            width: 300px;
            text-align: center;
            font-family: Helvetica;
            display: inline-block;
            margin-left: 25px;
            margin-bottom: 40px;


        }

        #bold {
            font-weight: bold;
            font size: 24px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            line-height: 150%;

        }


        .name {
            text-transform: uppercase;
            font-size: 11px;
            letter-spacing: 0.1px;
        }

        .number {
            font-family: "Courier New";
            font-weight: bold;
            margin-top: 20px;
            font-size: 20px;
            margin-left: 103px;
            display: inline-block;
            position: fixed;
            letter-spacing: 1px;


        }

        .following {
            display: inline-block;
            font-family: Helvetica;
            font-size: 10px;
            text-transform: uppercase;
            border: 1px solid;
            width: 417px;
            margin-left: 16px;
            margin-top: 10px;
            border-collapse: collapse;
        }

        .line {
            text-align: center;
            width: 415px;
            height: 26px;
            font-size: 8px;
            padding: 12;;

        }

        .empty {
            border-top: 1px solid;


        }

        input {
            font-family: Helvetica;
            color: #333;
            background-color: #d9fad1;
            text-align: center;
            border: none;
            width: auto;
            text-transform: uppercase;
        }

        input[name="reason"], input[name="reason2"] {
            width: 400px;
        }

        .two {
            width: 100%;
            margin-top: 16px;

        }

        .orderof {
            font-family: 'Damion', cursive;
            font-size: 1.5em;
            border-bottom: 1px solid #333;
            float: left;
            width: 75.9%;
            position: relative;
            padding-top: 0;
            padding: 0 0 0 1em;
            margin: 0px 0 2px 2em;
            line-height: 1;
            height: 32px;
            border-right: 1px solid #333;
        }

        .orderof:before {
            font-family: Helvetica;
            font-size: 0.5em;
            content: 'PAY';
            position: absolute;
            left: -3em;
            top: 1.3em;

        }

        input[name="amount"] {
            width: 300px;
            display: inline-table;
            height: 20px;
            font-size: 18px;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            position: fixed;
            top: 158px;
            text-align: left;
        }

        .bd {
            text-align: right;
            text-transform: uppercase;
            font-family: Helvetica;
            font-size: 20px;
            letter-spacing: 8px;
        }

        .dollar {
            text-align: right;
            text-transform: uppercase;
            font-family: Helvetica;
            font-size: 0.5em;
            margin-left: 298px;
            position: fixed;
            top: 162px;
        }


        .info {
            border-collapse: collapse;
            margin-left: 11px;
            text-align: center;
            text-transform: uppercase;
            font-family: Helvetica;
            font-size: 10px;
            border: 1px solid #333;
            display: inline-table;
            width: 80%;
        }

        input[name="date"] {
            font-size: 13px;
            width: 56px;
        }

        input[name="name"] {
            width: 200px;
            font-size: 17px;
        }

        input[name="num"] {
            width: 50px;
            font-size: 13px;
        }

        input[name="description"] {
            width: 200px;
            font-size: 14px;
        }

        input[name="discount"] {
            width: 50px;
            font-size: 13px;
        }

        .row {

        }

        .chart {
            border: 1px solid #333;
            font-weight: normal;
        }

        #discount {
            border-left: 1px dashed;

        }

        .blank {
            height: 40px;
            border: 1px solid #333;
            font-size: 14px;

        }

        .short {
            width: 79px;
        }

        .long {
            width: 300px;
            font-size: 18px;
        }

        .des {
            font-size: 15px;
        }

        .amount {
            text-align: center;
            width: 144px;
            text-align: center;
            text-transform: uppercase;
            font-family: Helvetica;
            font-size: 11px;
            margin-right: 30px;
            float: right;
            display: inline;
            position: absolute;
            right: -7px;
            top: 144px;

        }

        .sign {
            font-family: Helvetica;
            font-size: 15px;
            padding-right: 10px;
            position: fixed;
            display: inline;
            right: 620px;
            top: 209px;
        }

        p {
            text-transform: uppercase;
            font-family: Helvetica;
            font-size: 11px;
            letter-spacing: 0.5px;
            display: inline;
            padding-left: 25px;
            text-align: center;
        }

        .box {

            border: 1px solid #333;
            width: 120px;
            height: 30px;
            float: right;
            clear: both;
            margin-top: 20px;
        }

        .whole {
            border-right: 1px dashed #333;
            height: 28px;
            width: 84px;
            margin-top: 0.7px;
        }

        input[name="whole"] {
            text-align: right;
            width: 72px;
            right: 544px;
            top: 204px;
            font-size: 18px;;
        }

        input[name="cent"] {
            text-align: right;
            width: 23px;
            display: inline;
            font-size: 18px;
            position: absolute;
            margin-left: 12px;;
        }

        .cent {

        }

        .num {
            font-family: 'Damion', cursive;
            font-size: 1.5em;
            float: left;
            border: 2px solid #aaa;
            position: relative;
            margin: 0 0 0 2em;
            padding: 0 0.5em;
            line-height: 0.9em;
        }

        .num:before {
            font-family: Helvetica;
            content: '$';
            font-weight: bold;
            position: absolute;
            left: 1em;
        }

        .dollars {
            font-family: 'Damion', cursive;
            font-size: 1.5em;
            border-bottom: 1px solid #666;
            width: 84%;
            float: left;
            padding: 0 0 0 4em;
            position: relative;
        }

        .dollars:after {
            font-family: Helvetica;
            font-size: 0.5em;
            content: 'DOLLARS';
            position: absolute;
            right: -5em;
            top: 1.7em;
        }

        .add {
            width: 267px;
            margin-left: 80px;
            margin-top: 5px;

        }

        .lines {
            border-bottom: 1px solid #333;
            height: 25px;
            font-size: 13px;
            text-align: center;
            padding: 0;
            margin: 0;

        }

        input[name="address"], input[name="citystate"] {
            font-size: 13px;
            width: 260px;
            text-transform: uppercase;
            padding: 0;
            margin: 0;

        }

        .bank {
            font-size: 9px;
            text-align: center;
            font-family: Helvetica;
            height: 25px;
            padding-top: 10px;
            letter-spacing: 0.5px;
        }

        .signature {
            margin: 0 10px 30px 0.7em;
            width: 40%;
            padding-bottom: -13px;
            right: 10;
            float: right;;
        }

        .sig {
            font-family: 'Mrs Saint Delafield', cursive;
            font-size: 2em;

            border-bottom: 1px solid #333;
            line-height: 0.9em;

        }

        .mp {
            text-align: right;
            font-size: 8px;
            font-weight: bold;
            letter-spacing: -8;
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


<!-- partial:index.partial.html -->
<div class="content">

    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">${order.customer.name}!</h4>
        Ваш заказ оплачен!
    </div>
<div style="height: 0;overflow: hidden">
    <div id="content" >
        <h5> Shop: Rc-store </h5>
        <h5> Customer: ${order.customer.name} <br>${order.customer.email} <br>${order.customer.phone} </h5>
        <#list order.cars as car>
            <h5> Items
                <h6> ${car.car.name} - #${car.quantity}</h6><br>
            </h5>
        </#list>

        <h5> Date :${order.orderDate}</h5><br>
        <h5> Total price: ${order.totalPrice}$</h5><br>

    </div>
</div >
    <div id="editor"></div>
    <button type="button" class="btn btn-info" id="cmd"><a href="/products"><h5> Скачать чек </h5></a></button>
    <button type="button" class="btn btn-success"><a href="/products"><h5> Продолжить без чека </h5></a></button>

</div>

<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

<script>
    var doc = new jsPDF();
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#cmd').click(function () {
        doc.fromHTML($('#content').html(), 15, 15, {
            'width': 170,
            'elementHandlers': specialElementHandlers
        });
        doc.save('sample-file.pdf');
    });
</script>

</body>
</html>
