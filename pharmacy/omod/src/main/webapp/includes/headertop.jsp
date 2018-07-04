<header id="hoe-header" hoe-lpanel-effect="shrink"> <!-- Main Header -->
    <div class="hoe-left-header" hoe-position-type="fixed">
        <a href="#"><i class="fa fa-bank"></i> <span>Inventory</span></a>
        <span class="hoe-sidebar-toggle"><a href="#"></a></span>
    </div>
    <div class="hoe-right-header" hoe-position-type="fixed">
        <span class="hoe-sidebar-toggle"><a href="#"></a></span>  <!-- toggle menu -->
        <ul class="left-navbar">
            <li class="hoe-rheader-submenu">  
                <a href="#" ><i style="font-size:22px" onclick="home()" class="fa fa-home hand" aria-hidden="true"></i> </a>
            </li>

            <li class="dropdown hoe-rheader-submenu message-notification left-min-65">
                <a href="#" class="dropdown-toggle icon-circle" data-toggle="dropdown" >
                    <i class="fa fa-tasks"></i>
                    <span class="badge badge-danger"></span>
                </a>
                <ul class="dropdown-menu ">
                    <li class="hoe-submenu-label"> <h3> Modules</h3></li>
                    <li> <a href='${pageContext.request.contextPath}/' class="clearfix"> Home </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/findPatient.htm' class="clearfix"> Registration </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/module/report/reportRoleList.form' class="clearfix"> Report </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/module/pharmacy/main.form' class="clearfix"> Reagent </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/module/radiology/main.form' class="clearfix"> Radiology </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/module/laboratory/main.form' class="clearfix"> Laboratory </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/module/billing/directbillingqueue.form' class="clearfix"> Billing </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/module/billing/reportsView.form' class="clearfix"> Commission </a> </li>
                    <li> <a href='${pageContext.request.contextPath}/admin/index.htm' class="clearfix"> Administration </a> </li>
                </ul>
            </li>
            <li>
                <form method="post" class="hoe-searchbar">
                    <input type="text" placeholder="Search..." name="keyword" class="form-control ">
                </form>
            </li>
        </ul> 

        <ul class="right-navbar"> <!-- Right User Information -->
            <li class="dropdown hoe-rheader-submenu hoe-header-profile">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span><img class="img-circle " src="${pageContext.request.contextPath}/moduleResources/pharmacy/images/app/user.png"></span>
                    <span>${user.person.givenName} ${user.person.middleName} ${user.person.familyName}  <i class=" fa fa-angle-down"></i></span>
                </a>
                <ul class="dropdown-menu ">
                    <li><a href='${pageContext.request.contextPath}/logout'><i class="fa fa-power-off"></i>Logout</a></li>
                </ul>
            </li>
        </ul>
        <div style="height: 3px; margin-top:48px;
             background: linear-gradient(to right, #ffffff 0%, #009999  100%);"> </div>
    </div>
</header>