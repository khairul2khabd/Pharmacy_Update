<style>
    .table > tbody > tr > td,
    .table > tfoot > tr > td,
    .table > thead > tr > td {
        padding-top: 3px;
        padding-bottom: 2px;
        line-height: 1.02857143;
        vertical-align: middle;
    }
    .table > tr > th {
        padding: 10px;
        background: #eee;
    }
    .bgimg {
        width: auto;
        height: auto;
        background-repeat: no-repeat;
        background-image: url('/images/control/bg.png');
    }
    .ui-select-choices-row{
        border-bottom:1px solid red;
    }

</style>

<div class="row" ng-controller="DueCollectController
            as dc">
    <div class="col-lg-12">
        <div class="panel panel-success">
            <!--<div class="panel-heading-kha">New Bill</div>-->
            <div class="panel-body f13">
                <div class="panel-body black">
                    <p class="alert-danger btn-sm" ng-show="dc.error">
                        {{dc.error}}
                    </p>
                    <p class="alert-success-kha btn-sm" ng-show="dc.success">
                        <strong><i class="glyphicon glyphicon-ok"></i> {{dc.success}} </strong>
                    </p>

                    <b> Invoice No : {{dc.phaSale.saleInvoiceId}} </b> &emsp;&emsp;&emsp;&emsp; Patient/Customer Name : {{dc.phaSale.customer}}

                    <div class="row">
                        <div  class="col-sm-8" style="min-height:300px; background-color:#009688;
                              margin-top: 10px; border: 2px solid #eee;">
                            <table class="table table-bordered table-responsive black"
                                   style="margin-top: 10px; border-radius: 5px">
                                <tr style="background-color: #00BCD4">
                                    <th class="bg-gray">Sl</th>
                                    <th class="bg-gray">Item Name</th>
                                    <th width="10%" class="bg-gray">Qty</th>
                                    <th width="12%" class="bg-gray text-right">Price</th>
                                    <th width="12%" class="bg-gray text-right">Amount</th>
                                    <th width="6%" class="bg-gray">Action</th>
                                </tr>
                                <tr ng-repeat="p in dc.phaSaleDet track by $index" style="background: #eee" id="action1{{p.saleDetId}}">
                                    <td width="4%">{{$index + 1}}.</td>
                                    <td> {{p.phaItem.itemName}} </td>
                                    <td> {{p.quantity}} </td>
                                    <td align="right">{{p.unitPrice}} </td>
                                    <td align="right">{{p.quantity * p.unitPrice}} </td>
                                    <td> 
                                        <button id="action{{p.saleDetId}}" type="button" class="btn btn-success btn-xs"
                                                ng-click="removeService($index, p.saleDetId)"><i class="fa fa-reply"></i>
                                        </button>
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <!-- ReturnItems -->

                            <table class="table table-bordered">
                                <tr ng-repeat="r in dc.ReturnItems track by $index" style="background: #eee">
                                    <td> {{r.phaItem.itemName}} </td>
                                    <td align="center" width="10%"> 
                                        <input style="width:80%; text-align:center" id="qty{{$index}}" ng-blur="digitCheck($index, ret, r.quantity)" 
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) ||
                                                                   event.charCode == 0 || event.charCode == 46'
                                               ng-change="retQty($index, ret)" ng-model="ret" ng-value="r.quantity" /> 
                                    </td>
                                    <td align="right" width="12%">{{r.unitPrice}} </td>
                                    <td align="right" width="12%">{{r.totalAmount}} </td>
                                    <td align="right" width="12%"> {{r.afDis| number:2}}  </td>
                                </tr>
                                <tr ng-show="returnTotalAmount > 0" style="background: #eee">
                                    <td colspan="4" align="right" class="fbold">Return Total :</td>
                                    <td align="right" class="fbold"> {{returnTotalAmount| number:2}} </td>
                                </tr>
                            </table>
                            <br>
                            <div>
                                <table class="table table-bordered black f13">
                                    <tr style="background-color: #bfbebc ">
                                        <td width="8%">Col. ID.</td>
                                        <td> Collected Date</td>
                                        <td align="center"> Amount </td>
                                        <td align="right"> User </td>
                                    </tr>
                                    <tr ng-show="dc.phaSaleColl.length > 0" ng-repeat="d in dc.phaSaleColl track by $index" style="background: #eee">
                                        <td width="4%">{{d.saleCollectId}}.</td>
                                        <td> {{d.collectedDate| date:'dd-MM-yyyy hh:mm'}}</td>
                                        <td align="center"> {{d.paidAmount}} </td>
                                        <td align="right"> {{d.creator}}  </td>
                                    </tr>
                                </table>
                            </div>

                            <br>
                            <div>
                                <table class="table table-bordered black f13">
                                    <tr style="background-color: #bfbebc ">
                                        <td width="8%">Ret. ID.</td>
                                        <td> Return Date</td>
                                        <td align="center"> Actual Amount </td>
                                        <td align="right"> Return Amount</td>
                                    </tr>
                                    <tr ng-show="dc.PhaSaleReturns.length > 0" ng-repeat="d in dc.PhaSaleReturns track by $index" style="background: #eee">
                                        <td width="4%">{{d.returnId}}.</td>
                                        <td> {{d.createdDate| date:'dd-MM-yyyy hh:mm'}}</td>
                                        <td align="center"> {{d.netAmount}} </td>
                                        <td align="right"> {{d.returnAmount|number:0}}  </td>
                                    </tr>
                                </table>
                            </div>

                            <span ng-class="{'void': dcc.IndoorBillModel.voided === true}" ng-show="dcc.IndoorBillModel.dueAmount < 1" class="col-sm-offset-5 text-center col-sm-2 fbold f18 white" 
                                  style="border:2px solid white; border-radius:4px; height:30px; padding-top:2px"> Full Paid </span>

                            <span ng-show="dcc.IndoorBillModel.dueAmount > 0" class="col-sm-offset-5 text-center col-sm-2 fbold f18 yellow" 
                                  style="border:2px solid white; border-radius:4px; height:30px; padding-top:2px"> Due </span>
                            <br>
                            <br>
                        </div>

                        <div class="col-sm-4" style="min-height:300px; background-color:#088A85; border-style: groove;
                             margin-top: 10px; border: 2px solid #eee;">
                            <!--<form name="form" id="myForm"></form>-->
                            <table class="table table-bordered table-responsive white"
                                   style="margin-top: 10px; width: 98%">
                                <tr class="text-right">
                                    <td class="f16 fbold">Payment Method</td>
                                    <td>
                                        <select class="black hand" ng-model="paymentMethod" id="paymentMethod"
                                                ng-change="selectPayMethod(paymentMethod)">
                                            <option value="">-- Select Payment Metohd --</option>
                                            <option ng-repeat="pm in paymentMethods"
                                                    ng-selected="paymentMethod == pm"
                                                    value="{{pm}}">{{pm}}
                                            </option>
                                        </select>
                                    </td>
                                </tr>

                                <!--ng-keyup="$event.keyCode == 13 && addService()"-->

                                <tr class="text-right" ng-show="dc.pmCard">
                                    <td>
                                        <input class="black" type="text" ng-dblclick="bn = null" id="bn"
                                               style="width: 150px"
                                               ng-keyup="$event.keyCode == 13 && next('bn')"
                                               bs-options="state for state in bankNames"
                                               ng-model="bankName" placeholder="Enter Bank Name" bs-typeahead>
                                    </td>
                                    <td class="f16 fbold">
                                        <input class="text-right black" id="transNumber"
                                               ng-keyup="$event.keyCode == 13 && next('transNumber')"
                                               ng-model="transNumber" type="text">
                                    </td>
                                </tr>

                                <tr class="text-right" ng-show="dc.bkash">
                                    <td class="f16 fbold">Mobile Number</td>
                                    <td class="f16 fbold">
                                        <input class="text-right black" id="bkash" ng-model="bkash"
                                               ng-keyup="$event.keyCode == 13 && next('bkash')"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                               type="text">
                                    </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="f16 fbold">Total Amount</td>
                                    <td class="f16 fbold"><span>{{dc.phaSale.totalAmount}}</span></td>
                                </tr>
                                <tr class="text-right">
                                    <td class="f16 fbold">(-) Discount</td>
                                    <td class="f14 fbold">TK : {{dc.phaSale.discountAmount}} &emsp;&emsp;
                                        % : {{dc.phaSale.discountPercentage}} 
                                    </td>
                                </tr>
                                <tr class="text-right">
                                    <td class="f18 fbold">Paid Amount</td>
                                    <td class="f18 fbold"> {{dc.phaSale.paid}}
                                    </td>
                                </tr>
                                <tr class="text-right">
                                    <td class="f16 fbold">Payable Amount</td>
                                    <td class="f18 fbold"> {{dc.phaSale.dueAmount}}
                                    </td>
                                </tr>
                                <tr class="text-right" ng-show="returnTotalAmount > 0">
                                    <td class="f16 yellow fbold">Return Amount</td>
                                    <td class="f18 yellow fbold"> {{ returnTotalAmount| number:0}}
                                    </td>
                                </tr>
                                <tr class="text-right" ng-show="returnTotalAmount > 0">
                                    <td class="f16 yellow fbold">Net Return</td>
                                    <td class="f18 yellow fbold"> 
                                        <i class="pull-left white" ng-class="{'fa fa-hand-paper-o':nr == 'Take', 'fa fa-hand-lizard-o':nr == 'Give'}"></i>  
                                        {{ (returnTotalAmount - dc.phaSale.dueAmount) | number:0}}
                                    </td>
                                </tr>
                                <tr class="text-right">
                                    <td class="f18 fbold">Due Paid</td>
                                    <td><input style="font-size: 18px;  height:30px; text-align: center; font-weight: bold" id="duePaid"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                               ng-keyup="$event.keyCode == 13 && dc.saveDueCollectPha(dc.phaSale.saleInvoiceId, duePaid, due)"
                                               ng-change="dueAmnt(duePaid)"
                                               class="text-right black" ng-model="duePaid" type="text"></td>
                                </tr>
                                <tr class="text-right">
                                    <td class="f18 fbold">Due</td>
                                    <td class="f18 fbold yellow">{{due}}
                                        <input type="hidden" ng-model="due">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="pull-right" style="padding-top: 10px">
                            <button ng-show="returnTotalAmount < 1" type="button" ng-disabled="dc.phaSale.dueAmount < 1" ng-click="dc.saveDueCollectPha(dc.phaSale.saleInvoiceId, duePaid, due)" class="btn btn-outline-success">
                                Save &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i>
                            </button>
                            <button ng-show="returnTotalAmount > 0" type="button" ng-click="dc.saveDueCollectPha(dc.phaSale.saleInvoiceId, duePaid, due)" class="btn btn-outline-success">
                                Adjust &nbsp; <i class="fa fa-refresh" aria-hidden="true"></i>
                            </button>
                            <button ng-controller="AppController" ng-click="_home()" class= "btn btn-outline-danger"> Close &nbsp; <i class="fa fa-close"></i> </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

</div>