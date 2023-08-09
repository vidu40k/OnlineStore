<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<link rel="stylesheet" href="../static/styles/registr.css">-->
<#--<head>-->
<#--    <title>Rc-Store</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1></h1><hr>-->
<#--<h4>Авторизация</h4>-->
<#--<form action="/login" method="post">-->





<#--&lt;#&ndash;    Эл. почта: <input type="email" name="username"><br><br>&ndash;&gt;-->
<#--&lt;#&ndash;    Пароль: <input type="password" name="password"><br><br>&ndash;&gt;-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Вход"/>-->
<#--</form>-->

<#--<a href="/auth/registration">Зарегистрироваться</a>-->
<#--</body>-->
<#--</html>-->


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Rc-design</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../static/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../static/styles/util.css">
    <link rel="stylesheet" type="text/css" href="../static/styles/main.css">
    <!--===============================================================================================-->
</head>
<body>
<#--<form action="/login" method="post">-->

<#--    Эл. почта: <input type="email" name="username"><br><br>-->
<#--    &lt;#&ndash;    Пароль: <input type="password" name="password"><br><br>&ndash;&gt;-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Вход"/>-->

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="/login" method="post" class="login100-form validate-form p-l-55 p-r-55 p-t-178">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <span class="login100-form-title">
                       Аутентификация
					</span>

                <#if errorMsg?? >
                    <div class="alert alert-danger" role="alert">
                         ${errorMsg}
                    </div>
                </#if>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                    <input class="input100" type="email" name="username" placeholder="Email">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Please enter password">
                    <input class="input100" type="password" name="password" placeholder="Пароль">
                    <span class="focus-input100"></span>
                </div>

                <#--                <div class="text-right p-t-13 p-b-23">-->
                <#--						<span class="txt1">-->
                <#--							Forgot-->
                <#--						</span>-->

                <#--                    <a href="#" class="txt2">-->
                <#--                        Username / Password?-->
                <#--                    </a>-->
                <#--                </div>-->

                <div class="container-login100-form-btn">
                    <button type="submit" class="login100-form-btn">
                        Войти
                    </button>
                </div>

                <div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							Еще нет аккаунта?
						</span>

                    <a href="/auth/registration" class="txt3">
                        Зарегистрируйся сейчас
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script src="../static/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="../static/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="../static/vendor/bootstrap/js/popper.js"></script>
<script src="../static/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="../static/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="../static/vendor/daterangepicker/moment.min.js"></script>
<script src="../static/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="../static/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="../static/scripts/main.js"></script>

</body>
</html>