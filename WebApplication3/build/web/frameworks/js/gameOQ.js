var app = angular.module("myApp", ["ngRoute"]);
app.config(["$routeProvider", function ($routeProvider) {
    'use strict';
    //for $routeprovider
    $routeProvider
        /*Page link*/
        .when("/", {templateUrl: "topic.jsp"});
}]);


app.controller("more", function(){"use strict";
    $('#myModal').on('show.bs.modal', function (e) {
        $(this).find('.modal-title').html(e.relatedTarget.id);
        $(this).find('.modal-body').html("Topic Bonus: <br/>" + e.relatedTarget.value);
    });
    });