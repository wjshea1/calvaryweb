/**
 * Created with IntelliJ IDEA.
 * User: wjshea
 * Date: 10/13/13
 * Time: 10:29 PM
 * To change this template use File | Settings | File Templates.
 */

var playerApp = angular.module('playerApp', []);

playerApp.controller('playerMainCtrl', function PlayerMainCtrl($scope, $http) {
    $http.get('feeds/current').success(function(data)) {
        $scope.items = data;
    }  );
});
