
<aside id="hoe-left-panel" hoe-position-type="absolute">
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
    <ul class="nav panel-list">
        <li class="nav-level">Navigation</li>
        <li>
            <a href="javascript:void(0)">
                <i class="fa fa-tachometer"></i>
                <span class="menu-text">Dashboard</span>
                <span class="selected"></span>
            </a>
        </li>

        <li class="hoe-has-menu active" >
            <a href="javascript:void(0)" > 
                <i class="fa fa-files-o"></i> Voucher
                <span class="menu-text"></span>
                <span class="selected"></span>
            </a>
            <ul class="hoe-sub-menu">
                <li>
                    <a href="#" onclick="voucher()">
                        <span class="menu-text"> Add Voucher </span>
                        <span class="selected"></span>
                    </a>
                </li>
            </ul>
        </li>

        <li class="hoe-has-menu">
            <a href="javascript:void(0)">
                <i class="fa fa-pencil-square-o"></i>
                <span class="menu-text">UI Elements</span>
                <span class="selected"></span>
            </a>
            <ul class="hoe-sub-menu">
                <li>
                    <a href="javascript:void(0)">
                        <span class="menu-text">Typography</span>
                        <span class="selected"></span>
                    </a>
                </li>
            </ul>
        </li>

    </ul>
</aside>