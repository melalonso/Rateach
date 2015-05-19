var app = angular.module('Rateach',[]);

var path;




    app.factory('teachersInfo', ['$http', function ($http) {

        //path = jQuery("#pathForAngular").val();
        path = window.location + ".json";

        return $http.get(path)
            .success(function (data) {
                return data;
            })
            .error(function (err) {
                return err;
            });

    }]);




    app.factory('coursesInfo', ['$http', function($http) {

        path = window.location+".json";

        return $http.get( path )
            .success(function(data) {
                return data;
            })
            .error(function(err) {
                return err;
            });

    }]);







app.controller('MainController', ['$scope', 'teachersInfo','coursesInfo', function($scope, teachInfo,courseInfo) {

    teachInfo.success(function(data) {
        $scope.teachers = data;
    });

    courseInfo.success(function(data){
        $scope.courses = data;
    });

}]);

