<%-- 
    Document   : generalinv
    Created on : Jul 22, 2017, 11:00:29 AM
    Author     : Khairul
--%>

<style>
    select, th, a{
        cursor: pointer;
    }
    select{width: 200px; height: 22px}
    .table>tbody>tr>td,
    .table>tbody>tr>th,
    .table>tfoot>tr>td,
    .table>tfoot>tr>th,
    .table>thead>tr>td,
    .table>thead>tr>th {
        padding: 3px;
        line-height: 1.02857143;
        vertical-align: top;
        border-top: 1px solid #ddd
    }
    .active{color:red}
    .abc{background-color: #D8D8D8;
         color: #424242}
    .abc1{background-color: #D8D8D8;
          color: #424242}
    .table-f td:first-child, .table-f td:nth-child(2){
        background: #FAFAFA;
    } 
    hr{color: black} 

</style> 

<div ng-controller="PurchaseController
        as
        purcon">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title"> General Inventory </span>
        </div>
        <div class="panel-body">
            <form ng-submit="sc.submit()" name="form" id="myForm" class="form-horizontal f13 black">
                Under developing......................
            </form>
        </div>
    </div>
</div>