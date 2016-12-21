<!DOCTYPE html>
<html lang="en-US">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js"></script>
<body>

<div ng-app="myApp" ng-controller="myCtrl">

    <p>Searching for "{{name}}"</p>

    Name: <input ng-model="name">
    <h1 ng-click="changeName()">Go</h1>

    <table>
        <tr ng-repeat="x in myWelcome.Search">
            <td>{{ x.Title }}</td>
            <td>{{ x.Year }}</td>
            <td><img style='height: 50%' ng-src="{{ x.Poster }}"</td>
        </tr>
    </table>

    <h2>Total records {{totalResults}}</h2>

</div>

<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function ($scope, $http) {

        $scope.name = '';

        $scope.changeName = function () {
            $http.get("http://127.0.0.1:8080/omdbAPI/search/" + $scope.name + "/1")
                .then(function (response) {
                    $scope.myWelcome = response.data;
                    $scope.totalResults = response.data.totalResults;
                });
        };
    });
</script>