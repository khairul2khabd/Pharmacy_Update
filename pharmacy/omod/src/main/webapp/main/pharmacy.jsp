
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
              href="${pageContext.request.contextPath}/moduleResources/pharmacy/angular-loading-bar/loading-bar.css"/>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/angular-loading-bar/loading-bar.js"></script>

        <script type="text/javascript">
            function home() {
                window.location.href = "${pageContext.request.contextPath}/module/pharmacy/pharmacy.form";
            }
            ;
        </script>
    </head>

    <body  hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" ng-app="inventoryApp">
        <div id="hoeapp-wrapper" class="hoe-hide-lpanel tdn" hoe-device-type="desktop">
            <%@ include file="../includes/headertopPharmacy.jsp"%>
            <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
                <aside id="hoe-left-panel" hoe-position-type="fixed">
                    <div class="profile-box">
                        <div class="media">
                            <a class="pull-left" href="user-profile.html">
                                <img class="img-circle" src="${pageContext.request.contextPath}/moduleResources/pharmacy/images/app/user.png"/>							
                            </a>
                            <div class="media-body">
                                <h5 class="media-heading">Welcome <br> <span>${user.person.givenName} ${user.person.middleName} ${user.person.familyName}</span></h5>
                            </div>
                        </div>
                    </div>

                    <%@ include file="../_pharmacy/external/leftmenu.jsp"%>

                </aside>

                <section id="main-content">
                    <div class="inner-content">
                        <div ui-view="content">
                            <!-- Angular views -->
 
                            <%@ include file="../main/secondaryHome.jsp"%>
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
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/app.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/bootstrap/angular-ui-router.min.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/bootstrap/ui-bootstrap-tpls-2.5.0.min.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/angular/angular-resource.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/angular/angular-animate.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/receive/receive.controller.js"></script>


        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/app.controller.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/app.service.js"></script>

        <!--auto-->
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/kha/angular-strap.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/kha/angular-strap.tpl.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/kha/dirPagination.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/app.state.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/app.statePha.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/pharmacy.controller.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/setup/phasetup.controller.js"></script>
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/setup/phasetup.service.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/angular-ui/ui-filter.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/receive/receive.controller.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/receive/receive.service.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/receive/grnview.controller.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/priceupdate/priceupdate.controller.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/newbill/newbill.controller.js"></script>

        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/newbill/viewbill.controller.js"></script>
        
         <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/newbill/duecollect.controller.js"></script>
        
        <script type="text/javascript"
        src="${pageContext.request.contextPath}/moduleResources/pharmacy/app/pharmacy/report/reports.controller.js"></script>
        
         
    </body>

</html>