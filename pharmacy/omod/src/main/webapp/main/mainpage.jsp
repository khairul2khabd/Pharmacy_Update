
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pharmacy</title>
        <%@ include file="../includes/js_css.jsp"%>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/openmrs-favicon.ico" />
        <link type="text/css" rel="stylesheet"
              href="${pageContext.request.contextPath}/moduleResources/inventorynew/angular-loading-bar/loading-bar.css"/>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular-loading-bar/loading-bar.js"></script>

        <script type="text/javascript">
            function home() {
                window.location.href = "${pageContext.request.contextPath}/module/inventorynew/main.form";
            }
            ;
        </script>
    </head>

    <body  hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" ng-app="inventoryApp">
        <div id="hoeapp-wrapper" class="hoe-hide-lpanel tdn" hoe-device-type="desktop">
            <%@ include file="../includes/headertop.jsp"%>
            <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
                <aside id="hoe-left-panel" hoe-position-type="fixed">
                    <div class="profile-box">
                        <div class="media">
                            <a class="pull-left" href="user-profile.html">
                                <img class="img-circle" src="${pageContext.request.contextPath}/moduleResources/inventorynew/images/app/user.png"/>							
                            </a>
                            <div class="media-body">
                                <h5 class="media-heading">Welcome <br> <span>${user.person.givenName} ${user.person.middleName} ${user.person.familyName}</span></h5>
                            </div>
                        </div>
                    </div>
                    <ul class="nav panel-list">
                        <!--                        <li class="nav-level">Navigation</li>-->
                        <li class="active">
                            <a href="javascript:void(0)">
                                <i class="fa fa-tachometer"></i>
                                <span class="menu-text">Dashboard</span>
                                <span class="selected"></span>
                            </a>
                        </li>

                        <li class="hoe-has-menu">
                            <a href="javascript:void(0)" > 
                                <i class="fa fa-chain"></i> 
                                <span class="menu-text">Inventory Control</span>
                                <span class="selected"></span>
                            </a>
                            <ul class="hoe-sub-menu">
                                <li>
                                    <a ui-sref="geninv"> 
                                        <span class="menu-text"> General </span>
                                        <span class="selected"></span>
                                    </a>
                                </li>

                                <li class="hoe-has-menu">
                                    <a href="javascript:void(0)">
                                        <span class="menu-text">Reagent </span>
                                        <span class="selected"></span>
                                    </a>
                                    <ul class="hoe-sub-menu">
                                        <li>
                                            <a ui-sref="reagent">
                                                <span class="menu-text">Purchase Invoice</span>
                                                <span class="selected"></span>
                                            </a>
                                        </li> 
                                        <li>
                                            <a ui-sref="issue">
                                                <span class="menu-text">Issue to Patient</span>
                                                <span class="selected"></span>
                                            </a>
                                        </li> 
                                    </ul>
                                </li>

                            </ul>
                        </li>

                        <li class="hoe-has-menu">
                            <a href="javascript:void(0)" > 
                                <i class="fa fa-files-o"></i> 
                                <span class="menu-text">Reporting</span>
                                <span class="selected"></span>
                            </a>
                            <ul class="hoe-sub-menu">
                                <li>
                                    <a href="#" onclick=" "> 
                                        <span class="menu-text"> ..... </span>
                                        <span class="selected"></span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="hoe-has-menu">
                            <a href="javascript:void(0)" > 
                                <i class="fa fa-cogs"></i> 
                                <span class="menu-text">Setup</span>
                                <span class="selected"></span>
                            </a>
                            <ul class="hoe-sub-menu">
                                <li>
                                    <a ui-sref="createproduct"> 
                                        <span class="menu-text"> Create Product </span>
                                        <span class="selected"></span>
                                    </a>
                                </li>

                            </ul>
                        </li>

                    </ul>
                </aside>

                <section id="main-content">
                    <div class="inner-content">
                        <div ui-view="content">
                            <!-- Angular views -->

                            <div class="  col-sm-12" ng-controller="AppController
                                    as
                                    ac">

                                <div class="panel panel-success">
                                    <div class="panel-heading f14 fbold"> Reagent Store  </div>
                                    <div class="panel-body">

                                        <table class="table table1 table-bordered">
                                            <tr class="black">
                                                <th>Sl. No.</th>
                                                <th>Reagent Name</th>
                                                <th>Batch</th>
                                                <th>Available Quantity</th>
                                                <th>Reagent Name</th>
                                                <th>Reagent Name</th>
                                            </tr>
                                            <tr ng-repeat="item in ac.reagentItems track by $index" class="black">
                                                <td>{{$index + 1}}</td>
                                                <td>{{item.reagentName}}</td>
                                                <td>{{item.batchNo}}</td>
                                                <td>{{item.availableQty}}</td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

            </div>
        </div>

        <style>
            .table1>tbody>tr>td,
            .table1>tfoot>tr>td,
            .table1>thead>tr>td{
                padding-top: 2px;
                padding-bottom: 1px;
                line-height: 1.52857143;
                vertical-align: middle;
            }
            .table1>tr>th {
                padding:10px;
                background:#eee;
            }
        </style> 

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/app.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/bootstrap/angular-ui-router.min.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/bootstrap/ui-bootstrap-tpls-2.5.0.min.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular/angular-resource.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular/angular-animate.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular/angular-sanitize.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/app.controller.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/app.service.js"></script>

        <!--auto-->
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/kha/angular-strap.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/kha/angular-strap.tpl.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/kha/dirPagination.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/app.state.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/setup/setup.controller.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/setup/setup.service.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/reagent/purchase.controller.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/reagent/purchase.service.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/issue/issue.controller.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/inventorynew/app/issue/issue.service.js"></script>

        <!--date timepicker-->
        <!--        <link type="text/css" rel="stylesheet"
                      href="${pageContext.request.contextPath}/moduleResources/inventorynew/angular-ui/jquery-ui.css"/>
                <script type="text/javascript"
                src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular-ui/jquery.js"></script>
                <script type="text/javascript"
                src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular-ui/jquery-ui.min.js"></script>
                <script type="text/javascript"
                src="${pageContext.request.contextPath}/moduleResources/inventorynew/angular-ui/date.js"></script>-->

    </body>

</html>