application.controller('MainController', ['$scope', 'teachersInfo', function($scope, teachersInfo) {

    teachersInfo.success(function(data) {
        $scope.teachers = data;
    });
    $scope.name = 'World';

}]);