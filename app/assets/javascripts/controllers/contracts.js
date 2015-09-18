var contractControllers = angular.module('contractControllers', []);

contractControllers.controller('ContractsCtrl', ['$scope', '$routeParams', 'ContractList', function($scope, $routeParams, ContractList) {

  $scope.contracts = ContractList.query();

  $scope.positionFilter = {
    "QB": true,
    "RB": true,
    "WR": true,
    "TE": true,
    "DST": true,
    "K": true
  };

  $scope.contractFilter = {
    'ACTIVE': true,
    'ROOKIE': true,
    'IR': true,
    'SSPD': true,
    'LTIR': true
  };

  $scope.filterByContractStatus = function(contract) {
    return $scope.contractFilter[contract.contract_status];
  };

  $scope.filterByPosition = function(contract) {
    return $scope.positionFilter[contract.player.position];
  };

  $scope.orderByField = 'player.last_name';

}]);

