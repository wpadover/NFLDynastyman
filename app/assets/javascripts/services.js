var fantasyTeamServices = angular.module('fantasyTeamServices', ['ngResource']);

fantasyTeamServices.factory('FantasyTeam', ['$resource',
  function($resource){
    return $resource(':id.json');
  }]
);

