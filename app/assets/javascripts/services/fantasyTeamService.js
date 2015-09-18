var fantasyTeamServices = angular.module('fantasyTeamServices', ['ngResource']);

fantasyTeamServices.factory('FantasyTeam', ['$resource',
  function($resource){
    return $resource(':id.json');
  }]
);

fantasyTeamServices.factory('FantasyTeamList', ['$resource',
  function($resource){
    return $resource('fantasy_teams.json');
  }]
);
