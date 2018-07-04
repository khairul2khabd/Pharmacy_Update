<%-- 
    Document   : createproduct
    Created on : Jul 16, 2017, 10:36:37 AM
    Author     : Khairul
--%>

<style>
    .table > tbody > tr > td,
    .table > tfoot > tr > td,
    .table > thead > tr > td {
        padding-top: 3px;
        padding-bottom: 2px;
        line-height: 1.12857143;
        vertical-align: middle;
    }
    .table > tr > th {
        padding: 10px;
        background: #eee;
        text-align: left;
    }
    .ff-gar{ font-family: "Garamond" }
</style>  

<div ng-controller="ViewBillController as vbc">
    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> Invoice  </div>
        <div class="panel-body">

            <div id="printDiv" style="width:100%; font-size:11px; font-weight:bold">

                <table class="table black" style="width: 120%; font-family:Courier New; font-size:11px">
                    <tr style="text-align:center;"> <td colspan="2" style="font-size: 16px">HEALTH AID HOSPITAL LTD.</td> </tr>
                    <tr style="text-align:center;"> <td colspan="2" style="border-bottom:2px solid #000"> 50, Dhakeshwary Road, Lalbag, Dhaka-1211</td>  </tr> 

                    <tr> <td style="font-size:13;">Invoice   : <b> {{vbc.phaSale.saleInvoiceId}} </b></td> 
                        <td> Invoice Date : {{vbc.phaSale.createdDate| date:'MMM-dd-yyyy'}} </td> 
                    </tr>
                    <tr> <td colspan="2">Customer Name   : {{vbc.phaSale.customer}}</td> </tr>
                </table>  

                <br>
                <div>
                    <table class="table table-bordered black" style="width: 100%; font-size: 11px; border-collapse: collapse;
                           background-color: #7e7e7e; font-family:Courier New">
                        <tr style="background-color: #FFF; border:1px solid;">
                            <th style="border-right: 1px solid #000; padding-left: 5px; text-align: left; width:5%">SL </th>
                            <th style="border-right: 1px solid #000; padding-left: 5px; text-align: left; width:40% ">Item Name  </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center; width:10%"> Qty </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:15%"> Price </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:15%; font-size:10px"> T. Price </th>
                        </tr>
                        <tbody>
                            <tr ng-repeat="p in vbc.phaSaleDet track by $index"
                                style="background-color: #FFF; border:1px solid;"> 
                                <td style="border-right: 1px solid #000; padding-left: 5px; text-align: left">
                                    {{$index + 1}}
                                </td>
                                <td style="border-right: 1px solid #000; padding-left: 5px; text-align: left">
                                    {{p.phaItem.itemName}}
                                </td>
                                <td style="border-right: 1px solid #000;  text-align: center"> {{p.quantity}} </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.unitPrice}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.totalAmount}} </td>

                            </tr>
                            <tr style="background-color: #FFF;">
                                <td colspan="4" style="padding-right: 5px; text-align: right; border-top: 1px solid #000;"> Sub Total : </td>
                                <td style="padding-right: 5px; text-align: right; border-top: 1px solid #000;"> {{vbc.phaSale.totalAmount}}  </td>
                            </tr>
                            <tr style="background-color: #FFF;">
                                <td colspan="4" style="padding-right: 5px; text-align: right; border: 1px solid #FFF;"> (-) Discount : </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #FFF;"> {{vbc.phaSale.discountAmount}}  </td>
                            </tr>
                            <tr style="background-color: #FFF;">
                                <td colspan="2" style="padding-right: 5px; text-align: center; border: 1px solid #FFF; font-size:14px"> {{vbc.phaSale.paidStaus}} </td>
                                <td colspan="2" style="padding-right: 5px; text-align: right; border: 1px solid #FFF;"> Net Amount : </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #FFF;"> {{vbc.phaSale.netAmount}}  </td>
                            </tr>
                            <tr style="background-color: #FFF;">
                                <td colspan="4" style="padding-right: 5px; text-align: right; border: 1px solid #FFF; font-size:14px"> Paid Amount : </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #FFF; font-size:14px"> {{vbc.phaSale.paid}}  </td>
                            </tr>
                            <tr style="background-color: #FFF;">
                                <td colspan="4" style="padding-right: 5px; text-align: right; border: 1px solid #FFF;"> Due Amount : </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #FFF;"> {{vbc.phaSale.dueAmount| number:2}}  </td>
                            </tr>

                            <tr style="background-color: #FFF;">
                                <td colspan="5" style="padding-right: 5px; text-align: right; border-bottom: 2px solid #000;">&nbsp; </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="pull-right" style="padding-top: 10px">
                <button type="button" ng-click="printDiv()" class="btn btn-outline-info">
                    Print <i class="fa fa-print" aria-hidden="true"></i>
                </button>
                <button ui-sref="godrec({gd:'gd'})" type="button" class= "btn btn-outline-danger" tittle="Alt+C (close)" > <u class="">C</u>lose
                    <i class="fa fa-close"></i>
                </button>
            </div>

        </div>
    </div>
</div>