var app = angular.module('dynastyFootballManagerApp', [
  'ngRoute',
  'fantasyTeamControllers',
  'fantasyTeamServices'
]);


app.config(['$routeProvider', function($routeProvider){

  $routeProvider.when('/fantasy_teams/:id',
    {
      templateUrl: '../templates/fantasy_teams/show.html',
      controller: 'FantasyTeamCtrl'
    }
  );

}]);
