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

<div class="row" ng-controller="NewBillController as bc">
    <div class="col-lg-12">
        <div class="panel panel-success">
            <!--<div class="panel-heading-kha">New Bill</div>-->
            <div class="panel-body f13">
                <div class="panel-body black">
                    <p class="alert-danger btn-sm" ng-show="bc.error">
                        {{bc.error}}
                    </p>
                    <p class="alert-success-kha btn-sm" ng-show="bc.success">
                        <strong><i class="glyphicon glyphicon-ok"></i> {{bc.success}} </strong>
                    </p>
                    <div class="row">
                        <div class="col-sm-3">
                            <span style=" margin-left:-15px"> Search by Item Name : </span>
                            <div  style=" margin-left:-15px">
                                <ui-select id="itemName" autofocus ng-disabled="sc.disabled" ng-model="itemObject.itemName" 
                                           theme="bootstrap" on-select="addItem(itemObject.itemName)" ng-keyup="$event.keyCode == 13 && addItem(itemObject.itemName)" 
                                           style="min-width: 300px; height:50px"  title="Choose a item" append-to-body="true">
                                    <ui-select-match placeholder="Search Item Name">{{itemObject.itemName.item.itemName}}</ui-select-match>
                                    <ui-select-choices repeat="sup in bc.itemList | itemSearchSale: {batch: $select.search, item:$select.search}">
                                        <div ng-bind-html="sup.item.itemName | highlight: $select.search"></div>
                                        <small> Qty : {{sup.qty}} &emsp;
                                            Batch : <span ng-bind-html="''+sup.batch | highlight: $select.search"></span>
                                        </small>  
                                    </ui-select-choices>
                                </ui-select>
                            </div>
                        </div>
                        <div class="col-sm-1">&nbsp;</div>
                        <div class="col-sm-3 black">
                            Customer Name :
                            <input type="text" class="form-control f12" id="customerName" ng-dblclick="customerName = null"
                                   ng-keyup="$event.keyCode == 13 && _onenter('customerName')" data-html="true"
                                   bs-options="pat.givenName +' '+pat.middleName +' '+pat.familyName +'<br />'+ pat.identifier +'<br />'+ pat.phoneNo for pat in bc.patientSearchList"
                                   ng-change="bc.getPatientInfo(customerName)"
                                   ng-model="customerName" placeholder="Enter Customer Name" bs-typeahead>

                        </div>
                        <div class="col-sm-4 black">
                            Contact Info :
                            <textarea class="form-control input-sm" rows="1" id="contactInfo" ng-model="contactInfo"></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-8" style="min-height:300px; background-color:#009688;
                             margin-top: 10px; border: 2px solid #eee;">
                            <table class="table table-bordered table-responsive black"
                                   style="margin-top: 10px; border-radius: 5px">
                                <tr style="background-color: #00BCD4">
                                    <th class="bg-gray">Sl</th>
                                    <th class="bg-gray">Item Name</th>
                                    <th width="12%" class="bg-gray">Ava. Qty.</th>
                                    <th width="10%" class="bg-gray">Qty</th>
                                    <th width="12%" class="bg-gray text-right">Price</th>
                                    <th width="12%" class="bg-gray text-right">Amount</th>
                                    <th width="6%" class="bg-gray">Action</th>
                                </tr>
                                <tr ng-repeat="d in selectedItemList track by $index" style="background: #D7CCC8">
                                    <td width="4%">{{$index + 1}}.</td>
                                    <td> {{d.itemName}}</td>
                                    <td align="right"> {{d.avaQty}}</td>
                                    <td><input ng-model="d.qty" ng-change="qtyprice($index, d.qty)" id="{{$index}}"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) ||
                                                                   event.charCode == 0 || event.charCode == 46'
                                               ng-keyup="$event.keyCode == 13 && dynNext($index)" style="width:80px">
                                    </td>
                                    <td align="right">
                                        <input ng-model="d.price" ng-change="priceqty($index, d.price)" id="{{$index + 'price'}}"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) ||
                                                                   event.charCode == 0 || event.charCode == 46'
                                               ng-keyup="$event.keyCode == 13 && next($index)" style="width:80px">
                                    </td>
                                    <td align="right">
                                        <input ng-model="d.amount" readonly="true"
                                               ng-keyup="$event.keyCode == 13 && next($index)"
                                               style="width:80px">
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-xs"
                                                ng-click="removeService($index)"><i class="fa fa-close"></i>
                                        </button>
                                    </td>
                                </tr>
                            </table>
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

                                <tr class="text-right" ng-show="bc.pmCard">
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

                                <tr class="text-right" ng-show="bc.bkash">
                                    <td class="f16 fbold">Mobile Number</td>
                                    <td class="f16 fbold">
                                        <input class="text-right black" id="bkash" ng-model="bkash"
                                               ng-keyup="$event.keyCode == 13 && next('bkash')"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                               type="text">
                                    </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="f18 fbold">Total Amount</td>
                                    <td class="f18 fbold"><span>{{totalamount}}</span></td>
                                </tr>
                                <tr class="text-right">
                                    <td class="f16 fbold">(-) Discount</td>
                                    <td class="f14 fbold">TK:
                                        <input class="text-right black" id="discount" style="width: 80px"
                                               ng-keyup="$event.keyCode == 13 && next('discount')"
                                               ng-change="disAmount(discount)"
                                               ng-focus="clear(discount, 'discount')"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                               ng-blur="af('discount')" ng-model="discount"
                                               type="text">

                                        %: <input class="text-right black" id="disPercentage" style="width: 80px"
                                                  ng-keyup="$event.keyCode == 13 && next('disPercentage')"
                                                  ng-change="percentage(disPercentage)"
                                                  ng-focus="clear(disPercentage, 'disPercentage')"
                                                  onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                                  ng-blur="af('disPercentage')" ng-model="disPercentage"
                                                  type="text">
                                    </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="f18 fbold">Net Amount</td>
                                    <td class="f18 fbold"> {{netAmount}} <!-- {{totalamount - discount}} -->
                                    </td>
                                </tr>

                                <tr class="text-right">
                                    <td class="f18 fbold">Payment</td>
                                    <td><input style="font-size: 18px;  height:30px; text-align: center; font-weight: bold" id="paid"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                               ng-keyup="$event.keyCode == 13 && next('paid')"
                                               ng-change="dueAmnt(paid)"
                                               class="text-right black" ng-model="paid" type="text"></td>
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
                            <button type="button" ng-click="bc.saveInvoice()" class="btn btn-outline-success">
                                {{!invoice.id ? 'Save' : 'Update'}} &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i>
                            </button>
                            <button ng-controller="AppController" ng-click="_home()" class= "btn btn-outline-danger"> Close &nbsp; <i class="fa fa-close"></i> </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

</div>