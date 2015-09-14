var fantasyTeamControllers= angular.module('fantasyTeamControllers', []);

fantasyTeamControllers.controller('FantasyTeamCtrl', ['$scope', '$routeParams', 'FantasyTeam', function($scope, $routeParams, FantasyTeam) {

  console.log('here!');
  console.log($routeParams);
  FantasyTeam.get({id: $routeParams.id}, function(data) {
    $scope.contracts = data.contracts;
  });

  $scope.filter = {};

  $scope.filterByContractStatus = function(contract) {
    return $scope.filter[contract.contract_status] || noFilter($scope.filter);
  };

  /*
  $scope.contracts = [
    { 'first_name': 'Odell',
      'last_name': 'Beckham',
      'contract_status': 'ACTIVE'
    },
    { 'first_name': 'Peyton',
      'last_name': 'Manning',
      'contract_status': 'ACTIVE'
    },
    { 'first_name': 'Melvin',
      'last_name': 'Gordon',
      'contract_status': 'ROOKIE'
    }

  ];
  */

  $scope.orderProp = 'player.first_name';

}]);

function noFilter(filterObj) {
  for (var key in filterObj) {
    if (filterObj[key]) {
      return false;
    }
  }

  return true;
}
