
'use strict';
angular.module('inventoryApp').controller('GrnViewController', ['$scope', '$filter', '$http', '$state', '$stateParams', '$element', 'hotkeys',
    function($scope, $filter, $http, $state, $stateParams, element, hotkeys) {

        var self = this;

        self._getPhuInvoice = _getPhuInvoice;
        self._getPhuInvoiceDetailsById = _getPhuInvoiceDetailsById;
        self._getListPhaItemPrice = _getListPhaItemPrice;
        // PhaItemPrice

        var purInvId = $stateParams.purInvId;
        // console.log(purInvId);

        // model
        self.PurInvoiceModel = {};
        self.PurInvoiceDet = [];
        self.PhaItemPriceList = [];

        /// hot keys
        hotkeys.add({
            combo: 'alt+a',
            description: 'Add row',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                //$scope.addPurc();
            }
        });

        angular.element(document).ready(function() {
            window.document.title = "Goods Receive View";
        });

        // Function call
        _getPhuInvoice(purInvId);
        // _getListPhaItemPrice(purInvId);
        // _getPhuInvoiceDetailsById(purInvId);

        function _getPhuInvoice(purInvId) {
            $http.get(getContextPath() + '/module/pharmacy/getpurinvoice.htm?purInvId=' + purInvId).success(function(response) {
                self.PurInvoiceModel = response;
                console.log(response.detailses);

                self.PurInvoiceDet = response.detailses;
                for (var i = 0; i < self.PurInvoiceDet.length; i++) {
                    for (var k = 0; k < self.PhaItemPriceList.length; k++) {
                        if (self.PurInvoiceDet[i].item.itemId === self.PhaItemPriceList[k].item.itemId) {
                            self.PurInvoiceDet[i].mrp = self.PhaItemPriceList[k].mrp;
                            self.PurInvoiceDet[i].salesPrice = self.PhaItemPriceList[k].salesPrice;
                            self.PurInvoiceDet[i].free = self.PhaItemPriceList[k].free;
                            self.PurInvoiceDet[i].netQty = self.PhaItemPriceList[k].qty;
                        }
                    }
                }

            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function _getListPhaItemPrice(purInvId) {
            $http.get(getContextPath() + '/module/pharmacy/getListPhaItemPriceByInvId.htm?purInvId=' + purInvId).success(function(response) {
                self.PhaItemPriceList = response;
                //console.log(response);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function _getPhuInvoiceDetailsById(purInvId) {
            $http.get(getContextPath() + '/module/pharmacy/getpurinvoicedetails.htm?purInvId=' + purInvId).success(function(response) {
                self.PurInvoiceDet = response;
                for (var i = 0; i < self.PurInvoiceDet.length; i++) {
                    for (var k = 0; k < self.PhaItemPriceList.length; k++) {
                        if (self.PurInvoiceDet[i].item.itemId === self.PhaItemPriceList[k].item.itemId) {
                            self.PurInvoiceDet[i].mrp = self.PhaItemPriceList[k].mrp;
                            self.PurInvoiceDet[i].salesPrice = self.PhaItemPriceList[k].salesPrice;
                            self.PurInvoiceDet[i].free = self.PhaItemPriceList[k].free;
                            self.PurInvoiceDet[i].netQty = self.PhaItemPriceList[k].qty;
                        }
                    }
                }
                //console.log(response);
            }).error(function(data, status, headers) {
                console.log(status);
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

    }]);

 