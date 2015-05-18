var app = angular.module('Rateach',[]);

var path;

app.factory('teachersInfo', ['$http', function($http) {

    //path = jQuery("#pathForAngular").val();
    path = window.location+".json";

    return $http.get( path )
        .success(function(data) {
            return data;
        })
        .error(function(err) {
            return err;
        });
}]);

app.controller('MainController', ['$scope', 'teachersInfo', function($scope, teachInfo) {

    teachInfo.success(function(data) {
        $scope.teachers = data;
    });

}]);

