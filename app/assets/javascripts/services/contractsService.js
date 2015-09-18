var contractServices = angular.module('contractServices', ['ngResource']);

contractServices.factory('ContractList', ['$resource',
  function($resource) {
    return $resource('contracts.json');
  }]
);
