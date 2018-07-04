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

</style>
<div ng-controller="ReportController
        as
        rc">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-info">
                <div class="panel-heading f14 fbold"> User Wise Statement </div>
                <div class="panel-body">
                    <div class="row black">
                        <div class="col-sm-3">
                            Select Use Name :
                            <input type="text" class="form-control input-sm" id="username" data-html="true"
                                   bs-options="pat.userName for pat in rc.Users" ng-model="username" bs-typeahead />
                            <!-- +'<br/>'+pat.givenName -->
                        </div>

                        <div class="col-sm-2">
                            Enter Start Date :
                            <input type="date" class="form-control input-sm" id="sDate" ng-model="sDate" />
                        </div>

                        <div class="col-sm-2">
                            Enter End Date :
                            <input type="date" class="form-control input-sm" id="eDate" ng-model="eDate" />
                        </div>

                        <div class="col-sm-3">
                            <br>
                            <button class="btn btn-success btn-sm" ng-click="rc.getUserWiseStatement(username, sDate, eDate)"> Show </button>
                        </div>
                    </div>
                    <hr class="row" style="border:1px solid green; margin-top:10px">

                    <div class="row">


                    </div>

                </div>
            </div>
        </div>
    </div>

</div>

