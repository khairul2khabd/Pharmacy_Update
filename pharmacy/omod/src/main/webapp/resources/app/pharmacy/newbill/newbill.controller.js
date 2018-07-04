/* global angular */

'use strict';

//angular.module('khaApp').controller('PurchaseController', ['$http', '$scope', '$state', '$rootScope', 'hotkeys',
//    function ($http, $scope, $state, $rootScope, hotkeys, $timeout, cfpLoadingBar) {
angular.module('inventoryApp').controller('NewBillController', function($http, $scope, $state, $rootScope, hotkeys) {

    var self = this;

    self.success = null;
    self.error = null;
    self.pmCard = null;
    self.bkash = null;

    self.reset = reset;
    self.getItemList = getItemList;
    self.saveInvoice = saveInvoice;
    self.getPatientInfo = getPatientInfo;

    angular.element(document).ready(function() {
        window.document.title = "New Bill";
    });

    // model
    self.itemList = [];
    self.serviceNames = [];
    $scope.posInvModel = {
        customerName: '',
        paymentMethod: '',
        bankName: '',
        transNumber: '',
        bkash: '',
        discount: '',
        disPercentage: '',
        paid: ''
    };
    self.patientSearchList = [];

    $scope.isCollapsed = true;
    $scope.ShowHide = function() {
        // $scope.IsVisible = $scope.IsVisible ? false : true;
        $scope.isCollapsed = true;
    };

    $scope.paymentMethods = ['CASH', 'CARD', 'BKASH', 'ROCKET'];
    $scope.paymentMethod = 'CASH';
    $scope.discount = 0;
    $scope.disPercentage = 0;
    $scope.bankNames = ['City Bank', 'DBBL Bank', 'Brack Bank', 'Eastern Bank', 'MTB Card', 'LankaBanla Card', 'Dhaka Bank'];
    $scope.cuDate = new Date();

    var d = new Date();
    var hour = d.getHours();
    var min = d.getMinutes();
    $scope.time = hour + ' : ' + min;

    // angular.forEach(element.find('input'), function (node) {
    //     console.log(node);
    // });

    /// hot keys

    hotkeys.add({
        combo: 'ctrl+down',
        description: 'Description goes here',
        allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
        callback: function() {
            $scope.next();
        }
    });

    hotkeys.add({
        combo: 'ctrl+right',
        description: 'Description goes here',
        allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
        callback: function() {
            $("#customerName").focus();
        }
    });

    hotkeys.add({
        combo: 'ctrl+f1',
        description: 'Description goes here',
        allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
        callback: function() {
            saveInvoice();
        }
    });

    hotkeys.add({
        combo: 'ctrl+up',
        description: 'Description goes here',
        allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
        callback: function() {
            $("#itemName").focus();
        }
    });

    $scope._onenter = function(id) {
        if (id === 'customerName') {
            $("#contactInfo").focus();
        }
    };

    //// function call
    getItemList();

    /// function start

    function getItemList() {
        $http.get(getContextPath() + '/module/pharmacy/getListPhaItemPrice.htm').success(function(d) {
            self.itemList = d;
            //console.log(d);
        }).error(function(data, status, headers) {
            console.log(data);
        });
    }

    function getPatientInfo(search) {
        $http.get(getContextPath() + '/module/pharmacy/searchpatienbynameorphone.htm?search=' + search).success(function(d) {
            self.patientSearchList = d;
            // console.log(d);
        }).error(function(data, status, headers) {
            console.log(data);
        });
    }

    $scope.objectIndex = null;
    $scope.selectedItemList = [
        $scope.itemObject = {
            itemName: '',
            itemId: '',
            itemPriceId: '',
            avaQty: '',
            qty: '',
            price: '',
            amount: ''
        }];

    $scope.addItem = function(item) {
        // console.log(item);
        if (item.item === undefined) {
            return false;
        }

        if ($scope.selectedItemList.length < 1) {
            $scope.selectedItemList.push($scope.itemObject = {
                itemName: item.item.itemName,
                avaQty: item.qty,
                itemId: item.item.itemId,
                itemPriceId: item.id,
                qty: '',
//                price: item.salesPrice,
                price: item.eachPrice,
                amount: 0
            });
        }
        else {
            for (var i = 0; i < self.itemList.length; i++) {
                for (var k = 0; k < $scope.selectedItemList.length; k++) {
                    //console.log($scope.selectedItemList[k]);
                    if ($scope.selectedItemList[k].itemName === item.item.itemName.trim()) {
                        alert('exist');
                        $("#itemName").val('');
                        return false;
                    }
                }

                if (self.itemList[i].item.itemName === item.item.itemName.trim()) {
                    $scope.selectedItemList.push($scope.itemObject = {
                        itemName: item.item.itemName,
                        avaQty: item.qty,
                        itemId: item.item.itemId,
                        itemPriceId: item.id,
                        qty: '',
                        price: item.eachPrice,
                        amount: 0
                    });
                    break;
                }
            } /// end for loop
        }

        $scope.itemObject = {
            itemName: '',
            itemId: '',
            itemPriceId: '',
            avaQty: '',
            qty: '',
            price: '',
            amount: 0
        };

    };

    $scope.removeService = function(index) {
        $scope.selectedItemList.splice(index, 1);
        $scope.totalamount = 0;
        for (var k = 0; k < $scope.selectedItemList.length; k++) {
            $scope.totalamount += parseInt($scope.selectedItemList[k].amount);
        }
        $scope.netAmount = $scope.totalamount;
        $scope.due = 0;
        $scope.paid = 0;
    };
    $scope.removeService(0);

    // qty X price = amount
    $scope.qtyprice = function(id, qty) {
        for (var k = 0; k < $scope.selectedItemList.length; k++) {
            if (k === id) {
                if (qty > $scope.selectedItemList[k].avaQty) {
                    $("#" + k).val('');
                    alert('Available quantity Exceed quantiy !!!!!!');
                    return false;
                }
                $scope.selectedItemList[k].amount = qty * $scope.selectedItemList[k].price;
                break;
            }
        }
        $scope.totalamount = 0;
        for (var k = 0; k < $scope.selectedItemList.length; k++) {
            $scope.totalamount += parseInt($scope.selectedItemList[k].amount);
        }
        $scope.netAmount = $scope.totalamount - $scope.discount;
    };

    // price X qty = amount
    $scope.priceqty = function(id, price) {
        for (var k = 0; k < $scope.selectedItemList.length; k++) {
            if (k === id) {
                $scope.selectedItemList[k].amount = price * $scope.selectedItemList[k].qty;
                break;
            }
        }
        $scope.totalamount = 0;
        for (var k = 0; k < $scope.selectedItemList.length; k++) {
            $scope.totalamount += parseInt($scope.selectedItemList[k].amount);
        }
        $scope.netAmount = $scope.totalamount - $scope.discount;
    };

    $scope.selectPayMethod = function(pm) {
        //console.log(pm);
        if (pm === 'CARD') {
            self.pmCard = 'success';
            self.bkash = null;
        }
        else if (pm === 'CASH') {
            self.pmCard = null;
            self.bkash = null;
        }
        else if (pm === 'BKASH' || pm === 'ROCKET') {
            self.pmCard = null;
            self.bkash = 'success';
        }
    };

    $scope.disAmount = function(dis) {
        if (dis > $scope.totalamount) {
            alert('Discount amount greater than "Total amount" !!!!');
            $("#discount").val('');
            $("#disPercentage").val('0');
            return false;
        }
        $scope.disPercentage = ((dis / $scope.totalamount) * 100).toFixed(2);
        $scope.netAmount = $scope.totalamount - $scope.discount;
    };

    $scope.percentage = function(per) {
        // console.log(per);
        if (per > 100) {
            alert('Over discount !!!!');
            $("#discount").val('0');
            $("#disPercentage").val('0');
            return false;
        }
        $scope.discount = ($scope.totalamount * per) / 100;
        $scope.netAmount = $scope.totalamount - $scope.discount;
    };

    $scope.dueAmnt = function(paid) {
        // console.log(paid);
        var dueValue = $scope.netAmount - paid;
        if (dueValue < 0) {
            alert('Paid amount greter than net amount !!!!!');
            $("#paid").focus();
            $("#paid").val('');
            return false;
        } else {
            $scope.due = $scope.netAmount - paid;
        }
    };

    $scope.dynNext = function(v) {
        var d = v + 1;
        $("#" + d).focus();
        // var val = $("#" + v + "price").val();
        // if (val === "0") {
        // $("#" + v + "price").val("");
        // }
        // $("#" + v + "price").focus();
        if ($scope.selectedItemList.length === v + 1) {
            $scope.next(v);
        }
    };

    $scope.next = function(id) {
        var d = id + 1;
        $("#" + d).focus();
        if ($scope.selectedItemList.length === id + 1) {
            $("#discount").focus();
        }
        else if (id === 'bn') {
            $("#transNumber").focus();
        }
        else if (id === 'transNumber') {
            $("#discount").focus();
        }
        else if (id === 'bkash') {
            $("#discount").focus();
        }
        else if (id === 'discount') {
            $("#disPercentage").focus();
        }
        else if (id === 'disPercentage') {
            var p = $("#paid").val();

            if (p === "" || p === undefined || p === "0") {
                // console.log("aaaaaaaaaaa :::: " + p);
                $("#paid").val("");
            }
            $("#paid").focus();
        }
        else if (id === undefined) {
            $("#0").focus();
        }
        else if (id === 'paid') {
            var netamn = $scope.totalamount - $scope.discount;
            if ($scope.paid > netamn) {
                alert('Paid Amount Greater than Net Amount!!!!!!');
                return false;
            }
            else {
                self.saveInvoice();
            }
        }
    };

    $scope.clear = function(v, id) {
        if (v === 0) {
            $("#" + id).val('');
        }
    };

    $scope.af = function(id) {
        if ($('#' + id).val() === '') {
            $('#' + id).val('0');
        }
    };

    function saveInvoice() {
        if ($scope.paid < 1) {
            if (confirm("Are you sure without paid amount ?")) {
            } else {
                return false;
            }
        }
        var netamn = $scope.totalamount - $scope.discount;
        if ($scope.paid > netamn) {
            alert('Paid Amount Greater than Net Amount!!!!!!');
            return false;
        }
        else {
        }
        if ($scope.totalamount < 1) {
            alert('Is not valid Invoice !!!!!!');
            return false;
        }
        else {
        }
        if ($scope.paymentMethod === 'CARD') {
            if ($scope.bankName === undefined || $scope.transNumber === undefined || $scope.bankName === '' || $scope.transNumber === '') {
                alert('Please enter bank name and transaction number!!!!');
                $("#bn").focus();
                return false;
            }
            else {
            }
        }

        if ($scope.paymentMethod === 'BKASH' || $scope.paymentMethod === 'ROCKET') {
            if ($scope.bkash === undefined || $scope.bkash === '') {
                alert('Please enter mobile number!!!!');
                $("#bkash").focus();
                return false;
            }
            else {
            }
        }

        for (var k = 0; k < $scope.selectedItemList.length; k++) {
            if ($scope.selectedItemList[k].amount < 1) {
                self.error = 'Please check quantity or price is empty !!!!!';
                $("#" + k).focus();
                return false;
                break;
            }
        }

        $scope.disPercentage = $scope.disPercentage === undefined ? 0 : $scope.disPercentage;

        // $scope.cusName = $scope.customerName.fullname === undefined ? $scope.customerName : $scope.customerName.givenName + " " + $scope.customerName.middleName + " " + $scope.customerName.familyName;
        // $scope.cusId = $scope.customerName.patientId === undefined ? 0 : $scope.customerName.patientId;

        if ($scope.customerName === "" || $scope.customerName === undefined) {
            $scope.cusName = $scope.customerName;
            $scope.cusId = 0;
        } else {
            $scope.cusName = $scope.customerName.fullname === undefined ? "" : $scope.customerName.givenName + " " + $scope.customerName.middleName + " " + $scope.customerName.familyName;
            $scope.cusId = $scope.customerName.patientId === undefined ? 0 : $scope.customerName.patientId;
        }

        $scope.invoice = {
            saleInvoiceId: null,
            bankName: $scope.bankName,
            cardNo: '',
            contactInfo: $scope.contactInfo,
            customer: $scope.cusName,
            customerId: $scope.cusId,
            discountAmount: parseFloat($scope.discount),
            discountPercentage: parseFloat($scope.disPercentage),
            dueAmount: parseFloat($scope.totalamount - $scope.discount) - $scope.paid,
            mobileNo: $scope.bkash,
            netAmount: parseFloat($scope.totalamount - $scope.discount),
            paid: $scope.paid,
            paymentMethod: $scope.paymentMethod,
            totalAmount: $scope.totalamount,
            transNo: $scope.transNumber
        };

        //var jsonList = encodeURIComponent(JSON.stringify($scope.purItemList));
        var jsonList = encodeURIComponent(JSON.stringify($scope.selectedItemList));
        var paid = $scope.paid;
        //console.log(jsonList);
        $http.post(getContextPath() + '/module/pharmacy/savePhaSale.htm?jsonList=' + jsonList, $scope.invoice)
                .success(function(d) {
                    self.error = null;
                    self.reset();
                    $scope.selectedItemList = [];
                    $scope.saleViewInvoice(d.saleInvoiceId);
                    //  $("#serviceName").focus();
                }).error(function(data, status, headers) {
            //console.log(data);
        });
    }
    ;

    $scope.saleViewInvoice = function(saleInvoiceId) {
        $state.go('viewbill', {saleInvoiceId: saleInvoiceId});
    };

    $scope.printDiv3 = function() {
        var printer = window.open('left=5', 'top=5', 'width=200,height=200');
        printer.document.open("text/html");
        printer.document.write(document.getElementById('printDiv').innerHTML);
        printer.print();
        printer.document.close();
        printer.window.close();
    };

    function reset() {
        $scope.itemObject.itemName = '';
        $scope.customerName = '';
        $scope.contactInfo = '';
        $scope.bkash = '';
        $scope.bankName = '';
        $scope.transNumber = '';
        $scope.totalamount = '';
        $scope.paid = '';
        $scope.discount = '';
        $scope.disPercentage = 0;
        $scope.totalamount = 0;
        $scope.discount = 0;
    }
});


// var jsonList = encodeURIComponent(JSON.stringify($scope.purItemList));