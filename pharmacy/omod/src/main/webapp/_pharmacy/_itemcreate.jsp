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

<div ng-controller="PhaSetupController
        as
        sc">

    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> Item Create  </div>
        <div class="panel-body grad">
            <p class="alert-danger btn-sm" ng-show="sc.error">
                <strong>Item name already exist! </strong> Please enter another one.
            </p>
            <p class="alert-danger btn-sm" ng-show="sc.empty">
                <strong>{{sc.empty}}</strong>  
            </p>
            <p class="alert-success-kha btn-sm" ng-show="sc.success">
                <strong><i class="fa fa-check-square-o"></i> {{sc.success}} </strong>
            </p>
            <form class="form-horizontal f13 black">
                <div class="form-group mgBottom">
                    <label class=" col-sm-2" >Item Name/Brand Name :<span class="red">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control input-sm" id="itemName"  ng-model="sc.ItemModel.itemName"
                               ng-change="sc.ItemModel.itemName = sc.ItemModel.itemName.toUpperCase();"
                               required='true' ng-minlength="3"
                               placeholder="Item Name"  />
                    </div>
                    <label class="control-label  col-sm-2" >Short Id : </label>
                    <div class=" col-sm-3">
                        <input type="text" class="form-control input-sm" id="shortId"  ng-model="sc.ItemModel.shortId"
                               ng-change="sc.ItemModel.shortId = sc.ItemModel.shortId.toUpperCase();"  placeholder="Short Id"  />
                    </div>
                </div>
                <div class="form-group mgBottom">
                    <label class="  col-sm-2"  >Category: <span class="red">*</span></label>
                    <div class="col-sm-4" >
                        <ui-select ng-model="sc.ItemModel.itemCategory" theme="select2" ng-disabled="sc.disabled" style="min-width: 300px;" title="Choose a person" append-to-body="true">
                            <ui-select-match placeholder="Select a category in the list or search by category/id...">{{sc.ItemModel.itemCategory}}</ui-select-match>
                            <ui-select-choices repeat="person in sc.categoryList | propsFilter: {category: $select.search, categoryId: $select.search}">
                                <div ng-bind-html="person | highlight: $select.search"></div>
                                <!--<small>
                                    category: {{person.category}}
                                    id: <span ng-bind-html="''+person.categoryId | highlight: $select.search"></span>
                                </small> -->
                            </ui-select-choices>
                        </ui-select>
                    </div>
                    <label class="control-label col-sm-2"  >Manufacture: </label>
                    <div class="col-sm-4" >
                        <ui-select ng-model="sc.ItemModel.manufacture" theme="select2" ng-disabled="sc.disabled" style="min-width: 300px;" title="Choose a person" append-to-body="true">
                            <ui-select-match placeholder="Search manufacture">{{sc.ItemModel.manufacture}}</ui-select-match>
                            <ui-select-choices repeat="sup in sc.supplierList | manuFiler: {supplierName: $select.search, supId: $select.search}">
                                <div ng-bind-html="sup | highlight: $select.search"></div>
                                <!--<small>
                                    category: {{person.category}}
                                    id: <span ng-bind-html="''+person.categoryId | highlight: $select.search"></span>
                                </small> -->
                            </ui-select-choices>
                        </ui-select>
                    </div>
                </div>
                <div class="form-group mgBottom">
                    <label class="  col-sm-2" >Generic Name : </label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control input-sm" id="genericName" ng-model="sc.ItemModel.genericName"
                               ng-change="sc.ItemModel.genericName = sc.ItemModel.genericName.toUpperCase();"
                               placeholder="Generic Name"  />
                    </div>
                    <label class="control-label  col-sm-2" >Shelf : </label>
                    <div class=" col-sm-3">
                        <input type="text" class="form-control input-sm" id="shelf"  ng-model="sc.ItemModel.shelf" placeholder="shelf text"  />
                    </div>
                </div>
                <div class="form-group mgBottom">
                    <label class="  col-sm-2"  >Stock Min Level : <span class="red">*</span></label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control input-sm" id="stockMinLvl"   ng-model="sc.ItemModel.stockMinLvl"
                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                               placeholder="Stock Min Level"  />
                    </div>
                    <label class="control-label col-sm-2"  >Stock Max Level : <span class="red">*</span></label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control input-sm" id="stockMaxLvl"   ng-model="sc.ItemModel.stockMaxLvl"
                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 0 || event.charCode == 46'
                               placeholder="Stock Min Level"  />
                    </div>
                </div>
                <div class="form-group">
                    <label class="  col-sm-2" >Medicine For : </label>
                    <div class="col-sm-4">
                        <textarea ng-model="sc.ItemModel.medicineFor" class="col-lg-12" placeholder="Medicine for.."></textarea>
                    </div>
                    <label class="control-label col-sm-2"  >Description : </label>
                    <div class="col-sm-3">
                        <textarea ng-model="sc.ItemModel.description" class="col-lg-12" placeholder="Description.."></textarea>
                    </div>
                </div>
                <div class="col-sm-5">&nbsp;</div>
                <div> 
                    <button type="submit" class="btn btn-outline-success" ng-click="sc.saveItem(sc.ItemModel)" > 
                        {{!sc.ItemModel.itemId ? 'Save' : 'Update'}} &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i> 
                    </button>
                    <button ng-click="sc.reset()" class="btn btn-outline-info"  > 
                        Reset &nbsp; <i class="fa fa-refresh"></i> 
                    </button>
                    <button ui-sref="setPharmacy" type="button" class= "btn btn-outline-danger" title="Alt+C (close)" > <u class="">C</u>lose
                        <i class="fa fa-close"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <uib-accordion close-others="oneAtATime">
        <div uib-accordion-group class="panel-success" is-open="!status.open">
            <div class="col-lg-12">
                <div class="panel panel-success">
                    <uib-accordion-heading>
                        &nbsp; Item List
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
                                            Item Name
                                            <span ng-show="sortType === 'name' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'name' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'shortId';
                                                sortReverse = !sortReverse">
                                            Short Id
                                            <span ng-show="sortType === 'shortId' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'shortId' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'proType';
                                                sortReverse = !sortReverse">
                                            Generic Name
                                            <span ng-show="sortType === 'proType' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'proType ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'reorder';
                                                sortReverse = !sortReverse">
                                            Category
                                            <span ng-show="sortType === 'reorder' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'reorder ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'manuFact';
                                                sortReverse = !sortReverse">
                                            Manufacture
                                            <span ng-show="sortType === 'manuFact' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'manuFact ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'stockMin';
                                                sortReverse = !sortReverse">
                                            Stock Min Level
                                            <span ng-show="sortType === 'stockMin' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'stockMin ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'shelf';
                                                sortReverse = !sortReverse">
                                            Shelf
                                            <span ng-show="sortType === 'shelf' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'shelf ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th width="10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr dir-paginate="d in sc.itemList| filter:search | orderBy:sortType:sortReverse | itemsPerPage:cu.show.listValue ">
                                    <td><span ng-bind="d.itemId"></span></td>
                                    <td> {{d.itemName}} </td>
                                    <td> {{d.shortId}} </td>
                                    <td> {{d.genericName}} </td>
                                    <td> {{d.itemCategory}} </td>
                                    <td> {{d.manufacture}} </td>
                                    <td> {{d.stockMinLvl}} </td>
                                    <td> {{d.shelf}} </td>
                                    <td>
                                        <button type="button" ng-click="sc.editItem(d.itemId)" class="btn btn-success btn-xs"><i class="fa fa-pencil"> </i> Edit</button>  
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

