var app = angular.module('dynastyFootballManagerApp', [
  'ngRoute',
  'fantasyTeamControllers',
  'fantasyTeamServices'
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
  );

}]);
