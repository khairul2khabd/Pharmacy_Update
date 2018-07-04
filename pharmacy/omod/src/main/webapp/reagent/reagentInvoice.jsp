<%-- 
    Document   : reagentmain
    Created on : Jul 18, 2017, 3:26:11 PM
    Author     : Khairul
--%>

<style>
    select, th, a{
        cursor: pointer;
    }
    select{width: 200px; height: 22px}
    .table>tbody>tr>td,
    .table>tfoot>tr>td,
    .table>thead>tr>td{
        padding-top: 2px;
        padding-bottom: 1px;
        line-height: 1.02857143;
        vertical-align: middle;
    }
    .table>tr>th {
        padding:10px;
        background:#eee;
    }
    hr{color: black} 
    .bg-gray{background:#eee}
    .form-control{color:black}
</style> 

<div ng-controller="PurchaseController
        as
        purcon"> 
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title"> Purchase Invoice </span>
        </div>
        <div class="panel-body"> 

            <div class="row">
                <div class="col-sm-10">                     

                    <form ng-submit="purcon.submit()"  name="form" id="myForm" class="form-horizontal f13 black">
                        <div class="form-group">
                            <label class="control-label col-sm-2" >Vendor Name :<span class="red"> *</span></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control input-sm" id="vendorName" name="vendorName" ng-model="purcon.product.vendorName"
                                       ng-change="purcon.product.vendorName = purcon.product.vendorName.toUpperCase();"
                                       required='true' ng-minlength="3"
                                       placeholder="Enter Vendor Name"  />
                            </div>

                            <label class="control-label col-sm-2" >Inv. Date:<span class="red">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control input-sm" id="invoiceDate"
                                       placeholder="Enter Invoice Date"
                                       ng-model="purcon.product.invoiceDate" 
                                       datetime-picker="dd-MM-yyyy" 
                                       is-open="purcon.openCalenderInvoice.open"  enable-time="false" ng-focus="purcon.openCalenderInv($event, 'openCalenderInvoice')"
                                       button-bar="purcon.openCalenderInvoice.buttonBar"   />
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" >Invoice Number:<span class="red"> *</span></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control input-sm" id="invoiceNum" name="invoiceNum" ng-model="purcon.product.invoiceNoManual"
                                       required='true' ng-minlength="3"
                                       placeholder="Enter Invoice Number Manual"/>
                            </div>
                            <label class="control-label col-sm-2" >Invoice Type:<span class="red"> *</span></label>
                            <div class="col-sm-3">
                                <select class="form-control input-sm" name="invoiceType"  id="invoiceType" required='true' 
                                        ng-model="purcon.product.invoiceType" placeholder="Select Invoice Type">
                                    <option value="">---Please select type---</option>
                                    <option value="1">Purchase</option>
                                    <option value="2">Return</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" >Reagent Name:<span class="red"> *</span></label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control input-sm" id="productName" name="productName" ng-model="invoice.productName"
                                       ng-change="invoice.productName = invoice.productName.toUpperCase();"
                                       bs-options="state.productName as state.productName for state in purcon.listReagentModel | filter:$viewValue"
                                       required='true' ng-minlength="1"
                                       ng-blur="getReaMap(invoice.productName)"
                                       placeholder="Enter Product Name" bs-typeahead/>
                            </div>
                            <label class="control-label col-xs-2" >Quantity:<span class="red"> *</span></label>
                            <div class="col-xs-3">
                                <input type="text" class="form-control input-sm" id="qty" name="qty" ng-model="invoice.qty"
                                       onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                       required='true' ng-minlength="1"
                                       placeholder="Enter Quantity"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Price:<span class="red">*</span></label>
                            <div class="col-xs-4"> 
                                <input type="text" class="form-control input-sm" id="price" name="price" ng-model="invoice.price"
                                       onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                       ng-keyup="getUnitPrice()"
                                       required='true' ng-minlength="1" placeholder="Enter Price"/> 

                                <span ng-show="invoice.price > 0"> Unit Price:  
                                    <span class="fbold" ng-bind="invoice.price / invoice.qty | number" *step="0.01"*></span>  &#2547;   </span>
                                <input type="hidden" ng-model="invoice.unitPrice" *step="0.01"*>   
                            </div>

                            <label class="control-label col-sm-2">Per Unit:<span class="red">*</span></label>
                            <div class="col-xs-3"> 
                                <input type="text" class="form-control input-sm" id="perUnit" name="perUnit" ng-model="invoice.perUnit"
                                       onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                                       required='true' ng-minlength="1" ng-keyup="getTotalQuantity()"
                                       placeholder="Ex. 100 ml"/> 
                                <span class="fbold" ng-bind="invoice.perUnit * invoice.qty | number" *step="0.01"*></span>   
                                <span> {{unit}} </span> 
                                <input type="hidden" ng-model="invoice.totalQty" *step="0.01"*>  
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" >Mfg. Date:<span class="red"> *</span></label>
                            <div class="col-sm-3">
                                <input type="date" class="form-control input-sm" id="expDate"
                                       datetime-picker="dd-MM-yyyy" ng-model="invoice.manufacDate"  placeholder="Enter Manufacture Date"
                                       is-open="purcon.openCalender2.open"  enable-time="false" ng-focus="purcon.openCalender3($event, 'openCalender2')"
                                       button-bar="purcon.openCalender2.buttonBar"   />
                            </div>
                            <label class="control-label col-sm-1"></label>
                            <label class="control-label col-sm-2" >Exp Date:<span class="red"> *</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control input-sm" id="expDate"
                                       datetime-picker="dd-MM-yyyy" ng-model="invoice.expDate" placeholder="Enter Expired Date"
                                       is-open="purcon.openCalender.open"  enable-time="false" ng-focus="purcon.openCalender1($event, 'openCalender')"
                                       button-bar="purcon.openCalender.buttonBar"   />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" >Batch Number:<span class="red"> *</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control input-sm" id="batchNo" name="batchNo" ng-model="invoice.batchNo"
                                       required='true' ng-minlength="3"
                                       placeholder="Enter Batch Number"/>
                            </div>


                        </div>

                        <div class="form-group">
                            <label class="col-sm-7" >&nbsp;</label>
                            <div class="col-sm-4 pull-right" style="padding-right:72px">
                                <button type="button" ng-click="addInvoice()" class="btn btn-success btn-sm" ng-disabled="form.$invalid" > 
                                    {{!objectIndex ? 'Add' : 'Update'}} &nbsp; <i class="fa fa-plus" aria-hidden="true"></i> 
                                </button>
                                <button ng-click="purcon.reset()" class="btn btn-warning btn-sm">Reset &nbsp; <i class="fa fa-refresh"></i> </button>
                            </div> 
                        </div>
                    </form>
                </div>
                <div class="col-sm-2 form-control bg-success black f11" ng-show="purcon.reagMapModel.length > 0" style="height:300px; width:18%; position:absolute;   margin-left:75%">
                    <span ng-repeat="p in purcon.reagMapModel">{{p.serviceName}} <br></span> 
                    <hr style="border: 1px solid black; margin-top:0px">
                    <span>Re-Order-Quantity : {{reOrder}} <br> Unit : {{unit}} <br> Category : {{category}} </span>
                </div>
            </div>
            <!-- end purchase Entry form  style="border-style: groove; " -->

            <div class=" col-sm-12" ng-show="invoiceItemList.length > 0"  >
                <hr style="height:5px; margin-top:-8px">
                <table class="table table-bordered table-responsive black" style="border-style: groove; background-color:#fff">
                    <tr>
                        <th class="bg-gray">Sl</th>
                        <th class="bg-gray">Reagent Name</th>
                        <th class="bg-gray">Price</th>
                        <th class="bg-gray">Qty</th>
                        <th class="bg-gray">Batch No</th>
                        <th class="bg-gray">Manu. Date</th>
                        <th class="bg-gray">Exp. Date</th>
                        <th class="bg-gray">Action</th>
                    </tr>
                    <tr ng-repeat="d in invoiceItemList track by $index">
                        <td width="4%">{{$index + 1}}.</td>                       
                        <td> {{d.productName}}</td>
                        <td> {{d.price}}</td>
                        <td> {{d.qty}}</td>
                        <td> {{d.batchNo}}</td>
                        <td>  <span ng-bind="d.manufacDate | date:'dd-MM-yyyy'"> {{d.manufacDate}} </span>	</td>
                        <td> <span ng-bind="d.expDate | date:'dd-MM-yyyy'">{{d.expDate}} </span> </td>
                        <td> 
                            <button type="button" class="btn btn-success btn-xs" ng-click="editItem($index);"><i class="fa fa-pencil-square-o"> </i></button>
                            <button type="button" class="btn btn-danger btn-xs" ng-click="removeItem($index)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right">Total Amount:</td>
                        <td colspan="2"> <input id="totalamount" type="number" step="0.01" readonly="true"/></td>
                        <td colspan="4"> <textarea class="form-control" id="comments" style="height:30px"></textarea></td>
                    </tr>
                </table>

                <button type="button" ng-click="purcon.submit()" class="btn btn-primary btn-sm" > 
                    {{!purcon.product.invoiceId ? 'Save' : 'Update'}} &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i> 
                </button>
            </div>
        </div>
    </div>

    <uib-accordion close-others="oneAtATime">
        <div uib-accordion-group class="panel-info" is-open="status.open">
            <div class="col-lg-12">
                <div class="panel panel-info">
                    <uib-accordion-heading>
                        &nbsp; Invoice List
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
                        </div>

                        <table class="table table-bordered table-hover f13 black" style="margin-top:15px">
                            <thead>
                                <tr>
                                    <th  width="8%">
                                        <a ng-click="sortType = 'id';
                                                sortReverse = !sortReverse">
                                            Inv. ID.
                                            <span ng-show="sortType === 'id' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'id' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'name';
                                                sortReverse = !sortReverse">
                                            Invoice No Manual
                                            <span ng-show="sortType === 'name' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'name' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'proType';
                                                sortReverse = !sortReverse">
                                            Vendor Name
                                            <span ng-show="sortType === 'proType' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'proType ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'reorder';
                                                sortReverse = !sortReverse">
                                            Total Amount
                                            <span ng-show="sortType === 'reorder' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'reorder ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'unit';
                                                sortReverse = !sortReverse">
                                            Comments
                                            <span ng-show="sortType === 'unit' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'unit ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'unit';
                                                sortReverse = !sortReverse">
                                            Invoice Date
                                            <span ng-show="sortType === 'unit' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'unit ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th width="10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr dir-paginate="d in purcon.invoiceListModel| filter:search | orderBy:sortType:sortReverse | itemsPerPage:10 ">
                                    <td><span ng-bind="d.invoiceId"></span></td>
                                    <td> {{d.invoiceNoManual}} </td>
                                    <td> {{d.vendorName}} </td>
                                    <td> {{d.totalAmount| currency}}  </td> <!-- &#2547; tk symbol -->
                                    <td> {{d.comments}} </td>
                                    <td> <span ng-bind="d.invoiceDate | date:'dd-MM-yyyy'"> {{d.invoiceDate}} </span> </td>
                                    <td>
                                        <button type="button" ng-click="sc.invProEdit(d.id)" class="btn btn-success btn-xs">Edit</button>  
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