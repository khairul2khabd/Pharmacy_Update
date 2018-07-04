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
        psc">

    <div class="panel panel-success">
        <div class="panel-heading f14 fbold"> Setup Pharmacy </div>
        <div class="panel-body grad">
            <form class="form-horizontal f12 black ff-ver" >

                <div class="form-group"> 
                    <div class="col-sm-3">
                        <button ui-sref="itemcreate({gd:'itcre'})" class="change-icon btn btn-outline-success col-sm-12"><u class="blue">I</u>tem Create
                            &emsp;&emsp; &emsp;&emsp; 
                            <i class="fa fa-"></i>
                            <i class="fa fa-plus-circle"></i>
                        </button>
                    </div>

                    <div class="col-sm-3">
                        <button ui-sref="cat({gd:'cat'})" class="change-icon  btn btn-outline-info col-sm-12">C<u class="blue">a</u>tegory Add
                            &emsp;&emsp; &emsp;&emsp; 
                            <i class="fa fa-"></i>
                            <i class="fa fa-search-plus"></i>
                        </button>
                    </div>

                    <div class="col-sm-3">
                        <button ui-sref="supadd({gd:'sup'})" class="change-icon  btn btn-outline-info col-sm-12"> <u class="blue">S</u>upplier Add
                            &emsp;&emsp; &emsp;&emsp; 
                            <i class="fa fa-"></i>
                            <i class="fa fa-search-plus"></i>
                        </button>
                    </div>

                    <div class="col-sm-3">
                        <button ui-sref="priceupdate" class="change-icon  btn btn-outline-warning col-sm-12 btn-gra-war"> <u class="blue">P</u>rice Update
                            &emsp;&emsp; &emsp;&emsp; 
                            <i class="fa fa-"></i>
                            <i class="fa fa-search-plus"></i>
                        </button>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-3">
                        <button ui-sref="godrec({gd:'gd'})" class="change-icon  btn btn-outline-success col-sm-12"> <u class="blue">G</u>oods Receive
                            &emsp;&emsp; &emsp;&emsp; 
                            <i class="fa fa-"></i>
                            <i  class="fa fa-gear"></i>
                        </button>
                    </div>

                    <div class="col-sm-3">
                        <button class="change-icon  btn btn-outline-primary col-sm-12">Re<u class="blue">o</u>rder/Short list
                            &emsp;&emsp; &emsp; 
                            <i class="fa fa-"></i>
                            <i  class="fa fa-gear"></i>
                        </button>
                    </div>

                    <div class="col-sm-3">
                        <button class="change-icon  btn btn-outline-info col-sm-12">Supplier to <u class="blue">R</u>eturn
                            &emsp;&emsp; &emsp; 
                            <i class="fa fa-"></i>
                            <i class="fa fa-search-plus"></i>
                        </button>
                    </div>

                    <div class="col-sm-3">
                        <button class="change-icon  btn btn-outline-info col-sm-12">dd
                            &emsp;&emsp; &emsp;&emsp; 
                            <i class="fa fa-"></i>
                            <i class="fa fa-search-plus"></i>
                        </button>
                    </div>
                </div>

            </form>
        </div>

    </div>
</div>

</div>