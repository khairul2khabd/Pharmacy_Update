/* global angular */

'use strict';

//angular.module('inventoryApp').controller('ViewBillController', function($http, $scope, $state, $rootScope, hotkeys) {
angular.module('inventoryApp').controller('ViewBillController', ['$scope', '$http', '$state', '$stateParams', 'hotkeys',
    function($scope, $http, $state, $stateParams, hotkeys) {

        var self = this;

        self.getPhaSale = getPhaSale;
        self.getListPhaSaleDet = getListPhaSaleDet;
        self.getListPhaSaleColl = getListPhaSaleColl;

        var saleInvoiceId = $stateParams.saleInvoiceId;


        /// Model
        self.phaSale = {};
        self.phaSaleDet = [];
        self.phaSaleColl = [];

        // console.log(saleInvoiceId);

        angular.element(document).ready(function() {
            window.document.title = "View Bill";
            $scope.printDiv();
        });

        $scope.isCollapsed = true;
        $scope.ShowHide = function() {
            // $scope.IsVisible = $scope.IsVisible ? false : true;
            $scope.isCollapsed = true;
        };

        /// hot keys

        hotkeys.add({
            combo: 'ctrl+down',
            description: 'Description goes here',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $scope.next();
            }
        });

        //// function call
        getPhaSale(saleInvoiceId);
        getListPhaSaleDet(saleInvoiceId);
        getListPhaSaleColl(saleInvoiceId);


        /// function start

        function getPhaSale(saleInvoiceId) {
            $http.get(getContextPath() + '/module/pharmacy/getPhaSaleByInvoiceId.htm?saleInvoiceId=' + saleInvoiceId).success(function(d) {
                self.phaSale = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(data);
            });
        }

        function getListPhaSaleDet(saleInvoiceId) {
            $http.get(getContextPath() + '/module/pharmacy/listPhaSaleDetByInvoiceId.htm?saleInvoiceId=' + saleInvoiceId).success(function(d) {
                self.phaSaleDet = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(data);
            });
        }

        function getListPhaSaleColl(saleInvoiceId) {
            $http.get(getContextPath() + '/module/pharmacy/listPhaSaleCollectByInvoiceId.htm?saleInvoiceId=' + saleInvoiceId).success(function(d) {
                self.phaSaleColl = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(data);
            });
        }


        $scope.printDiv = function() {
            // window.print();
            var printer = window.open('left=5', 'top=5', 'width=200,height=200');
            printer.document.open("text/html");
            printer.document.write(document.getElementById('printDiv').innerHTML);
            printer.print();
            printer.document.close();
            printer.window.close();
            $scope.newBill();
        };

        $scope.newBill = function() {
            //$state.go('newbill');
            $state.go('secHome');
        };

    }]);
