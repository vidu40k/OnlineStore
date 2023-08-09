<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rc-design</title>
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto|Varela+Round'>
    <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
    <link rel="stylesheet" href="../static/styles/admin_style.css">
    <link rel="stylesheet" href="../static/styles/header_footer.css">

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
<div class=" t_container">
    <div class="table-wrapper">
        <#--        <div class="table-title">-->
        <#--            <div class="row">-->
        <#--                <div class="col-sm-6">-->
        <#--                    <h2>Управление <b>Пользователями</b></h2>-->
        <#--                </div>-->
        <#--                <div class="col-sm-6">-->
        <#--                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i>-->
        <#--                        <span>Добавить </span></a>-->
        <#--                    <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i>-->
        <#--                        <span>Delete</span></a>-->
        <#--                </div>-->
        <#--            </div>-->
        <#--        </div>-->
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>
            <span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
                </th>
                <th>Имя</th>
                <th>Email</th>
                <th>Адрес</th>
                <th>Телефон</th>
                <th>Возможности</th>
                <th></th>
            </tr>
            </thead>
            <tbody>

            <#list users as us>

                <tr>
                    <td>
                    <span class="custom-checkbox">
                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                        <label for="checkbox1"></label>
                    </span>
                    </td>
                    <td>${us.name}</td>
                    <td>${us.email}</td>
                    <td>${us.address}</td>
                    <td>${us.phone}</td>
                    <td>
                        <#list us.roles as role>
                            ${role}<br>
                        </#list>
                    </td>
                    <td>

                        <a href="#editEmployeeModal${us.id}" class="edit" data-toggle="modal"> <i class="material-icons"
                                                                                                  data-toggle="tooltip "
                                                                                                  title="Edit">&#xE254;</i></a>
                        <div id="editEmployeeModal${us.id}" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="/admin/user/edit" method="post">
                                        <input type="hidden" name="user_id" value="${us.id}">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Редактирование пользователя</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label>Имя</label>
                                                <input type="text" class="form-control" name="name" value="${us.name}"
                                                       required>
                                            </div>
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="email" class="form-control" name="email"
                                                       value="${us.email}" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Адрес</label>
                                                <textarea class="form-control" name="address" required> ${us.address}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Номер</label>
                                                <input type="text" class="form-control" name="phone" value="${us.phone}" required>
                                            </div>
                                            <div class="form-group">
                                                <select name="roles"  multiple>
                                                    <option value="user">user</option>
                                                    <option value="manager"
                                                            <#list us.roles as role >

                                                                <#if us.isManager() >
                                                                    selected
                                                                </#if>

                                                            </#list>
                                                    >manager
                                                    </option>
                                                    <option value="admin"
                                                            <#list us.roles as role >
                                                                <#if us.isAdmin() >
                                                                    selected
                                                                </#if>
                                                            </#list>

                                                    >admin
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal"
                                                   value="Отмена">
                                            <input type="submit" class="btn btn-info" value="Сохранить">
                                        </div>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <#--                            <input type="hidden" name="_csrf" value="${_csrf.token}">-->
                        <#--                        </form>-->

                        <form action="/admin/user/delete/${us.id}" method="post">
                            <button type="submit" style="border: none; color: red"><i class="material-icons"
                                                                                      data-toggle="tooltip"
                                                                                      title="Delete">&#xE872;</i>
                            </button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>
                    </td>
                </tr>

            </#list>

            </tbody>
        </table>

    </div>
</div>
<!-- Edit Modal HTML -->
<#--<div id="addEmployeeModal" class="modal fade">-->
<#--    <div class="modal-dialog">-->
<#--        <div class="modal-content">-->
<#--            <form>-->
<#--                <div class="modal-header">-->
<#--                    <h4 class="modal-title">Add Employee</h4>-->
<#--                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
<#--                </div>-->
<#--                <div class="modal-body">-->
<#--                    <div class="form-group">-->
<#--                        <label>Имя</label>-->
<#--                        <input type="text" class="form-control" required>-->
<#--                    </div>-->
<#--                    <div class="form-group">-->
<#--                        <label>Email</label>-->
<#--                        <input type="email" class="form-control" required>-->
<#--                    </div>-->
<#--                    <div class="form-group">-->
<#--                        <label>Адрес</label>-->
<#--                        <textarea class="form-control" required></textarea>-->
<#--                    </div>-->
<#--                    <div class="form-group">-->
<#--                        <label>Телефон</label>-->
<#--                        <input type="text" class="form-control" required>-->
<#--                    </div>-->
<#--                </div>-->
<#--                <div class="modal-footer">-->
<#--                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Отменить">-->
<#--                    <input type="submit" class="btn btn-success" value="Добавить">-->
<#--                </div>-->
<#--            </form>-->
<#--        </div>-->
<#--    </div>-->
<#--</div>-->
<!-- Edit Modal HTML -->

<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Delete Employee</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
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

<!-- partial -->
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>
<script src="../static/scripts/admin_script.js"></script>
<script>


    $(document).ready(function (us) {
        // Activate tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Select/Deselect checkboxes
        var checkbox = $('table tbody input[type="checkbox"]');
        $("#selectAll").click(function () {
            if (this.checked) {
                checkbox.each(function () {
                    this.checked = true;
                });
            } else {
                checkbox.each(function () {
                    this.checked = false;
                });
            }
        });
        checkbox.click(function () {
            if (!this.checked) {
                $("#selectAll").prop("checked", false);
            }
        });
    });
</script>
</body>
</html>
