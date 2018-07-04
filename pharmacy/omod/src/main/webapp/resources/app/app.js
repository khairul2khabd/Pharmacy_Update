/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function() {
    'use strict';

    angular.module('inventoryApp', [
        //   'ngMaterial',
        //   'ngMessages',
        'ngResource',
        'mgcrea.ngStrap',
        'angular-loading-bar',
        'ngAnimate',
        'ngSanitize',
        'ui.router',
        'ui.bootstrap',
        'cfp.hotkeys',
        'ui.select',
        'xeditable',
        'angularUtils.directives.dirPagination',
        'ui.bootstrap.datetimepicker'
    ])
            .run(run);
    run.$inject = ['stateHandler'];

})();
 
// var app = angular.module('demo', ['ngSanitize', 'ui.select']);