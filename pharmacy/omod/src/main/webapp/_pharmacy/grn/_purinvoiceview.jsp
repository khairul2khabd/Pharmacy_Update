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

<div ng-controller="GrnViewController as gvc">
    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> GRN View  </div>
        <div class="panel-body">

            <div id="printDiv" style="width:100%;">
                <div class="row">
                    <table class="table black f14" style="width: 100%;">
                        <tr>
                            <td>Invoice No: {{gvc.PurInvoiceModel.invoiceNo}}</td>
                            <td> Supplier Name : &emsp; {{gvc.PurInvoiceModel.supplierName}}</td>
                            <td>Invoice Date: {{gvc.PurInvoiceModel.createdDate|date:'MMM-dd-yyyy'}}</td>
                        </tr>
                    </table>
                </div>
                <br>
                <div>
                    <table class="table table-bordered black" style="width: 100%; font-size: 11px; border-collapse: collapse;
                           background-color: #7e7e7e;">
                        <tr style="background-color: #FFF; border:1px solid;">
                            <th style="border-right: 1px solid #000; padding-left: 5px; text-align: left">S.No </th>
                            <th style="border-right: 1px solid #000; padding-left: 5px; text-align: left; width:15%">Item Name  </th>
                            <th style="border-right: 1px solid #000; text-align: center">Batch</th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> Pack </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center">  Size </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> Qty </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> Net Qty </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center; width:5%"> Free Qty </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> Unit TP </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:8%"> Total Amount </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:5%"> MRP </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:5%"> Sales Price </th>
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: center; width:5% "> Vat <br>(%) </th>
                            <!--<th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:5%"> Vat Amount </th>-->
                            <th style="border-right: 1px solid #000; padding-left: 5px; text-align: center; width:6%"> Discount <br> (%) </th>
                            <!--<th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:8%"> Discount Amount </th>-->
                            <th style="border-right: 1px solid #000; padding-right: 5px; text-align: right; width:10%"> Net Amount </th>
                        </tr>
                        <tbody>
                            <tr ng-repeat="p in gvc.PurInvoiceDet"
                                style="background-color: #FFF; border:1px solid;"> 
                                <td style="border-right: 1px solid #000; padding-left: 5px; text-align: left">
                                    {{$index + 1}}
                                </td>
                                <td style="border-right: 1px solid #000; padding-left: 5px; text-align: left">
                                    {{p.item.itemName}}
                                </td>
                                <td style="border-right: 1px solid #000;  text-align: center"> {{p.batch}}</td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.pack}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.size}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.qty}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.netQty}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.free|| '0'}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right">  {{p.unitTP}} <!-- {{p.unitTP | currency}} -->  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.totalAmount}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.mrp}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.salesPrice}}  </td>
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.vat}} </td>
                                <!--<td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.vatAmount}}  </td>-->
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: center"> {{p.discount}} </td>
                                <!--<td style="border-right: 1px solid #000; padding-right: 5px; text-align: right"> {{p.discountAmount}} </td>-->
                                <td style="border-right: 1px solid #000; padding-right: 5px; text-align: right">  {{p.netAmount}} </td>
                            </tr>
                            <tr style="background-color: #FFF;">
                                <td colspan="8" style="border: 1px solid #000; border-right:1px solid #FFF"> &nbsp;</td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">
                                    Total :
                                </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">
                                    {{gvc.PurInvoiceModel.tradePrice}}
                                </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">

                                </td>

                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">

                                </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">
                                    {{gvc.PurInvoiceModel.vat}}
                                </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">
                                    {{gvc.PurInvoiceModel.discount}} 
                                </td>
                                <td style="padding-right: 5px; text-align: right; border: 1px solid #000;">
                                    {{gvc.PurInvoiceModel.invoiceAmount}}
                                </td>
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