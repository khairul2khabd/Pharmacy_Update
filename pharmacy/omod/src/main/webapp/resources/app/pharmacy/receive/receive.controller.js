
'use strict';
angular.module('inventoryApp').controller('GoodsReceiceController', ['$scope', '$filter', '$http', '$state', '$element', 'hotkeys', function($scope, $filter, $http, $state, element, hotkeys) {

        var self = this;

        self.error = null;

        self.getSupplierList = getSupplierList;
        self.getItemList = getItemList;
        self._getPhuInvoiceDetails = _getPhuInvoiceDetails;

        // model
        self.GRModel = {id: null, supplierName: '', invoiceNo: '', purStatus: '', tradePrice: '', discount: '',
            vat: '', otherDiscount: '', invoiceAmounut: ''};

        self.supplierList = [];
        self.itemList = [];
        self.PurInvoiceDetails = [];

        // function call
        getSupplierList();
        getItemList();
        _getPhuInvoiceDetails();

        /// hot keys
        hotkeys.bindTo($scope).add({
            //combo: ['w'],
            combo: 'ctrl+n',
            callback: function() {
                $scope.addService();
            }
        });

        hotkeys.add({
            combo: 'alt+a',
            description: 'Add row',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $scope.addPurc();
            }
        });

        hotkeys.add({
            combo: 'alt+c',
            description: 'Close',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $state.go('setPharmacy');
            }
        });

        hotkeys.add({
            combo: 'ctrl+s',
            description: 'Save invoice',
            allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
            callback: function() {
                $scope.savePurchase();
            }
        });

        $scope.viewSize = [{listValue: "5", listName: "view 5"}, {listValue: "10", listName: "view 10"},
            {listValue: "15", listName: "view 15"}, {listValue: "20", listName: "view 20"},
            {listValue: "25", listName: "view 25"}, {listValue: "30", listName: "view 30"},
            {listValue: "35", listName: "view 35"}, {listValue: "40", listName: "view 40"},
            {listValue: "50", listName: "view 50"}];

        $scope.oneAtATime = true;
        $scope.status = {
            isCustomHeaderOpen: false,
            isFirstOpen: true,
            isFirstDisabled: false,
            isOpen: false
        };

        angular.element(document).ready(function() {
            window.document.title = "Goods Receive";
        });

        $scope.purItemList = [];

        $scope.checkName = function(data, id) {
            //console.log(data);
            var iName = data;
            var isFound = false;
            //console.log(iName);
            for (var k = 0; k < self.itemList.length; k++) {
                if (iName === self.itemList[k].itemName) {
                    isFound = true;
                    $scope.next();
                    break;
                }
            }
            if (isFound === true) {
            } else {
                alert('item name not exist in system !!!!');
                return '<i class="red" style="word-wrap: break-word;">item name not <br>exist in system !!!!</i>';
            }
        };

        $scope.qtyXtp = function(data, id) {
            for (var i = 0; i < $scope.purItemList.length; i++) {
                if ($scope.purItemList[i].id === id) {
                    var qty = $('#qty' + id).val();
                    var pack = $('#pack' + id).val();
                    var size = $('#size' + id).val();
                    var utp = $('#unitTP' + id).val() || 0.00;
                    var packSize = (pack * size);
                    $scope.purItemList[i].netQty = (qty * packSize) || 0.00;
                    $scope.purItemList[i].totalAmount = (qty * utp).toFixed(2) || 0.00;
                    break;
                }
            }
        };

        $scope.calVatAmount = function(data, id) {
            for (var i = 0; i < $scope.purItemList.length; i++) {
                if ($scope.purItemList[i].id === id) {
                    var totAmnt = $('#totalAmount' + id).val();
                    $scope.purItemList[i].vatAmount = ((totAmnt * data) / 100).toFixed(2) || 0.00;
                    break;
                }
            }
        };

        $scope.calDisAmount = function(data, id) {
            for (var i = 0; i < $scope.purItemList.length; i++) {
                if ($scope.purItemList[i].id === id) {
                    var totAmnt = $('#totalAmount' + id).val();
                    var vatAmnt = $('#vatAmount' + id).val();
                    var disAmnt = ((totAmnt * data) / 100).toFixed(2);
                    $scope.purItemList[i].discountAmount = disAmnt;
                    var netAmnt = (parseFloat(totAmnt) + parseFloat(vatAmnt)) - parseFloat(disAmnt).toFixed(2);
                    $scope.purItemList[i].netAmount = netAmnt.toFixed(2) || 0.00;
                    break;
                }
            }
        };

        self.allElementList = [];
        $scope.next = function(value, dd) {
            angular.forEach(element.find('input'), function(id, index) {
                $("#batch" + dd).focus();
                self.allElementList.push(id.id);
            });
            //console.log(self.allElementList);
        };

        $scope.dyNe = function(value, dd) {
            var val = value + dd;
            //console.log(val);
            for (var i = 0; i < self.allElementList.length; i++) {
                if (self.allElementList[i] === val) {
                    //console.log(self.allElementList[i]);
                    $("#" + self.allElementList[i + 1]).focus();
                    $("#" + self.allElementList[i + 1]).css("background-color", "#faf4f3 ");
                    $("#" + self.allElementList[i + 1]).css("border", "1px solid red");
                }
                else if (value === "salesPrice") {
                    $("#vat" + dd).focus();
                    $("#salesPrice" + dd).css("background-color", "#fff");
                    $("#salesPrice" + dd).css("border", "1px solid #FFF");
                }
                else if (value === "vat") {
                    $("#dicount" + dd).focus();
                    $("#vat" + dd).css("background-color", "#fff");
                    $("#vat" + dd).css("border", "1px solid #FFF");

                    $("#dicount" + dd).css("background-color", "#faf4f3 ");
                    $("#dicount" + dd).css("border", "1px solid red");
                }
                else if (value === "dicount") {
                    $("#netAmount" + dd).focus();
                    $("#dicount" + dd).css("background-color", "#fff");
                    $("#dicount" + dd).css("border", "1px solid #FFF");

                    $("#netAmount" + dd).css("background-color", "#faf4f3 ");
                    $("#netAmount" + dd).css("border", "1px solid red");
                }
                else if (value === "netAmount") {

                }
                else {
                    $("#" + self.allElementList[i + 1]).css("background-color", "#fff");
                    $("#" + self.allElementList[i + 1]).css("border", "1px solid #FFF");
                }
            }
        };

        $scope.validation = function() {
            // console.log($scope.purItemList);
            if ($scope.purItemList.length < 1) {
                alert('No Item select !!!!!');
                return false;
            }
            for (var k = 0; k < $scope.purItemList.length; k++) {
                if ($scope.purItemList[k].netAmount === "NaN" || $scope.purItemList[k].netAmount === "" || $scope.purItemList[k].itemName === "") {
                    return false;
                }
            }
        };

        $scope.savePurchase = function(gr) {
            // console.log(gr);
            // var dd = $("#invoiceDate").val();
            // encodeURI(JSON.stringify($scope.purItemList));
            var jsonList = encodeURIComponent(JSON.stringify($scope.purItemList));
            //console.log($scope.purItemList);

            $scope.tempModel = {phaInvId: null, supplierName: gr.supplierName, invoiceNo: gr.invoiceNo, invoiceDate: gr.invoiceDate,
                tradePrice: $scope.tradePrice, discount: $scope.totDisAmount, vat: $scope.totVatAmount, othDiscount: 0, invoiceAmount: $scope.totNetAmount, purcStatus: gr.purStatus};

            if (gr.supplierName === "" || gr.invoiceNo === "" || gr.invoiceDate === "") {
                self.error = 'Please fill up mandatory field !!!!!!!!!!';
                return false;
            }
            if ($scope.validation() === false) {
                self.error = 'Please input mandatory field !!!!!!!!!!';
                return false;
            }
            $http.post(getContextPath() + '/module/pharmacy/savePurchaseInv.htm?jsonList=' + jsonList, $scope.tempModel).success(function(d) {
                $scope.grnView(d.phaInvId);
            }).error(function(data, status, headers) {
                console.log(headers);
            });
        };

        $scope.grnView = function(purInvId) {
            $state.go('purView', {purInvId: purInvId});
        };

        $scope.savePurc = function(data, id) {
            var d = ['itemName', 'batch', 'pack', 'size', 'qty', 'netQty', 'unitTP', 'totalAmount', 'vat', 'vatAmount', 'dicount', 'discountAmount', 'netAmount'];
            var itVal = null;
            for (var k = 0; k < d.length; k++) {
                itVal = $("#" + d[k] + id).val();
                // console.log(self.allElementList[k]);
                if (itVal === "" || itVal === undefined) {
                    self.error = 'Please input all fields !!!!!!!!!!';
                    //console.log(k + " " + itVal);
                    return "aa";
                }
                else if (itVal === "NaN") {
                    self.error = 'Please input valid number !!!!!!!!!!';
                    return "aa";
                }
            }

            for (var i = 0; i < $scope.purItemList.length; i++) {
                if ($scope.purItemList[i].id === id) {
                    //console.log($scope.purItemList[i]);
                    $scope.purItemModel = angular.copy($scope.purItemList[i]);
                    self.error = null;
                    break;
                }
            }
            $scope.totTraPrice();
        };

        // remove purchase row
        $scope.removePurc = function(index) {
            if (confirm("Are you sure you want to remove this!!!!")) {
            }
            else {
                return false;
            }
            $scope.purItemList.splice(index, 1);
        };

        // add purchase row
        $scope.addPurc = function() {
            for (var k = 1; k < $scope.purItemList.length; k++) {
                var iname = $("#itemName" + k).val();
                if (iname === "" || iname === null || $scope.purItemList[k].itemName === "") {
                    var row = k + 1;
                    alert('please save no ' + row + ' row !!!!');
                    return '<i class="red" >item name not <br>exist in system !!!!</i>';
                }
            }
            $scope.inserted = {
                id: $scope.purItemList.length + 1,
                itemName: '',
                itemId: '',
                batch: '',
                expire: '',
                pack: '',
                size: '',
                qty: '',
                netQty: '',
                free: 0,
                unitTP: '',
                totalAmount: '',
                mrp: '',
                salesPrice: '',
                vat: '',
                vatAmount: '',
                dicount: '',
                discountAmount: '',
                netAmount: ''
            };
            $scope.purItemList.push($scope.inserted);
        };

        $scope.totTraPrice = function() {
            $scope.tradePrice = 0;
            $scope.totDisAmount = 0;
            $scope.totNetAmount = 0;
            $scope.totVatAmount = 0;
            for (var i = 0; i < $scope.purItemList.length; i++) {
                var disAmnt = $scope.purItemList[i].discountAmount;
                var netAmnt = $scope.purItemList[i].netAmount;
                $scope.tradePrice += parseFloat($scope.purItemList[i].totalAmount);
                $scope.totDisAmount += parseFloat(disAmnt);
                $scope.totNetAmount += parseFloat(netAmnt);
                $scope.totVatAmount += parseFloat($scope.purItemList[i].vatAmount);
            } // vatAmount
        };

        function getSupplierList() {
            $http.get(getContextPath() + '/module/pharmacy/listsupplier.htm').success(function(d) {
                self.supplierList = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function getItemList() {
            $http.get(getContextPath() + '/module/pharmacy/listitem.htm').success(function(d) {
                self.itemList = d;
                //console.log(d);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function _getPhuInvoiceDetails() {
            $http.get(getContextPath() + '/module/pharmacy/listpurinvoice.htm').success(function(response) {
                self.PurInvoiceDetails = response;
                //console.log(response);
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

    }]);

 