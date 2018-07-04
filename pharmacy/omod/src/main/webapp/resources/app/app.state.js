/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function() {
    'use strict';

    angular.module('inventoryApp').config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider

                .state('createproduct', {
                    url: '/creprod',
                    data: {
                        pageTitle: 'Inventory'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/inventorynew/product.htm'
                                    // controllerAs: 'vm'
                        }
                    }
                })
                .state('geninv', {
                    url: '/gen',
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/inventorynew/generalinv.htm'
                        }
                    }
                })
                .state('issue', {
                    url: '/issue',
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/inventorynew/issueToPatient.htm'
                        }
                    }
                })
                .state('reagent', {
                    url: '/rea',
                    data: {
                        pageTitle: 'Reagent'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/inventorynew/reagent.htm'
                                    // controllerAs: 'vm'
                        }
                    }
                });
    }
})();

//                .state('treatment', {
//                    url: '/tmf/:patientId/:encounterId/:pqid',
//                    data: {
//                        pageTitle: 'Inventory Form'
//                    },
//                    views: {
//                        'content@': {
//                            templateUrl: 'treatmentForm.htm',
//                            controller: 'PatientTreatmentController'
//                                    // controllerAs: 'vm'
//                        }
//                    }
//                })


