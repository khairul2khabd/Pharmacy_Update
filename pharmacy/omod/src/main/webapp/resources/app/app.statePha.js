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

                .state('setPharmacy', {
                    url: '/setpha',
                    data: {
                        pageTitle: 'Inventory'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/setpharmacy.htm'
                        }
                    }
                })
                .state('secHome', {
                    url: '/secHome.ngt',
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/secHome.htm'
                        }
                    }
                })
                .state('itemcreate', {
                    url: '/:: itemcreate ::/:gd',
                    data: {
                        pageTitle: 'Inventory'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/itemcreate.htm'
                        }
                    }
                })
                .state('cat', {
                    url: '/:: cat ::/:gd',
                    data: {
                        pageTitle: 'Inventory'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/category.htm'
                        }
                    }
                })
                .state('supadd', {
                    url: '/:: sup ::/:gd',
                    data: {
                        pageTitle: 'Inventory'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/suppadd.htm'
                        }
                    }
                })
                .state('godrec', {
                    url: '/:: godrec ::/:gd',
                    data: {
                        pageTitle: 'Inventory'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/godrec.htm'
                        }
                    }
                })
                .state('purView', {
                    url: '/purView.ngt/:purInvId',
                    data: {
                        pageTitle: 'Purchase Invoice View'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/purinvoiceview.htm'
                        }
                    }
                })
                .state('newbill', {
                    url: '/newbill.ngt',
                    data: {
                        pageTitle: 'New bill'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/newbill.htm'
                        }
                    }
                })
                .state('viewbill', {
                    url: '/viewbill.ngt/:saleInvoiceId',
                    data: {
                        pageTitle: 'Bill view'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/viewbill.htm'
                        }
                    }
                })
                .state('duecollect', {
                    url: '/due.ngt/:saleInvoiceId',
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/duecollect.htm'
                        }
                    }
                })
                .state('priceupdate', {
                    url: '/priupd.ngt',
                    data: {
                        pageTitle: 'Purchase Invoice View'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/priceupdateview.htm'
                        }
                    }
                })
                .state('reports', {
                    url: '/rep.ngt',
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/reports.htm'
                        }
                    }
                })
                .state('userstat', {
                    url: '/uws.ngt',
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/ueserstatement.htm'
                        }
                    }
                })

                .state('abc', {
                    url: '/abc',
                    data: {
                        pageTitle: 'Reagent'
                    },
                    views: {
                        'content@': {
                            templateUrl: getContextPath() + '/module/pharmacy/reagent.htm'
                                    // controllerAs: 'vm'
                        }
                    }
                });
    }
})();



