var fantasyTeamControllers= angular.module('fantasyTeamControllers', [
  'ui.bootstrap'
]);

fantasyTeamControllers.controller('FantasyTeamCtrl', ['$scope', '$routeParams', 'FantasyTeam', function($scope, $routeParams, FantasyTeam) {

  FantasyTeam.get({id: $routeParams.id}, function(data) {
    $scope.contracts = data.contracts;
  });

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

  $scope.filteredSalaryTotal = function() {
    var total = 0;
    if ($scope.contracts) {
      $scope.contracts.forEach(function(contract) {
        if ($scope.filterByContractStatus(contract) && $scope.filterByPosition(contract)) {
          total = total + contract.year_1_salary;
        }
      });
    }

    return total;
  };

  $scope.filteredNumberOfPlayers = function() {
    var total = 0;
    if ($scope.contracts) {
      $scope.contracts.forEach(function(contract) {
        if ($scope.filterByContractStatus(contract) && $scope.filterByPosition(contract) && contract.length) {
          total = total + 1;
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


fantasyTeamControllers.controller('FantasyTeamsCtrl', ['$scope', 'FantasyTeamList', function($scope, FantasyTeamList) {

  $scope.fantasy_teams = FantasyTeamList.query();

}]);
