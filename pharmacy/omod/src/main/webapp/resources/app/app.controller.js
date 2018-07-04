
'use strict';

angular.module('inventoryApp').controller('AppController', ['$scope', '$http', '$state', 'AppService', function($scope, $http, $state, AppService) {
        var self = this;

        self.checkSession = checkSession;
        
        self.user = {};
        
        checkSession();

        $scope.session = null;

        angular.element(document).ready(function() {
            //window.document.title = "Inventory";
        });

        ///// Check Session
        function checkSession() {
            AppService.checkSession()
                    .then(function(d) {
                        $scope.session = d;
                        if (d === 0) {
                            alert('session is close!!!');
                            window.location.href = getContextPath() + "/logout";
                        }
                    },
                            function(errResponse) {
                                //console.error('Error, list history examination');
                            }
                    );
        }

        $scope._home = function() {
            $state.go('secHome');
        };

    }]);
