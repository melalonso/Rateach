application.factory('teachersInfo', ['$http', function($http) {
    return $http.get('http://localhost:3000/faculties/1/teachers.json')
        .success(function(data) {
            return data;
        })
        .error(function(err) {
            return err;
        });
}]);