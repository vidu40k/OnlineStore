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

        body {
            width: auto;
            max-width: 1400px;
            margin: auto;
        }

        td:last-child {
            text-align: center;
        }

        .td-inner {
            height: 100%;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            justify-content: center;
        }
.name{}
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
            <th><h3>Фото</h3></th>
            <th><h3>Название</h3></th>
            <th><h3>Цена</h3></th>
            <th><h3>Бренд</h3></th>
            <th><h3>Тип</h3></th>
            <th style="text-align:center;width:100px;">Добавить продукт
                <h3>
                <a href="/manager/product/add">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </a>
                </h3>
            </th>
        </tr>
        </thead>
        <tbody>


        <#list cars as car>

            <tr>
                <td class="tdImg" style="width: 200px; height: 200px">
                    <div ><img class="miniImg"
                                                                    style="max-width: 200px; max-height: 200px;"
                                                                    src="../static/images/${car.imageUrl}"
                                                                    alt="Фото товара"></div>
                </td>
                <td >
                    <h3 > ${car.name}</h3>
                </td>
                <td>
                    <h3>${car.price}$</h3>
                </td>
                <td>
                    <h3>${car.brand.name}</h3>
                </td>
                <td>
                    <h3 >${car.type.name}</h3>
                </td>
                <td>
                    <div style="display: flex; align-items: center">
                        <form action="/manager/product/edit/${car.id}" method="post">
                            <button type="submit" style="margin-right:16px; border:none; color: #181818">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>

                        <form action="/manager/product/delete/${car.id}" method="post">
                            <button type="submit" style="margin-right:16px; color: #181818; border: none">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>
                    </div>
                </td>
            </tr>

        </#list>


        </tbody>
    </table>
</div>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Row information</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
<script>
    $(document).ready(function () {

        //Add row button
        $('.dt-add').each(function () {
            $(this).on('click', function (evt) {
                //Create some data and insert it
                var rowData = [];
                var table = $('#example').DataTable();
                //Store next row number in array
                var info = table.page.info();
                rowData.push(info.recordsTotal + 1);
                //Some description
                rowData.push('New Order');
                //Random date
                var date1 = new Date(2016, 0o1, 0o1);
                var date2 = new Date(2018, 12, 31);
                var rndDate = new Date(+date1 + Math.random() * (date2 - date1));//.toLocaleDateString();
                rowData.push(rndDate.getFullYear() + '/' + (rndDate.getMonth() + 1) + '/' + rndDate.getDate());
                //Status column
                rowData.push('NEW');
                //Amount column
                rowData.push(Math.floor(Math.random() * 2000) + 1);
                //Inserting the buttons ???
                rowData.push('<button type="button" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button><button type="button" class="btn btn-danger btn-xs dt-delete"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>');
                //Looping over columns is possible
                //var colCount = table.columns()[0].length;
                //for(var i=0; i < colCount; i++){			}

                //INSERT THE ROW
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
                $('.dt-delete').each(function () {
                    $(this).on('click', function (evt) {
                        $this = $(this);
                        var dtRow = $this.parents('tr');
                        if (confirm("Are you sure to delete this row?")) {
                            var table = $('#example').DataTable();
                            table.row(dtRow[0].rowIndex - 1).remove().draw(false);
                        }
                    });
                });
            });
        });
        //Edit row buttons
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
        //Delete buttons
        $('.dt-delete').each(function () {
            $(this).on('click', function (evt) {
                $this = $(this);
                var dtRow = $this.parents('tr');
                if (confirm("Are you sure to delete this row?")) {
                    var table = $('#example').DataTable();
                    table.row(dtRow[0].rowIndex - 1).remove().draw(false);
                }
            });
        });
        $('#myModal').on('hidden.bs.modal', function (evt) {
            $('.modal .modal-body').empty();
        });
    });
</script>
</body>
</html>
