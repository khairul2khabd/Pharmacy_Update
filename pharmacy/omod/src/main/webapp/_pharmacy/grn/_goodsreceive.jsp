<%-- 
    Document   : createproduct
    Created on : Jul 16, 2017, 10:36:37 AM
    Author     : Khairul
--%>
<style>
    table {
        width: 100%;
        background-color: #eee;
        border-collapse:collapse;
        margin: auto;
        border: 1px solid black;
        table-layout: fixed;
    }
    td {
        text-align: center; 
        border: 1px solid green;
    }
    td input {
        width: 100%;
        box-sizing: border-box;
        border: 1px solid white;
    }
    .table>tbody>tr>td
    {
        padding-top: 2px;
        padding-bottom: 1px;
        line-height: 1.02857143;
        vertical-align: middle;
    }
    .input-sm{
        font-family: "Tahoma"
    }
</style>  

<div ng-controller="GoodsReceiceController as gr">

    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> Goods Receive  </div>
        <div class="panel-body">

            <p class="alert-danger btn-sm" ng-show="gr.error">
                {{gr.error}}
            </p>

            <form class="form-horizontal f14 black ff-gar" id="purcaseForm">
                <div class="form-group mgBottom">
                    <label class="control-label col-sm-2" >Supplier/Company Name :<span class="red">*</span></label>
                    <div class="col-sm-3">
                        <ui-select ng-model="gr.GRModel.supplierName" theme="select2" ng-disabled="sc.disabled" style="min-width: 300px;" title="Choose a person" append-to-body="true">
                            <ui-select-match placeholder="Search supplier">{{gr.GRModel.supplierName}}</ui-select-match>
                            <ui-select-choices repeat="sup in gr.supplierList | manuFiler: {supplierName: $select.search, supId: $select.search}">
                                <div ng-bind-html="sup | highlight: $select.search"></div>
                                <!--<small> itemId   itemName
                                    category: {{person.category}}
                                    id: <span ng-bind-html="''+person.categoryId | highlight: $select.search"></span>
                                </small> -->
                            </ui-select-choices>
                        </ui-select>
                    </div>
                    <label class="control-label  col-sm-2" >Invoice No : <span class="red">*</span></label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control input-sm" id="invoiceNo"  
                               ng-model="gr.GRModel.invoiceNo" placeholder="Invoice No"  />
                    </div>
                </div>
                <div class="form-group mgBottom">
                    <label class="control-label col-sm-2" >Ivoice Date :<span class="red">*</span></label>
                    <div class="col-sm-3">
                        <input type="date" class="form-control input-sm" id="invoiceDate"  ng-model="gr.GRModel.invoiceDate" />
                    </div>
                    <label class="control-label  col-sm-2" >Purchase Status :  </label>
                    <div class=" col-sm-3">
                        <select class="form-control hand input-sm" name="invoiceType"  id="invoiceType" required='true' 
                                ng-model="gr.GRModel.purStatus" placeholder="Select Invoice Type">
                            <option value="">--- Please select purchase status ---</option>
                            <option value="1">Open</option>
                            <option value="2">Close</option>
                        </select>
                    </div>
                </div>
            </form>

            <table class="black f11">
                <tr style="font-weight: bold; height:28px; background:#75cb9d; font-size:12px">
                    <td width="4%">Sl No</td>
                    <td width="16%" >Item Name</td>
                    <!--<td>Short Id</td> -->
                    <td width="7%">Batch</td>
                    <td width="8%">Expire</td>
                    <td style="padding:2.5px; width:9%;" colspan="2">
                        <table>
                            <tr style="font-weight: bold; background:#75cb9d"><td colspan="2"> Each Box </td></tr> 
                            <tr style="font-weight: bold; background:#75cb9d"><td> Pack </td> <td> Size </td></tr> 
                        </table>
                    </td>
                    <td width="4%">Qty</td>
                    <td width="5%">Net Qty</td>
                    <td width="4%">Free</td>
                    <td width="5%">Unit TP</td>
                    <td width="6%">Total Amount</td>
                    <td width="5%">MRP</td>
                    <td width="5%">Sales Price</td>
                    <td width="4%">Vat (%)</td>
                    <td style="width:5%; display:none">Vat amount</td>
                    <td width="5%">Discount (%)</td>
                    <td style="width:5%; display:none">Discount amount</td>
                    <td width="6%">Net Amount</td>
                    <td width="5%">Action</td>
                </tr>

                <tr ng-repeat="pur in purItemList">
                    <td>{{$index + 1}}</td>
                    <td>
                        <span editable-text="pur.itemName" e-ng-model="pur.itemName" e-id="itemName{{$index + 1}}" e-name="itemName"  onbeforesave="checkName($data, pur.id)"
                              e-bs-options="state.itemName as state.itemName for state in gr.itemList | filter:$viewValue"
                              e-ng-keyup="$event.keyCode == 13 && next('itemName', pur.id)"
                              e-form="rowform" e-bs-typeahead  e-required>
                            {{ pur.itemName || 'empty' }}
                        </span>  
                    </td>
                    <td>
                        <span editable-text="pur.batch" e-name="batch" e-id="batch{{$index + 1}}" e-form="rowform" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('batch', {{$index + 1}})"  e-required>
                            {{ pur.batch || 'empty' }}
                        </span>
                    </td>
                    <td>
                        <span editable-date="pur.expire" e-name="expire" e-id="expire{{$index + 1}}" e-form="rowform" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('expire', {{$index + 1}})"  e-required>
                            {{ pur.expire | date:'MM/dd/yyyy' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.pack" e-name="pack" e-id="pack{{$index + 1}}" e-form="rowform" style="width:50%" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('pack',{{$index + 1}})"  e-required>
                            {{ pur.pack || '0' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.size" e-name="size" e-form="rowform" e-id="size{{$index + 1}}" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('size',{{$index + 1}})" e-required>
                            {{ pur.size || '0' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.qty" e-ng-model="pur.qty" e-id="qty{{$index + 1}}" e-name="qty" e-form="rowform" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('qty',{{$index + 1}})" e-ng-change="qtyXtp($data, pur.id)"
                              e-ng-keypress='return ($event.charCode >= 48 && $event.charCode <= 57) || $event.charCode == 0 || $event.charCode == 46'
                              e-ng-focus="qtyXtp($data, pur.id)"  e-required>
                            {{ pur.qty || '0' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.netQty" e-ng-model="pur.netQty" e-id="netQty{{$index + 1}}" e-name="netQty" e-form="rowform" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('netQty',{{$index + 1}})" e-ng-change="qtyXtp($data, pur.id)"
                              e-ng-keypress='return ($event.charCode >= 48 && $event.charCode <= 57) || $event.charCode == 0 || $event.charCode == 46'
                              e-ng-focus="qtyXtp($data, pur.id)"  e-required>
                            {{ pur.netQty || '0' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.free" e-name="free" e-form="rowform" e-id="free{{$index + 1}}" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('free',{{$index + 1}})" e-required>
                            {{ pur.free || '0' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.unitTP" ng-model="pur.unitTP"  e-id="unitTP{{$index + 1}}" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('unitTP',{{$index + 1}})"
                              e-ng-change="qtyXtp($data, pur.id)" e-ng-focus="qtyXtp($data, pur.id)" e-name="unitTP" e-form="rowform"  e-required>
                            {{ pur.unitTP || '0' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.totalAmount" e-id="totalAmount{{$index + 1}}" e-name="totalAmount" e-form="rowform" e-readonly='true'
                              e-ng-keyup="$event.keyCode == 13 && dyNe('totalAmount',{{$index + 1}})" e-required>
                            {{ pur.totalAmount || '0.00' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.mrp" e-id="mrp{{$index + 1}}" e-name="mrp" e-form="rowform"  
                              e-ng-keyup="$event.keyCode == 13 && dyNe('mrp',{{$index + 1}})" e-required>
                            {{ pur.mrp || '0.00' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.salesPrice" e-id="salesPrice{{$index + 1}}" e-name="salesPrice" e-form="rowform"  
                              e-ng-keyup="$event.keyCode == 13 && dyNe('salesPrice',{{$index + 1}})" e-required>
                            {{ pur.salesPrice || '0.00' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.vat" e-name="vat" e-id="vat{{$index + 1}}" e-form="rowform" 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('vat',{{$index + 1}})"  e-ng-focus="calVatAmount($data, pur.id)"
                              e-ng-change="calVatAmount($data, pur.id)"  e-required>
                            {{ pur.vat || '0.00' }}
                        </span>
                    </td>
                    <td style="display:none">
                        <span editable-text="pur.vatAmount" e-name="vatAmount" e-id="vatAmount{{$index + 1}}" e-form="rowform" e-readonly='true'
                              e-ng-keyup="$event.keyCode == 13 && dyNe('vatAmount',{{$index + 1}})"  e-required>
                            {{ pur.vatAmount || '0.00' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.dicount" e-name="dicount" e-id="dicount{{$index + 1}}" e-form="rowform"  
                              e-ng-keyup="$event.keyCode == 13 && dyNe('dicount',{{$index + 1}})"  e-ng-focus="calDisAmount($data, pur.id)"
                              e-ng-change="calDisAmount($data, pur.id)" e-required>
                            {{ pur.dicount || '0.00' }}
                        </span>
                    </td>
                    <td style="display:none">
                        <span editable-text="pur.discountAmount" e-name="discountAmount" e-id="discountAmount{{$index + 1}}" e-form="rowform"  e-readonly='true' 
                              e-ng-keyup="$event.keyCode == 13 && dyNe('discountAmount',{{$index + 1}})" e-required>
                            {{ pur.discountAmount || '0.00' }}
                        </span>
                    </td>
                    <td>
                        <span editable-text="pur.netAmount" e-name="netAmount" e-id="netAmount{{$index + 1}}" 
                              e-form="rowform" e-readonly='true' e-ng-keyup="$event.keyCode == 13 && dyNe('netAmount',{{$index + 1}})"  e-required>
                            {{ pur.netAmount || '0.00' }}
                        </span>
                    </td>
                    <td style="white-space: nowrap">
                        <!-- form -->
                        <form editable-form id="abc" name="rowform" onbeforesave="savePurc($data, pur.id)" ng-show="rowform.$visible" class="form-buttons form-inline" shown="inserted == pur">
                            <button type="submit" id="formSave" ng-disabled="rowform.$invalid" class="btn btn-primary btn-xs">
                                <i class="fa fa-check"></i>  
                            </button>
                            <button type="button" ng-disabled="rowform.$waiting" ng-click="removePurc($index)" class="btn btn-danger btn-xs">
                                <i class="fa fa-close"></i>
                            </button>
                        </form>
                        <div class="buttons" ng-show="!rowform.$visible">
                            <button class="btn btn-primary btn-xs" ng-click="rowform.$show()"> <i class="fa fa-pencil"></i>  </button>
                            <button class="btn btn-danger btn-xs" ng-click="removePurc($index)"> <i class="fa fa-close"></i> </button>
                        </div>  
                    </td>
                </tr>
                <tr style="font-size:15px; font-weight:bold"> 
                    <td colspan="10" style="text-align:right; font-weight:bold" > Total : </td>
                    <td>{{tradePrice|| 0}}</td>
                    <td   colspan="2">  <span style="display:none"> {{totVatAmount| currency:''}} </span> </td>
                    <td   colspan="2"> <span style="display:none"> {{totDisAmount| currency:''}} </span> </td>
                    <td colspan="1">{{totNetAmount| currency:''}}</td>
                    <td colspan="1">&nbsp;</td>
                </tr>
                <tr> 
                    <td><button class="btn btn-success btn-xs" ng-click="addPurc()"><u class="">A</u>dd row <i class="fa fa-plus"></i></button></td>
                </tr>
            </table>
            <br>

            <div class="col-sm-5">&nbsp;</div>
            <div class="pull-left"> 
                <button type="button" ng-click="savePurchase(gr.GRModel)" title="Alt+s (Save)" class="btn btn-outline-success" > 
                    <u class="">S</u>ave &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i> 
                </button>
                <button ng-click="sc.reset()" class="btn btn-outline-info"  > 
                    Reset &nbsp; <i class="fa fa-refresh"></i> 
                </button>
                <button ui-sref="setPharmacy" type="button" class= "btn btn-outline-danger" tittle="Alt+C (close)" > <u class="">C</u>lose
                    <i class="fa fa-close"></i>
                </button>
            </div>

        </div>
    </div>

    <uib-accordion close-others="oneAtATime">
        <div uib-accordion-group class="panel-success" is-open="status.isOpen" is-disabled="status.isFirstDisabled">
            <div class="col-lg-12">
                <div class="panel panel-success">
                    <uib-accordion-heading>
                        &nbsp; Goods Receive List
                        <i class="pull-left glyphicon" ng-class="{'glyphicon-triangle-bottom': status.open,  'glyphicon-triangle-right': !status.open}"></i> 
                    </uib-accordion-heading>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <input type="text"  class="form-control" ng-model="search" />
                                    <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i> </span>
                                </div>
                            </div>
                            <div class="col-sm-6"></div>
                            <div class="col-sm-2">
                                <select class="form-control hand"
                                        ng-init="cu.show = { listValue: '5'}"
                                        ng-model="cu.show" 
                                        ng-options="list.listName for list in viewSize track by list.listValue">
                                </select>
                            </div>
                        </div>

                        <table class="table table-hover table-bordered black f13" style="margin-top:15px">
                            <thead>
                                <tr style="padding:10px; background:#eee;">
                                    <th width="6%">
                                        <a ng-click="sortType = 'id';
                                                sortReverse = !sortReverse">
                                            Inv No.
                                            <span ng-show="sortType === 'id' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'id' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th width="20%">
                                        <a ng-click="sortType = 'name';
                                                sortReverse = !sortReverse">  Supplier/Company Name
                                            <span ng-show="sortType === 'name' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'name' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'invnomanual';
                                                sortReverse = !sortReverse">  Inv. No Manual
                                            <span ng-show="sortType === 'invnomanual' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'invnomanual' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th class="text-right">
                                        <a ng-click="sortType = 'tradePrice';
                                                sortReverse = !sortReverse"> Trade Price
                                            <span ng-show="sortType === 'tradePrice' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'tradePrice' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th class="text-right">
                                        <a ng-click="sortType = 'vat';
                                                sortReverse = !sortReverse"> Vat Amount
                                            <span ng-show="sortType === 'vat' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'vat' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th class="text-right">
                                        <a ng-click="sortType = 'discount';
                                                sortReverse = !sortReverse"> Discount Amount
                                            <span ng-show="sortType === 'discount' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'discount' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th class="text-right">
                                        <a ng-click="sortType = 'netAmount';
                                                sortReverse = !sortReverse"> Invoice Amount
                                            <span ng-show="sortType === 'netAmount' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'netAmount' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th class="text-center">
                                        <a ng-click="sortType = 'invDate';
                                                sortReverse = !sortReverse"> Invoice Date
                                            <span ng-show="sortType === 'invDate' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'invDate' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th class="text-center" width="10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr dir-paginate="d in gr.PurInvoiceDetails| filter:search | orderBy:sortType:sortReverse | itemsPerPage:cu.show.listValue " style="background:#FFF">
                                    <td  >{{$index + 1}}</td>
                                    <td class="text-left"> {{d.supplierName}} </td>
                                    <td class="text-center"> {{d.invoiceNo}} </td>
                                    <td class="text-right"> {{d.tradePrice}} </td>
                                    <td class="text-right"> {{d.vat}} </td>
                                    <td class="text-right"> {{d.discount}} </td>
                                    <td class="text-right"> {{d.invoiceAmount}} </td>
                                    <td> {{d.invoiceDate| date:'dd-MMM-yyyy'}} </td>
                                    <td>
                                        <button type="button" ng-click="grnView(d.phaInvId)" class="btn btn-success btn-xs"><i class="fa fa-eye"> </i> View </button>  
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
                        <dir-pagination-controls
                            max-size="10"
                            direction-links="true"
                            boundary-links="true" >
                        </dir-pagination-controls>
                    </div>
                </div>
            </div> 
        </div>
    </uib-accordion>
</div>
