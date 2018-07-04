<%-- 
    Document   : createproduct
    Created on : Jul 16, 2017, 10:36:37 AM
    Author     : Khairul
--%>

<style>
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
</style>   

<div ng-controller="SetupController
            as
            sc">

    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> Product Entry  </div>
        <div class="panel-body">

            <p class="alert-danger btn-sm" ng-show="sc.error">
                <strong>Product name already exist! </strong> Please enter another one.
            </p>
            <p class="alert-success-kha btn-sm" ng-show="sc.success">
                <strong><i class="fa fa-check-square-o"></i> {{sc.success}} </strong>
            </p>

            <form ng-submit="sc.submit()" name="form" id="myForm" class="form-horizontal f13 black">
                <div class="form-group">
                    <label class="control-label col-sm-3" >Product Name :<span class="red">*</span></label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control input-sm" id="productName" name="productName" ng-model="sc.product.productName"
                               ng-change="sc.product.productName = sc.product.productName.toUpperCase();"
                               required='true' ng-minlength="3"
                               placeholder="Enter Product Name"  />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3"  >Product Type:<span class="red">*</span></label>
                    <div class="col-sm-3">								   
                        <select class="form-control hand" name="productType"  ng-model="sc.product.productType" required>
                            <option value="">--Select Product Type--</option>
                            <option value="reagent">Reagent</option>
                            <option value="tube">Tube</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3"  >Product Category:</label>
                    <div class="col-sm-3">								   
                        <select class="form-control hand" name="productCategory"  ng-model="sc.product.productCategory">
                            <option value="">--Select Product Category--</option>
                            <option value="bottle">Bottle</option>
                            <option value="kit">Kit</option>
                            <option value="each">Each</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3"  >Re-order Quantity:<span class="red">*</span></label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control input-sm" id="reOrderQty" name="reOrderQty" ng-model="sc.product.reOrderQty"
                               required='true' onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                               placeholder="Enter Re-order Quantity"  />
                    </div>

                    <label class="control-label col-sm-1" style="width:100px; margin-left:-10px" >Life Time:<span class="red">*</span></label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control input-sm" id="reagentLifeTime" name="reagentLifeTime" ng-model="sc.product.reagentLifeTime"
                               required='true' onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0'
                               placeholder="Enter Life time"  />
                    </div>
                </div>

                <!--  ng-keypress="isNumberKey($event)" -->
                <div class="form-group">
                    <label class="control-label col-sm-3"  >Unit:<span class="red">*</span></label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control input-sm" id="unit" name="unit" ng-model="sc.product.unit"
                               required='true' 
                               placeholder="Enter Unit"  />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3"  >Service Mapping:<span class="red">*</span></label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control input-sm f12 hand"
                               bs-options="state.name as state.name for state in sc.serviceList | filter:$viewValue"
                               id="serviceName" 
                               ng-model="serObject.serName"
                               typeahead-editable="false"
                               ng-keyup="$event.keyCode === 13 && addService()"
                               ng-mouseenter="addService11111()"
                               placeholder="Enter Investigation" bs-typeahead>
                    </div>

                    <div class=" col-sm-2">
                        <button type="button" ng-click="addService()" class="btn btn-success btn-sm" ng-show="serObject.serName.length > 1">
                            {{!objectIndex? 'Add':'Update'}} &nbsp;  <i class="fa fa-plus"></i>
                        </button>
                    </div>
                    <p class="btn btn-danger btn-xs disabled col-sm-2" ng-show="isNotExist"> It's not in exist!!!! </p>
                </div>

                <div class="form-group">
                    <div class="col-sm-3"></div>

                    <div class="col-sm-5">
                        <table class="table f12" width="100%">
                            <tr ng-repeat="d in mappingList track by $index">
                                <td>{{$index + 1}}.</td>
                                <td> {{d.serName}}</td>
                                <td ><div class="btn-group pull-right" >
                                        <button type="button" class="btn btn-danger btn-xs" ng-click="removeService($index)"><i class="fa fa-close"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <table class="table f12" width="100%" ng-show="sc.reaMap.length > 0">
                            <tr ng-repeat="d in sc.reaMap track by $index">
                                <td>{{$index + 1}}.</td>
                                <td> {{d.serviceName}}</td>
                                <td ><div class="btn-group pull-right" >
                                        <button type="button" class="btn btn-danger btn-xs" ng-click="sc.deleteInvReaMap(d.id, d.ip.id)"><i class="fa fa-trash"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="pull-right">
                    <button type="submit" class="btn btn-primary" ng-disabled="form.$invalid" > 
                        {{!sc.product.id ? 'Save' : 'Update'}} &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i> 
                    </button>
                    <button ng-click="sc.reset()" class="btn btn-info"  > 
                        Reset &nbsp; <i class="fa fa-refresh"></i> </button>
                </div>
            </form>
        </div>
    </div>

    <uib-accordion close-others="oneAtATime">
        <div uib-accordion-group class="panel-success" is-open="status.open">

            <div class="col-lg-12">
                <div class="panel panel-success">
                    <uib-accordion-heading>
                        &nbsp; Product List
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
                                <tr>
                                    <th>
                                        <a ng-click="sortType = 'id';
                                                    sortReverse = !sortReverse">
                                            ID.
                                            <span ng-show="sortType === 'id' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'id' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'name';
                                                    sortReverse = !sortReverse">
                                            Product Name
                                            <span ng-show="sortType === 'name' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'name' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'proType';
                                                    sortReverse = !sortReverse">
                                            Product type
                                            <span ng-show="sortType === 'proType' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'proType ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'reorder';
                                                    sortReverse = !sortReverse">
                                            Re-order Qty
                                            <span ng-show="sortType === 'reorder' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'reorder ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'unit';
                                                    sortReverse = !sortReverse">
                                            Unit
                                            <span ng-show="sortType === 'unit' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'unit ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th width="10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr dir-paginate="d in sc.listInvProductModel| filter:search | orderBy:sortType:sortReverse | itemsPerPage:cu.show.listValue ">
                                    <td><span ng-bind="d.id"></span></td>
                                    <td> {{d.productName}} </td>
                                    <td> {{d.productType}} </td>
                                    <td> {{d.reOrderQty}} </td>
                                    <td> {{d.unit}} </td>
                                    <td>
                                        <button type="button" ng-click="sc.invProEdit(d.id)" class="btn btn-success btn-xs"><i class="fa fa-pencil"> </i> Edit</button>  
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

