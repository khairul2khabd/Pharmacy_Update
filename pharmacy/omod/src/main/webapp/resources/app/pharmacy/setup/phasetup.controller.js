
'use strict';

angular.module('inventoryApp').controller('PhaSetupController', ['$scope', '$http', '$stateParams', '$timeout', '$interval', '$state', 'hotkeys',
    function($scope, $http, $stateParams, $timeout, $interval, $state, hotkeys) {
        var self = this;

        self.success = null;
        self.error = null;
        self.empty = null;
        self.reset = reset;

        self.saveCategory = saveCategory;
        self.getListCategory = getListCategory;
        self.editCategory = editCategory;

        self.saveItem = saveItem;
        self.getItemList = getItemList;
        self.editItem = editItem;

        self.saveSupplier = saveSupplier;
        self.getSupplierList = getSupplierList;
        self.editSupplier = editSupplier;

        //// model
        self.categoryModel = {categoryId: null, category: '', typeId: 0};
        self.ItemModel = {itemId: null, itemName: '', shortId: '', manufacture: '', shelf: '',
            genericName: '', stockMinLvl: 0, stockMaxLvl: 0, medicineFor: '', description: ''};

        self.SupplierModel = {supId: null, supplierName: '', phoneNo: '', address: '', email: '', desc: ''};
        self.categoryList = [];
        self.itemList = [];
        self.supplierList = [];

        $scope.sortType = 'id'; // set the default sort type
        $scope.sortReverse = true;

        $scope.tit = $stateParams.gd;
        $scope.tittleHead = null;

        $scope.viewSize = [{listValue: "5", listName: "view 5"}, {listValue: "10", listName: "view 10"},
            {listValue: "15", listName: "view 15"}, {listValue: "20", listName: "view 20"},
            {listValue: "25", listName: "view 25"}, {listValue: "30", listName: "view 30"},
            {listValue: "35", listName: "view 35"}, {listValue: "40", listName: "view 40"},
            {listValue: "50", listName: "view 50"}];

        // hotkeys
        hotkeys.add({
            combo: 'alt+c',
            description: 'Description goes here',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $state.go('setPharmacy');
            }
        });

        hotkeys.add({
            combo: 'alt+i',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $state.go('itemcreate', {gd: 'itcre'});
            }
        });

        hotkeys.add({
            combo: 'alt+a',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $state.go('cat', {gd: 'cat'});
            }
        });

        hotkeys.add({
            combo: 'alt+s',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $state.go('supadd', {gd: 'sup'});
            }
        });

        hotkeys.add({
            combo: 'alt+p',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                //$state.go('itemcreate', {gd: 'itcre'}); 
            }
        });

        hotkeys.add({
            combo: 'alt+g',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $state.go('godrec', {gd: 'gd'});
            }
        });

        hotkeys.add({
            combo: 'alt+o',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                //$state.go('itemcreate', {gd: 'itcre'});
            }
        });


        angular.element(document).ready(function() {
            if ($scope.tit === 'itcre') {
                $scope.tittleHead = "Item Create";
                $("#itemName").focus();
            }
            else if ($scope.tit === 'cat') {
                $scope.tittleHead = "Category Add";
                $("#category").focus();
            }
            else if ($scope.tit === 'sup') {
                $scope.tittleHead = "Supplier Add";
                $("#supplierName").focus();
            }
            else if ($scope.tit === 'gd') {
                $scope.tittleHead = "Goods Receive";
                $("#itemName").focus();
            }
            else {
                $scope.tittleHead = "Pharmacy Setup";
            }
            window.document.title = $scope.tittleHead;
        });

        // function call
        getListCategory();
        getItemList();
        getSupplierList();

        function getListCategory() {
            $http.get(getContextPath() + '/module/pharmacy/listcategory.htm').success(function(d) {
                self.categoryList = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function saveCategory(category) {
            var cat = $("#category").val();
            if (cat === null || cat === '') {
                alert('Please enter category!!!!!');
                self.empty = 'Please Enter Category!!!';
                return false;
            }
            $http.post(getContextPath() + '/module/pharmacy/createCategory.htm', category).success(function(d) {
                self.error = null;
                self.empty = null;
                self.success = 'This Category Successfully ADDED!!!!';
                reset();
                getListCategory();
            }).error(function(data, status, headers) {
                if (status === 409) {
                    self.error = 'error';
                    self.success = null;
                }
            });
        }

        function editCategory(id) {
            for (var i = 0; i < self.categoryList.length; i++) {
                if (self.categoryList[i].categoryId === id) {
                    self.categoryModel = angular.copy(self.categoryList[i]);
                    break;
                }
            }
        }
        ////// end category

        /////// Start item create
        function getItemList() {
            $http.get(getContextPath() + '/module/pharmacy/listitem.htm').success(function(d) {
                self.itemList = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function saveItem(item) {
            console.log(item);
            //$scope.it={itemId:item.itemId, itemName:item.itemName}
            if (item.itemName === null || item.itemName === '' || item.itemCategory === null
                    || item.itemCategory === '' || item.stockMinLvl === "" || item.stockMaxLvl === "") {
                alert('Please Enter Item name and must select category !!!!!');
                self.empty = 'Please Enter Item name and must select category!!!';
                return false;
            }
            $http.post(getContextPath() + '/module/pharmacy/createItem.htm', item).success(function(d) {
                self.error = null;
                self.empty = null;
                self.success = 'This Item Successfully ADDED!!!!';
                reset();
                getItemList();
            }).error(function(data, status, headers) {
                if (status === 409) {
                    self.error = 'error';
                    self.success = null;
                }
            });
        }

        function editItem(id) {
            for (var i = 0; i < self.itemList.length; i++) {
                if (self.itemList[i].itemId === id) {
                    //console.log(self.itemList[i].itemCategory);
                    self.ItemModel = angular.copy(self.itemList[i]);
                    break;
                }
            }
        }
        /////// End item create

        function saveSupplier(sup) {
            if (sup.supplierName === null || sup.supplierName === '') {
                alert('Please enter Supplier name !!!!!');
                return false;
            }
            $http.post(getContextPath() + '/module/pharmacy/addSupplier.htm', sup).success(function(d) {
                self.error = null;
                self.empty = null;
                self.success = 'Supplier Successfully ADDED!!!!';
                reset();
                getSupplierList();
            }).error(function(data, status, headers) {
                if (status === 409) {
                    self.error = 'error';
                    self.success = null;
                }
            });
        }

        function getSupplierList() {
            $http.get(getContextPath() + '/module/pharmacy/listsupplier.htm').success(function(d) {
                self.supplierList = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function editSupplier(id) {
            for (var i = 0; i < self.supplierList.length; i++) {
                if (self.supplierList[i].supId === id) {
                    self.SupplierModel = angular.copy(self.supplierList[i]);
                    break;
                }
            }
        }

//////////////////////////////////                        /////////////////////////////////////////
        function reset() {
            self.categoryModel = {categoryId: null, category: '', typeId: 0};
            self.ItemModel = {itemId: null, itemName: '', shortId: '', itemCategory: '', manufacture: '', shelf: '',
                genericName: '', stockMinLvl: 0, stockMaxLvl: 0, categoryId: 0, medicineFor: '', description: ''};
            self.SupplierModel = {supId: null, supplierName: '', phoneNo: '', address: '', email: '', desc: ''};
        }

    }]);
 