<%-- 
    Document   : secondaryHome
    Created on : Apr 8, 2018, 10:53:23 AM
    Author     : Khairul
--%>
<style>
    .table > tbody > tr > td,
    .table > tfoot > tr > td,
    .table > thead > tr > td {
        padding-top: 3px;
        padding-bottom: 2px;
        line-height: 1.02857143;
        vertical-align: middle;
    }
    .table >thead> tr > th,
    .table >thead> tr > th >a{
        padding: 7px;
        background: #eee;
        color:#000;
    }
    .table-hover>tbody>tr:hover{
        color:green;
    }
    .TL{text-align:left;}
    .btn-outline-primary:hover{
        border:2px solid white;
        outline: 1px solid red;
    }
    .btn-outline-success:hover{
        border:2px solid white;
        outline: 1px solid red;
    }
</style>
<div ng-controller="PharmacyController
        as
        pc">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading f14 fbold"> Bill Collect and Others </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-2">
                            <button ui-sref="newbill" class="btn btn-outline-success col-sm-12 TL">  New Bill   &emsp; &emsp; <i class="fa fa-money"></i></button>
                        </div>

                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="searchBillId" ng-model="searchBillId"
                                   ng-keyup="$event.keyCode == 13 && dueCollect(searchBillId)" 
                                   placeholder="Search By Bill Id" />
                        </div>
                    </div>
                    <hr class="row" style="border:1px solid green; margin-top:10px">

                    <div class="panel panel-info" id="searchdiv">
                        <div class="panel-heading">Recent Voucher </div>
                        <div class="panel-body" style="border:1px solid #eee">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="searchBill" ng-model="searchBill" placeholder="Search" />
                                        <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i> </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-hover table-bordered black">
                                        <thead>
                                            <tr>
                                                <th>Bill ID</th>
                                                <th>Patient Name</th>
                                                <th>Total Amount</th>
                                                <th>Discount</th>
                                                <th>Net Amount</th>
                                                <th>Paid Amount</th>
                                                <th>Due</th>
                                                <th width="15%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="p in pc.RecentVoucher| filter:searchBill | orderBy:sortType:sortReverse | itemsPerPage:7 track by $index">
                                                <td> {{p.saleInvoiceId}} </td>
                                                <td> {{p.customer}} </td>
                                                <td> {{p.totalAmount}} </td>
                                                <td> {{p.discountAmount}} </td>
                                                <td> {{p.netAmount}} </td>
                                                <td> {{p.paid}} </td>
                                                <td> {{p.dueAmount}} </td>
                                                <td>
                                                    <button ng-show="p.paidStaus == 'DUE'" title="Due Collect" type="button" ng-click="dueCollect(p.saleInvoiceId)" class="btn btn-warning btn-xs">
                                                        Due
                                                    </button> 
                                                    <button ng-show="p.paidStaus == 'PAID'" title="View" type="button" ng-click="dueCollect(p.saleInvoiceId)" class="btn btn-info btn-xs">
                                                        View
                                                    </button> 													
                                                    <button class="btn btn-success btn-xs" ng-click="viewInvoice(p.saleInvoiceId)"> <i class="fa fa-print"></i> </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-success">
                <div class="panel-heading f14 fbold"> Pharmacy Store  </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="input-group">
                                <input type="text" class="form-control" ng-model="search"/> <!-- Filter/Search --->
                                <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i> </span>
                            </div>
                        </div>
                        <div class="col-sm-6"></div>
                        <div class="col-sm-2">
                            <select class="form-control hand"
                                    ng-init="pc.show = { listValue: '10'}"
                                    ng-model="pc.show" 
                                    ng-options="list.listName for list in viewSize track by list.listValue">
                            </select>
                        </div>
                    </div>
                    <br>

                    <table class="table table1 table-bordered black">
                        <tr class="black">
                            <th width="5%">Sl. No.</th>
                            <th>Item Name</th>
                            <th>Batch</th>
                            <th width="15%">Available Quantity</th>
                            <th>Expiry Date</th>
                            <th>Supplier Name</th>
                        </tr>
                        <tr class="hand" dir-paginate="ph in pc.PharmacyItemList | filter:search | orderBy:sortType:sortReverse | itemsPerPage:pc.show.listValue track by $index" class="black">
                            <td>{{$index + 1}}</td>
                            <td>{{ph.item.itemName}}</td> 
                            <td>{{ph.batch}}</td>
                            <td align="center" class="fbold">{{ph.qty}}</td>
                            <td>{{ph.expireDate| date:'dd-MM-yyyy'}}</td>
                            <td>{{ph.item.manufacture}}</td> 
                        </tr>
                    </table>
                    <dir-pagination-controls
                        max-size="10"
                        direction-links="true"
                        boundary-links="true">
                    </dir-pagination-controls>

                </div>
            </div>
        </div>
    </div>
</div>

