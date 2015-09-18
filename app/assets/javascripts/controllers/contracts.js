var contractControllers = angular.module('contractControllers', []);

contractControllers.controller('ContractsCtrl', ['$scope', '$routeParams', 'ContractList', function($scope, $routeParams, ContractList) {

  $scope.contracts = ContractList.query();

  $scope.radio = {
    position: 'ALL',
    contractStatus: 'ALL'
  };

  $scope.filterByContractStatus = function(contract) {
    if (!$scope.radio.contractStatus || $scope.radio.contractStatus === 'ALL') {
      return true;
    } else {
      return $scope.radio.contractStatus === contract.contract_status;
    }
  };

  $scope.filterByPosition = function(contract) {
    if (!$scope.radio.position || $scope.radio.position === 'ALL') {
      return true;
    } else {
      switch($scope.radio.position) {
        case 'RB/WR':
          return contract.player.position === 'RB' || contract.player.position === 'WR';
        default:
          return $scope.radio.position === contract.player.position;
      }
    }
  };

  $scope.orderByField = 'player.last_name';

}]);

