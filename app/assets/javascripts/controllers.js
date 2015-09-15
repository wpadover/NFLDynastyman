var fantasyTeamControllers= angular.module('fantasyTeamControllers', []);

fantasyTeamControllers.controller('FantasyTeamCtrl', ['$scope', '$routeParams', 'FantasyTeam', function($scope, $routeParams, FantasyTeam) {

  FantasyTeam.get({id: $routeParams.id}, function(data) {
    $scope.contracts = data.contracts;
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


  $scope.orderByField = 'player.last_name';

}]);


fantasyTeamControllers.controller('FantasyTeamsCtrl', ['$scope', '$routeParams', 'FantasyTeamList', function($scope, $routeParams, FantasyTeamList) {

  $scope.fantasy_teams = FantasyTeamList.query();

}]);
