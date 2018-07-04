
'use strict';

angular.module('inventoryApp').controller('PharmacyController', ['$scope', '$http', '$state', function($scope, $http, $state) {
        var self = this;

        self._checkSession = _checkSession;
        self.getPhaItemPriceList = getPhaItemPriceList;
        self.searchBill = searchBill;
        self.getRecentVoucherList = getRecentVoucherList;

        //// model
        self.PharmacyItemList = [];
        self.RecentVoucher = [];

        $scope.sortType = 'id'; // set the default sort type
        $scope.sortReverse = true;

        $scope.isNumberKey = function($event) {
            console.log($event.charCode);
        };

        $scope.viewSize = [{listValue: "5", listName: "view 5"},
            {listValue: "10", listName: "view 10"},
            {listValue: "15", listName: "view 15"},
            {listValue: "20", listName: "view 20"},
            {listValue: "25", listName: "view 25"},
            {listValue: "30", listName: "view 30"},
            {listValue: "35", listName: "view 35"},
            {listValue: "40", listName: "view 40"},
            {listValue: "50", listName: "view 50"}];

        // function call
        _checkSession();
        getPhaItemPriceList();
        getRecentVoucherList();

        angular.element(document).ready(function() {
            window.document.title = "Pharmacy";
        });

        function _checkSession() {
            $http.get(getContextPath() + '/module/pharmacy/checkSession.htm').success(function(d) {
                if (d === 0) {
                    alert('session is expired!!!');
                    window.location.href = getContextPath() + "/logout";
                }
            }).error(function(status) {
                console.log(status);
            });
        }

        function getPhaItemPriceList() {
            $http.get(getContextPath() + '/module/pharmacy/getListPhaItemPrice.htm').success(function(d) {
                self.PharmacyItemList = d;
                // console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function getRecentVoucherList() {
            $http.get(getContextPath() + '/module/pharmacy/listPhaSale.htm').success(function(d) {
                self.RecentVoucher = d;
                //  console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function searchBill() {
            $http.get(getContextPath() + '/module/pharmacy/getListPhaItemPrice.htm').success(function(d) {
                self.PharmacyItemList = d;
                // console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        $scope.dueCollect = function(saleInvoiceId) {
            $state.go('duecollect', {saleInvoiceId: saleInvoiceId});
        };

        $scope.viewInvoice = function(saleInvoiceId) {
            $state.go('viewbill', {saleInvoiceId: saleInvoiceId});
        };

    }]);
