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
                <div class="panel-heading f14 fbold"> Reports </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button ui-sref="userstat" class="btn btn-outline-success col-sm-12 TL"> User Wise Collect Statement </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

