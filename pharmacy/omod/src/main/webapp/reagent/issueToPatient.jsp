<%-- 
    Document   : issueToPatient
    Created on : Aug 28, 2017, 11:45:20 AM
    Author     : Khairul
--%>

<style>
    select, th, tr, a{ cursor: pointer; }
    select{width: 200px; height: 22px}
    .table>tbody>tr>td,
    .table>tfoot>tr>td,
    .table>thead>tr>td{
        padding-top: 3px;
        padding-bottom: 2px;
        line-height: 1.02857143;
        vertical-align: middle;
    }
    .table>tr>th {
        padding:10px;
        background:#eee;
    }
    hr{color: black} 
    .bg-gray{background:#eee; padding-top:1px;  padding-bottom: 2px;}
    .form-control{color:black}
    .label{padding:5px}
    .bg-c-default{ color:#000; background-color: #fff; border:1px solid #eee}
    .bg-c-primary{ color:#000; background-color: #97f6fa}
    .bg-c-success{ color:#000; background-color: #07e87f;}	 
</style> 

<div ng-controller="IssueController
        as
        ic"> 
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title"> Reagent Issue </span>
        </div>
        <div class="panel-body"> 
            <div class="row">
                <div class="col-sm-12">                     
                    <form  name="form" id="myForm" class="form-horizontal f13 black" ng-show="ic.viewPatientModel.length > 0">
                        <span ng-show="ic.viewPatientModel.length > 0">	
                            <label class="col-sm-4">Patient Name : {{pn}}</label> <label class="  col-sm-4">Patient Id : {{pid}}</label>
                            <label class="  col-sm-4">Bill Id : {{billId}}</label> 
                        </span>
                        <table class="table table-bordered" ng-show="ic.viewPatientModel.length > 0">
                            <tr>
                                <th class="bg-gray">Test Name</th>
                                <th class="bg-gray">Reagent Name</th>
                                <th class="bg-gray">Batch</th>
                                <th class="bg-gray">Current Qty.</th>
                                <th class="bg-gray">Issue Qty.</th>
                            </tr>
                            <tr ng-repeat="d in ic.viewPatientModel">
                                <td> {{d.serviceName}} <input ng-model="d.id" type="hidden"/>  </td>
                                <td> {{d.reagentName}}  </td>
                                <td> 
                                    <select ng-model="batchNo" ng-change="changedValue(batchNo, d.id)" >
                                        <option value="">Select Batch No</option>
                                        <option ng-repeat="a in d.bNo.split('#')" value="{{a}}">{{a}}</option>
                                    </select>
                                </td>
                                <td>{{d.ava}} {{d.unit}}</td>
                                <td> <input type="text" ng-model="d.issue" required='true' ng-minlength="1"> </td>
                            </tr>
                        </table>
                        <div class="col-sm-10"></div>
                        <div class="col-sm-2">
                            <button class="btn btn-primary btn-sm" ng-disabled="form.$invalid" ng-click="ic.submit(ic.viewPatientModel)">Save</button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div> 
    <!--panel info end-->

    <uib-accordion close-others="oneAtATime">
        <div uib-accordion-group class="panel-info" is-open="status.isFirstOpen" is-disabled="status.isFirstDisabled">
            <div class="col-lg-12">
                <div class="panel panel-info">
                    <uib-accordion-heading>
                        &nbsp; Patient Queue for Issue
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
                            <div class="col-lg-4">
                                <span class="label bg-c-default">First Stage</span>
                                <span class="label bg-c-primary">Second Stage</span>
                                <span class="label bg-c-success">Final Stage</span>
                            </div>
                        </div>

                        <table class="table table-bordered table-hover f13 black" style="margin-top:15px">
                            <thead>
                                <tr>
                                    <th  width="8%">
                                        <a ng-click="sortType = 'id';
                                                sortReverse = !sortReverse">
                                            Sl No
                                            <span ng-show="sortType === 'id' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'id' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'name';
                                                sortReverse = !sortReverse">
                                            Patient Id.
                                            <span ng-show="sortType === 'name' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'name' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'proType';
                                                sortReverse = !sortReverse">
                                            Patient Name
                                            <span ng-show="sortType === 'proType' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'proType ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'reorder';
                                                sortReverse = !sortReverse">
                                            Status
                                            <span ng-show="sortType === 'reorder' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'reorder ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'unit';
                                                sortReverse = !sortReverse">
                                            Bill Id
                                            <span ng-show="sortType === 'unit' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'unit ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th>
                                        <a ng-click="sortType = 'unit';
                                                sortReverse = !sortReverse">
                                            Bill Date
                                            <span ng-show="sortType === 'unit' && !sortReverse" class="fa fa-caret-down"></span>
                                            <span ng-show="sortType === 'unit ' && sortReverse" class="fa fa-caret-up"></span>
                                        </a>
                                    </th>
                                    <th width="10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr dir-paginate="d in ic.listIssuePatient| filter:search | orderBy:sortType:sortReverse | itemsPerPage:10"
                                    ng-class="{'bg-c-info':d.stage === 1, 'bg-c-primary fbold':d.stage === 2, 'bg-c-success fbold':d.stage === 3}" >
                                    <td>{{d.id}}.</td>
                                    <td>  {{d.identifier}}  </td>
                                    <td> {{d.fullname}} </td>
                                    <td  >
                                        <span ng-if="d.stage === 1"> Bill Complete </span>
                                        <span ng-if="d.stage === 2"> Laboratory Accepted </span>
                                        <span ng-if="d.stage === 3"> Report Done </span>
                                    </td> <!-- &#2547; tk symbol  {{d.totalAmount| currency}}   -->
                                    <td> {{d.billId}} </td>
                                    <td> <span ng-bind="d.createdDate | date:'dd-MM-yyyy'"> {{d.createdDate}} </span> </td>
                                    <td>
                                        <button type="button" ng-click="ic.viewIssuePatient(d.billId, d.fullname, d.identifier)" class="btn btn-warning btn-xs">Issue</button>  
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
