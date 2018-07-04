/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

angular.module('inventoryApp').factory('PhaSetupService', ['$http', '$q', '$resource', function($http, $q, $resource) {

        var factory = {
            saveCategory: saveCategory
        };

        return factory;

        function saveCategory(category) {
            var deferred = $q.defer();
            $http.post(getContextPath() + '/module/inventorynew/createCategory.htm', category).then(
                    function(response) {
                        deferred.resolve(response.data);
                    },
                    function(errResponse) {
                        console.error('Error while creating product');
                        deferred.reject(errResponse);
                    }
            );
            return deferred.promise;
        }
//
//        function listInvProduct() {
//            var deferred = $q.defer();
//            $http.get(getContextPath() + '/module/inventorynew/listInvPro.htm')
//                    .then(
//                            function(response) {
//                                deferred.resolve(response.data);
//                            },
//                            function(errResponse) {
//                                console.error('Error,list inventory product');
//                                deferred.reject(errResponse);
//                            }
//                    );
//            return deferred.promise;
//        }
//
//        function updateInvProduct(invProd, id) {
//            var deferred = $q.defer();
//            $http.post(getContextPath() + '/module/inventorynew/invProductUpdateMode.htm?id=' + id, invProd)
//                    .then(
//                            function(response) {
//                                deferred.resolve(response.data);
//                            },
//                            function(errResponse) {
//                                console.error('errrrror');
//                                deferred.reject(errResponse);
//                            }
//                    );
//            return deferred.promise;
//        }
//
//        function listBillablSer() {
//            var deferred = $q.defer();
//            $http.get(getContextPath() + '/module/inventorynew/listBilAblSer.htm')
//                    .then(
//                            function(response) {
//                                deferred.resolve(response.data);
//                            },
//                            function(errResponse) {
//                                console.error('Error,list billable service');
//                                deferred.reject(errResponse);
//                            }
//                    );
//            return deferred.promise;
//        }
//
//        function listInvReaMapById(id) {
//            var deferred = $q.defer();
//            $http.get(getContextPath() + '/module/inventorynew/listInvMapp.htm?id=' + id)
//                    .then(
//                            function(response) {
//                                deferred.resolve(response.data);
//                                // console.log('Response Data' + response.data);
//                            },
//                            function(errResponse) {
//                                console.error('Error while creating product');
//                                deferred.reject(errResponse);
//                            }
//                    );
//            return deferred.promise;
//        }
//
//        function deleteInvReaMap(id) {
//            console.log('delte id :' + id);
//            var deferred = $q.defer();
//            $http.delete(getContextPath() + '/module/inventorynew/deleteMapRea.htm?id=' + id)
//                    .then(
//                            function(response) {
//                                deferred.resolve(response.data);
//                                // console.log('Response Data' + response.data);
//                            },
//                            function(errResponse) {
//                                console.error('Error while delete inv mapping service');
//                                deferred.reject(errResponse);
//                            }
//                    );
//            return deferred.promise;
//        }

    }]);