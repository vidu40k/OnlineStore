<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CodePen - Only CSS3 Dropdown Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="./styles/role_choice_page_style.css">
    <style>
        @import url("https://fonts.googleapis.com/css?family=Lato:300,400,700,900");
        @import url(https://fonts.googleapis.com/css?family=Pacifico);
        body {
            font-family:  Helvetica, Arial;
            font-size: 16px;
        }

        *, *:before, *:after {
            -webkit-border-sizing: border-box;
            -moz-border-sizing: border-box;
            -border-sizing: border-box;
        }

        .container {
            width: 350px;
            margin: 50px auto;
        }
        .container > ul {
            list-style: none;
            padding: 0;
            margin: 0 0 20px 0;
        }

        .title {
            font-family: 'Tahoma';
            font-weight: normal;
            font-size: 40px;
            text-align: center;
            line-height: 1.4;
            color: #181818;
        }

        .dropdown {
            position: relative;
        }
        .dropdown a {
            text-decoration: none;
        }
        .dropdown [data-toggle="dropdown"] {
            display: block;
            color: white;
            background: #2e2e2e;
            -moz-box-shadow: 0 1px 0 #2e2e2e inset, 0 -1px 0 #2e2e2e inset;
            -webkit-box-shadow: 0 1px 0 #2e2e2e inset, 0 -1px 0 #2e2e2e inset;
            box-shadow: 0 1px 0 #2e2e2e inset, 0 -1px 0 #2e2e2e inset;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.3);
            padding: 10px;
        }
        .dropdown [data-toggle="dropdown"]:hover {
            background: #2e2e2e;
        }
        .dropdown [data-toggle="dropdown"]:before {
            position: absolute;
            display: block;
            content: '\25BC';
            font-size: 0.7em;
            color: #fff;
            top: 13px;
            right: 10px;
            -moz-transform: rotate(0deg);
            -ms-transform: rotate(0deg);
            -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
            -moz-transition: -moz-transform 0.6s;
            -o-transition: -o-transform 0.6s;
            -webkit-transition: -webkit-transform 0.6s;
            transition: transform 0.6s;
        }
        .dropdown > .dropdown-menu {
            max-height: 0;
            overflow: hidden;
            list-style: none;
            padding: 0;
            margin: 0;
            -moz-transform: scaleY(0);
            -ms-transform: scaleY(0);
            -webkit-transform: scaleY(0);
            transform: scaleY(0);
            -moz-transform-origin: 50% 0%;
            -ms-transform-origin: 50% 0%;
            -webkit-transform-origin: 50% 0%;
            transform-origin: 50% 0%;
            -moz-transition: max-height 0.6s ease-out;
            -o-transition: max-height 0.6s ease-out;
            -webkit-transition: max-height 0.6s ease-out;
            transition: max-height 0.6s ease-out;
            animation: hideAnimation 0.4s ease-out;
            -moz-animation: hideAnimation 0.4s ease-out;
            -webkit-animation: hideAnimation 0.4s ease-out;
        }
        .dropdown > .dropdown-menu li {
            padding: 0;
        }
        .dropdown > .dropdown-menu li a {
            display: block;
            color: #6f6f6f;
            background: #EEE;
            -moz-box-shadow: 0 1px 0 white inset, 0 -1px 0 #d5d5d5 inset;
            -webkit-box-shadow: 0 1px 0 white inset, 0 -1px 0 #d5d5d5 inset;
            box-shadow: 0 1px 0 white inset, 0 -1px 0 #d5d5d5 inset;
            text-shadow: 0 -1px 0 rgba(255, 255, 255, 0.3);
            padding: 10px 10px;
        }
        .dropdown > .dropdown-menu li a:hover {
            background: #f6f6f6;
        }
        .dropdown > input[type="checkbox"] {
            opacity: 0;
            display: block;
            position: absolute;
            top: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }
        .dropdown > input[type="checkbox"]:checked ~ .dropdown-menu {
            max-height: 9999px;
            display: block;
            -moz-transform: scaleY(1);
            -ms-transform: scaleY(1);
            -webkit-transform: scaleY(1);
            transform: scaleY(1);
            animation: showAnimation 0.5s ease-in-out;
            -moz-animation: showAnimation 0.5s ease-in-out;
            -webkit-animation: showAnimation 0.5s ease-in-out;
            -moz-transition: max-height 2s ease-in-out;
            -o-transition: max-height 2s ease-in-out;
            -webkit-transition: max-height 2s ease-in-out;
            transition: max-height 2s ease-in-out;
        }
        .dropdown > input[type="checkbox"]:checked + a[data-toggle="dropdown"]:before {
            -moz-transform: rotate(-180deg);
            -ms-transform: rotate(-180deg);
            -webkit-transform: rotate(-180deg);
            transform: rotate(-180deg);
            -moz-transition: -moz-transform 0.6s;
            -o-transition: -o-transform 0.6s;
            -webkit-transition: -webkit-transform 0.6s;
            transition: transform 0.6s;
        }


    </style>
</head>
<body>

<div class="container">
    <h1 class="title">Продолжить как</h1>
    <ul>
        <li class="dropdown">

            <a href="/products" data-toggle="dropdown">Пользователь </a>

        </li>
        <li class="dropdown">

            <a href="/manager/view" data-toggle="dropdown">Менеджер </a>

        </li>
        <li class="dropdown">

            <a href="/admin/users" data-toggle="dropdown">Администратор </a>

        </li>
    </ul>
</div>


</body>
</html>
