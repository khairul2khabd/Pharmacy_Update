/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

angular.module('inventoryApp').factory('AppService', ['$http', '$q', '$resource', function($http, $q, $resource) {

        var factory = {
            checkSession: checkSession
        };

        return factory;

        function checkSession() {
            var deferred = $q.defer();
            $http.get(getContextPath() + '/module/pharmacy/checkSession.htm')
                    .then(
                            function(response) {
                                deferred.resolve(response.data);
                            },
                            function(errResponse) {
                                console.error('Error while session check');
                                deferred.reject(errResponse);
                            }
                    );
            return deferred.promise;
        }


    }]);