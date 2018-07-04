<%-- 
    Document   : _category
    Created on : Nov 7, 2017, 11:27:47 PM
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

    <div class="panel panel-info">
        <div class="panel-heading f14 fbold"> Category  </div>
        <div class="panel-body">

            <p class="alert-danger btn-sm" ng-show="sc.error">
                <strong>Product name already exist! </strong> Please enter another one.
            </p>
            <p class="alert-danger btn-sm" ng-show="sc.empty">
                <strong>{{sc.empty}}</strong>  
            </p>
            <p class="alert-success-kha btn-sm" ng-show="sc.success">
                <strong><i class="fa fa-check-square-o"></i> {{sc.success}} </strong>
            </p>

            <form  class="form-horizontal f13 black">
                <div class="form-group">
                    <label class="control-label col-sm-3" >Category :<span class="red">*</span></label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control input-sm" id="category"  ng-model="sc.categoryModel.category"
                               ng-change="sc.categoryModel.category = sc.categoryModel.category.toUpperCase();"
                               required='true' ng-minlength="3"
                               placeholder="Category Name"  />
                    </div>
                </div>
                <input type="hidden" class="form-control input-sm" id="category"  ng-model="sc.categoryModel.typeId" >
                <br>

                <div class="col-sm-2"></div>
                <div class="pull-left"> 
                    <button type="button" ng-click="sc.saveCategory(sc.categoryModel)" class="btn btn-outline-success" > 
                        {{!sc.categoryModel.categoryId ? 'Save' : 'Update'}} &nbsp; <i class="fa fa-floppy-o" aria-hidden="true"></i> 
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
        <div uib-accordion-group class="panel-info" is-open="!status.open">

            <div class="col-lg-12">
                <div class="panel panel-info">
                    <uib-accordion-heading>
                        &nbsp; Category List
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
                                            Category
                                            <span ng-show="sortType === 'name' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'name' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'catType';
                                                sortReverse = !sortReverse">
                                            Category type
                                            <span ng-show="sortType === 'catType' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'catType ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>


                                    <th width="10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr dir-paginate="d in sc.categoryList| filter:search | orderBy:sortType:sortReverse | itemsPerPage:cu.show.listValue ">
                                    <td><span ng-bind="d.categoryId"></span></td>
                                    <td> {{d.category}} </td>
                                    <td> {{d.typeId}} </td>
                                    <td>
                                        <button type="button" ng-click="sc.editCategory(d.categoryId)" class="btn btn-success btn-xs"><i class="fa fa-pencil"> </i> Edit</button>  
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

