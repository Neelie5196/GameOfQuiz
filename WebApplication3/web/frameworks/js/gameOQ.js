var app = angular.module("myApp", ["ngRoute"]);
app.config(["$routeProvider", function ($routeProvider) {
    'use strict';
    //for $routeprovider
    $routeProvider
        /*Page link*/
.when("/", {templateUrl: "topic.jsp"})
.when("/video", {templateUrl: "video.jsp"})
.when("/quiz", {templateUrl: "topic.jsp"})
.when("/reward", {templateUrl: "reward.jsp"});



    
}]);

