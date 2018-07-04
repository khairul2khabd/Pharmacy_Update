
'use strict';
angular.module('inventoryApp').controller('PriceUpdateController', ['$scope', '$filter', '$http', '$state', '$element', 'hotkeys', function($scope, $filter, $http, $state, element, hotkeys) {

        var self = this;
        self.error = null;

        // function call

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
            window.document.title = "Price Update";
        });



    }]);

 