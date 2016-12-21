<!DOCTYPE html>
<html lang="en-US">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
<style>
    body {
        top: 60px;
        position: absolute;
        padding: 10px;
    }

    #results img {
        height: 50%;
    }
    div, td {
        margin: 0;
        border: 0;
        padding: 0;
    }
    .cssProductOdd {
        background-color: lightblue;
    }
    .cssProductEven {
        background-color: silver;
        color: white;
    }

</style>
</head>
<body ng-app="myApp" ng-controller="myCtrl">

<nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
    <a class="navbar-brand" href="#">OMDB Search</a>
    <form class="form-inline float-xs-right">
        <input class="form-control" ng-model="name" type="text" placeholder="Movie or TV Show">
        <button class="btn btn-outline-success" ng-click="changeName()" type="submit">Search</button>
    </form>
</nav>

    <p ng-if="{totalResults} > 0 ">Searched for "{{name}}"</p>
    <h3 ng-if="{totalResults} > 0">Total records {{totalResults}}</h3>

    <table id="results">
        <tr ng-repeat="x in myWelcome.Search" ng-class-odd="'cssProductOdd'" ng-class-even="'cssProductEven'" >
            <td>{{ x.Title }}</td>
            <td>{{ x.Year }}</td>
            <td><img ng-src="{{ x.Poster }}" on-error-src="http://localhost:8080/img/notfound.png"></td>
        </tr>
    </table>

<script>
    var app = angular.module('myApp', []);

    app.directive('onErrorSrc', function() {
        return {
            link: function(scope, element, attrs) {
                element.bind('error', function() {
                    if (attrs.src != attrs.onErrorSrc) {
                        attrs.$set('src', attrs.onErrorSrc);
                    }
                });
            }
        }
    });

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
</body>