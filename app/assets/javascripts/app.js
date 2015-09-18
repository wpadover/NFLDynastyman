var app = angular.module('dynastyFootballManagerApp', [
  'ngRoute',
  'fantasyTeamControllers',
  'fantasyTeamServices',
  'contractControllers',
  'contractServices'
]);


app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
  $locationProvider.html5Mode({
    enabled: true,
    requireBase: false
  });
  $routeProvider.when('/fantasy_teams/:id',
    {
      templateUrl: 'fantasyTeamShow.html',
      controller: 'FantasyTeamCtrl'
    }
  ).
  when('/fantasy_teams',
    {
      templateUrl: 'fantasyTeamIndex.html',
      controller: 'FantasyTeamsCtrl'
    }
  ).
  when('/contracts',
    {
      templateUrl: 'contractsIndex.html',
      controller: 'ContractsCtrl'
    }
  ).
  otherwise(
    {
      redirectTo: '/fantasy_teams'
    }
  );

}]);
