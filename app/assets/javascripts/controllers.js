var fantasyTeamControllers= angular.module('fantasyTeamControllers', []);

fantasyTeamControllers.controller('FantasyTeamCtrl', ['$scope', '$routeParams', 'FantasyTeam', function($scope, $routeParams, FantasyTeam) {

  FantasyTeam.get({id: $routeParams.id}, function(data) {
    $scope.contracts = data.contracts;
    $scope.contracts.forEach(function(contract) {
      contract.year_1_salary = contract.length >= 1 ? contract.base_salary : null;
      contract.year_2_salary = contract.length >= 2 ? contract.base_salary : null;
      contract.year_3_salary = contract.length >= 3 ? contract.base_salary : null;
      contract.year_4_salary = contract.length >= 4 ? contract.base_salary : null;
    });
  });

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

  $scope.filteredSalaryTotal = function() {
    var total = 0;
    if ($scope.contracts) {
      $scope.contracts.forEach(function(contract) {
        if ($scope.filterByContractStatus(contract) && $scope.filterByPosition(contract)) {
          total = total + contract.base_salary;
        }
      });
    }

    return total;
  };

  $scope.filteredLengthTotal = function() {
    var total = 0;
    if ($scope.contracts) {
      $scope.contracts.forEach(function(contract) {
        if ($scope.filterByContractStatus(contract) && $scope.filterByPosition(contract)) {
          total = total + contract.length;
        }
      });
    }

      return total;
  };

  $scope.nullsToBottom = function(obj,key) {
    var sortField = $scope.orderByField;
    if (sortField.startsWith('-')) {
      sortField = sortField.substr(1);
    }
    return (obj[sortField] === null) ? 0 : -1;
  };

  $scope.orderByField = 'player.last_name';

}]);


fantasyTeamControllers.controller('FantasyTeamsCtrl', ['$scope', '$routeParams', 'FantasyTeamList', function($scope, $routeParams, FantasyTeamList) {

  $scope.fantasy_teams = FantasyTeamList.query();

}]);
