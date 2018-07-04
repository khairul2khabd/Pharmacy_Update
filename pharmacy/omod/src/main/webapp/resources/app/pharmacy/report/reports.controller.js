
'use strict';

angular.module('inventoryApp').controller('ReportController', ['$scope', '$http', '$state', 'AppService', function($scope, $http, $state, AppService) {
        var self = this;

        self.getUserList = getUserList;
        self.getUserWiseStatement = getUserWiseStatement;

        // Model
        self.Users = [];
        self.PhaSaleCollect = [];

        angular.element(document).ready(function() {
            window.document.title = "Reports";
        });

        // function call
        getUserList();

        function getUserList() {
            $http.get(getContextPath() + '/module/pharmacy/userList.htm').success(function(d) {
                self.Users = d;
            }).error(function(data, status, headers) {
                console.log(status);
            });
        }

        function getUserWiseStatement(user, s, e) {
            var userId = user.userId;
            var sDate = $("#sDate").val();
            var eDate = $("#eDate").val();
            $http.get(getContextPath() + '/module/pharmacy/phaSaleCollByUser.htm?userId=' + userId + "&sDate=" + sDate.toString() + "&eDate=" + eDate.toString()).success(function(d) {
                self.PhaSaleCollect = d;
                console.log(d);
            }).error(function(status) {
                console.log(status);
            });
        }

        $scope.getView = function(user) {
            console.log(user);
            $scope.selectUser = user.givenName;
        };


    }]);
