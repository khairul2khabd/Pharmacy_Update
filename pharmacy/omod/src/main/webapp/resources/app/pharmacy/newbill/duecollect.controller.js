/* global angular */

'use strict';
angular.module('inventoryApp').controller('DueCollectController', function($http, $scope, $state, $stateParams, hotkeys) {

    var self = this;

    self.success = null;
    self.error = null;
    self.pmCard = null;
    self.bkash = null;

    self.getPhaSale = getPhaSale;
    self.getListPhaSaleDet = getListPhaSaleDet;
    self.getListPhaSaleColl = getListPhaSaleColl;
    self.saveDueCollectPha = saveDueCollectPha;
    self.getSaleReturn = getSaleReturn;

    var saleInvoiceId = $stateParams.saleInvoiceId;

    /// Model
    self.phaSale = {};
    self.phaSaleDet = [];
    self.phaSaleColl = [];
    self.PhaSaleReturns=[];

    angular.element(document).ready(function() {
        window.document.title = "Due Collect";
        $("#duePaid").focus();
    });

    // model

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

    hotkeys.add({
        combo: 'right',
        description: 'Description goes here',
        allowIn: ['INPUT', 'SELECT', 'TEXTAREA'],
        callback: function() {
            $("#duePaid").focus();
        }
    });

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
        var dueValue = self.phaSale.dueAmount - paid;
        if (dueValue < 0) {
            alert('Paid amount greter than net amount !!!!!');
            $("#duePaid").focus();
            $("#duePaid").val('');
            $scope.due = 0;
            return false;
        } else {
            $scope.due = self.phaSale.dueAmount - paid;
        }
    };

    //// function call
    getPhaSale(saleInvoiceId);
    getListPhaSaleDet(saleInvoiceId);
    getListPhaSaleColl(saleInvoiceId);
    getSaleReturn(saleInvoiceId);

    /// function start

    function getPhaSale(saleInvoiceId) {
        $http.get(getContextPath() + '/module/pharmacy/getPhaSaleByInvoiceId.htm?saleInvoiceId=' + saleInvoiceId).success(function(d) {
            if (d != '') {
                self.phaSale = d;
            } else {
                alert('bill not found!!!!!');
                window.history.back();
            }
            //console.log(d);
        }).error(function(status) {
            console.log(status);
        });
    }

    function getListPhaSaleDet(saleInvoiceId) {
        $http.get(getContextPath() + '/module/pharmacy/listPhaSaleDetByInvoiceId.htm?saleInvoiceId=' + saleInvoiceId).success(function(d) {
            self.phaSaleDet = d;
            for (var i = 0; i < self.phaSaleDet.length; i++) {
                var netTot = (self.phaSaleDet[i].totalAmount - ((self.phaSaleDet[i].totalAmount * self.phaSale.discountPercentage) / 100));
                //   console.log(self.phaSaleDet[i].totalAmount - ((self.phaSaleDet[i].totalAmount * self.phaSale.discountPercentage) / 100));
                self.phaSaleDet[i].afDis = netTot;
            }
            //console.log(d);
        }).error(function(status) {
            console.log(status);
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

    function getSaleReturn(saleInvoiceId) {
        $http.get(getContextPath() + '/module/pharmacy/listPhaSaleReturnByInvoiceId.htm?saleInvoiceId=' + saleInvoiceId).success(function(d) {
            self.PhaSaleReturns = d;
            //console.log(d);
        }).error(function(data, status, headers) {
            console.log(data);
        });
    }

    /// Return Item from Invoice 

    self.ReturnItems = [];
    $scope.returnActualAmount = 0;
    $scope.returnTotalAmount = 0;

    $scope.removeService = function(index, id) {
        //console.log(index, id);
        for (var i = 0; i < self.phaSaleDet.length; i++) {
            //console.log(self.phaSaleDet[i]);
            if (self.phaSaleDet[i].saleDetId === id) {
                self.phaSaleDet[i].returnAmount = (self.phaSaleDet[i].totalAmount - ((self.phaSaleDet[i].phaSale.discountPercentage * self.phaSaleDet[i].totalAmount) / 100));
                self.ReturnItems.push(self.phaSaleDet[i]);
                $scope.returnTotalAmount += self.phaSaleDet[i].returnAmount;
                $scope.returnActualAmount += self.phaSaleDet[i].totalAmount;
                $("#action" + id).hide();
                $("#action1" + id).css("background-color", "#fafa4e");
                break;
            }
        }

        if ($scope.returnTotalAmount > self.phaSale.dueAmount) {
            //$("#duePaid").val(self.phaSale.dueAmount);
            $scope.duePaid = self.phaSale.dueAmount;
            $scope.due = 0;
            $("#duePaid").attr('readonly', true);
            $scope.nr = 'Give';
        }

        if ($scope.returnTotalAmount < self.phaSale.dueAmount) {
            var dp = (self.phaSale.dueAmount - $scope.returnTotalAmount);
            //$("#duePaid").val(dp.toFixed(0));
            $scope.duePaid = dp.toFixed(0);
            $scope.due = 0;
            $scope.nr = 'Take';
            $("#duePaid").attr('readonly', true);
        }
        //self.phaSaleDet.splice(index, 1);
    };
    $scope.removeService(0);

    $scope.retQty = function(index, qty2, orgQty) {
        for (var k = 0; k < self.ReturnItems.length; k++) {
            if (k === index) {
                var qty = $("#qty" + index).val();
                var afterDiscout = ((qty * self.ReturnItems[k].unitPrice) - ((self.ReturnItems[k].phaSale.discountPercentage * (qty * self.ReturnItems[k].unitPrice)) / 100));
                self.ReturnItems[k].afDis = afterDiscout;
                if (qty > self.ReturnItems[k].quantity) {
                    $("#qty" + k).val(self.ReturnItems[k].quantity);
                    self.ReturnItems[k].afDis = ((self.ReturnItems[k].quantity * self.ReturnItems[k].unitPrice) - ((self.ReturnItems[k].phaSale.discountPercentage * (self.ReturnItems[k].quantity * self.ReturnItems[k].unitPrice)) / 100));
                    alert('Sale quantity Exceed quantiy !!!!!!');
                    return false;
                }
                if (qty <= self.ReturnItems[k].quantity && qty > 0) {
                    self.ReturnItems[k].totalAmount = qty * self.ReturnItems[k].unitPrice;
                    self.ReturnItems[k].afDis = afterDiscout;
                }
                break;
            }
        }

        $scope.returnTotalAmount = 0;
        $scope.returnActualAmount = 0;
        for (var i = 0; i < self.ReturnItems.length; i++) {
            $scope.returnTotalAmount += self.ReturnItems[i].afDis;
            $scope.returnActualAmount += self.ReturnItems[i].totalAmount;
        }

        if ($scope.returnTotalAmount > self.phaSale.dueAmount) {
            //$("#duePaid").val(self.phaSale.dueAmount);
            $scope.duePaid = self.phaSale.dueAmount;
            $scope.due = 0;
            $scope.nr = 'Give';
        }

        if ($scope.returnTotalAmount < self.phaSale.dueAmount) {
            var dp = (self.phaSale.dueAmount - $scope.returnTotalAmount);
            //$("#duePaid").val(dp.toFixed(0));
            $scope.duePaid = dp.toFixed(0);
            $scope.due = 0;
            $scope.nr = 'Take';
            //self.phaSale.dueAmount=dp.toFixed(0);
        }
    };

    $scope.digitCheck = function(index, qty, quantity) {
        var q = qty === undefined ? quantity : qty;
        if (q < 1 || q === undefined) {
            alert('Please enter quantity !!!!!!');
            $("#qty" + index).css("background-color", "red");
            $("#qty" + index).val(quantity);
            return false;
        } else {
            $("#qty" + index).css("background-color", "white");
        }
    };

    ///// due collect and return save

    $scope.FinalReturns = [];
    function saveDueCollectPha(billId, duePaid, due) {
        if (duePaid === '' || duePaid === undefined) {
            self.error = 'You Enter Wrong Entry !!!!!!';
            return false;
        }
        for (var j = 0; j < self.ReturnItems.length; j++) {
            var qt = $("#qty" + j).val();
            if (qt === '') {
                self.error = 'Please Enter Valid Quantity !!!!!!';
                return false;
            }
            self.ReturnItems[j].quantity = parseFloat(qt);
        }
        $scope.FinalReturns = [];
        $scope.tempModel = {};
        for (var m = 0; m < self.ReturnItems.length; m++) {
            $scope.tempModel = {detId: self.ReturnItems[m].saleDetId,
                quantity: self.ReturnItems[m].quantity,
                discount: self.ReturnItems[m].discountAmount,
                totalAmount: self.ReturnItems[m].totalAmount,
                unitPrice: self.ReturnItems[m].unitPrice,
                itemId: self.ReturnItems[m].phaItem.itemId,
                saleInvoiceId: self.ReturnItems[m].phaSale.saleInvoiceId,
                itemPriceId: self.ReturnItems[m].itemPrice.id,
                afDis: self.ReturnItems[m].afDis};
            $scope.FinalReturns.push($scope.tempModel);
        }
        //console.log($scope.FinalReturns);
        $scope.dueCollectModel = {billId: billId, duePaid: parseFloat(duePaid), netDue: due,
            retAmount: $scope.returnTotalAmount, retActual: $scope.returnActualAmount, dtm: $scope.FinalReturns};

        $http.post(getContextPath() + '/module/pharmacy/dueCollectPhaBill.htm', $scope.dueCollectModel).success(function(d) {
            if (d.duePaid < 5) {
                $scope.dueCollectView(d.phaSale.saleInvoiceId);
            }else{
                $scope.dueCollectView(d.phaSale.saleInvoiceId);
            }
        }).error(function(status) {
            if (status === 401) {
                alert('Unauthorized Request !!!');
                window.location.href = getContextPath() + "/logout";
            }
        });
    }

//    $scope.FinalReturns = [];
//    function saveReturnItems(billId, duePaid, due) {
//        $scope.FinalReturns = [];
//        $scope.tempModel = {};
//        for (var m = 0; m < self.ReturnItems.length; m++) {
//            //console.log(self.ReturnItems[m]);
//            $scope.tempModel = {detId: self.ReturnItems[m].saleDetId,
//                quantity: self.ReturnItems[m].quantity,
//                discount: self.ReturnItems[m].discountAmount,
//                totalAmount: self.ReturnItems[m].discountAmount,
//                unitPrice: self.ReturnItems[m].unitPrice,
//                itemId: self.ReturnItems[m].phaItem.itemId,
//                saleInvoiceId: self.ReturnItems[m].phaSale.saleInvoiceId,
//                itemPriceId: self.ReturnItems[m].itemPrice.id,
//                afDis: self.ReturnItems[m].afDis};
//            $scope.FinalReturns.push($scope.tempModel);
//        }
//
//        $scope.dueCollectModel = {billId: billId, duePaid: parseFloat(duePaid), netDue: due,
//            retAmount: $scope.returnTotalAmount, retActual: $scope.returnActualAmount, dtm: $scope.FinalReturns};
//
//        console.log($scope.FinalReturns);
//        $http.post(getContextPath() + '/module/pharmacy/saleReturnItem.htm', $scope.dueCollectModel).success(function(d) {
//            //$scope.dueCollectView(d.phaSale.saleInvoiceId);
//            console.log(d);
//        }).error(function(status) {
//            if (status === 401) {
//                alert('Unauthorized Request !!!');
//                window.location.href = getContextPath() + "/logout";
//            }
//        });
//    }

    $scope.back = function() {
        window.history.back();
    };

    $scope.dueCollectView = function(saleInvoiceId) {
        $state.go('viewbill', {saleInvoiceId: saleInvoiceId});
    };

});
 