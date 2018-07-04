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

<div ng-controller="PriceUpdateController
        as
        puc">

    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> Price Update  </div>
        <div class="panel-body grad">

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

        </div>
    </div>


</div>

