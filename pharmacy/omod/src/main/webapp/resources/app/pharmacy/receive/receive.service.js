/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

angular.module('inventoryApp').factory('GoodsReceiveService', ['$http', '$q', '$resource', function($http, $q, $resource) {

        var factory = {
            savePurchase: savePurchase
        };

        return factory;

        function savePurchase(jsonString) {
            var deferred = $q.defer();
            $http.post(getContextPath() + '/module/pharmacy/savePurchase.htm?jsonString=' + jsonString, invoiceRea)
                    .then(
                            function(response) {
                                deferred.resolve(response.data);
                                // console.log('Response Data' + response.data);
                            },
                            function(errResponse) {
                                console.error('Error while creating product');
                                deferred.reject(errResponse);
                            }
                    );
            return deferred.promise;
        }

    }]);