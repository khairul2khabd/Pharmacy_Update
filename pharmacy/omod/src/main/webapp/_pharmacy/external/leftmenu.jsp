<%-- 
    Document   : leftmenu
    Created on : May 24, 2018, 1:59:54 PM
    Author     : Khairul
--%>

<ul class="nav panel-list">
    <li class="active">
        <a href="javascript:void(0)">
            <i class="fa fa-tachometer"></i>
            <span class="menu-text">Dashboard</span>
            <span class="selected"></span>
        </a>
    </li>

    <li class="hoe-has-menu">
        <a href="javascript:void(0)">
            <i class="fa fa-money"></i>
            <span class="menu-text">Sales</span>
            <span class="selected"></span>
        </a>
        <ul class="hoe-sub-menu">
            <li>
                <a ui-sref="newbill">
                    <span class="menu-text"> New Bill </span>
                    <span class="selected"></span>
                </a>
            </li>
        </ul>
    </li>

    <li class="hoe-has-menu">
        <a ui-sref="reports">
            <i class="fa fa-files-o"></i> 
            <span class="menu-text">All Statement</span>
            <span class="selected"></span>
        </a>
        <ul class="hoe-sub-menu">
            <li>
                <a ui-sref="userstat">
                    <span class="menu-text"> User Statement </span>
                    <span class="selected"></span>
                </a>
            </li>
        </ul>
    </li>

    <li class="hoe-has-menu">
        <a ui-sref="setPharmacy" > 
            <i class="fa fa-cogs"></i> 
            <span class="menu-text">Master Setup</span>
            <span class="selected"></span>
        </a>
        <ul class="hoe-sub-menu">
            <li>
                <a ui-sref="itemcreate({gd:'itcre'})"> 
                    <span class="menu-text"> Item Create </span>
                    <span class="selected"></span>
                </a>
            </li>
            <li>
                <a ui-sref="cat({gd:'cat'})"> 
                    <span class="menu-text"> Category Add</span>
                    <span class="selected"></span>
                </a>
            </li>
            <li>
                <a ui-sref="supadd({gd:'sup'})"> 
                    <span class="menu-text"> Supplier Add</span>
                    <span class="selected"></span>
                </a>
            </li>
            <li>
                <a ui-sref="godrec({gd:'gd'})"> 
                    <span class="menu-text"> Goods Receive </span>
                    <span class="selected"></span>
                </a>
            </li>
            <li>
                <a ui-sref="cc"> 
                    <span class="menu-text">  Price Update </span>
                    <span class="selected"></span>
                </a>
            </li>

            <li>
                <a ui-sref="cc"> 
                    <span class="menu-text"> Reorder/Short list </span>
                    <span class="selected"></span>
                </a>
            </li>

            <li>
                <a ui-sref="cc"> 
                    <span class="menu-text"> Supplier to Return </span>
                    <span class="selected"></span>
                </a>
            </li>

        </ul>
    </li>
</ul>