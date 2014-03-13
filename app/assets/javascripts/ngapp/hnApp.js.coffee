@hnApp = angular.module('hnApp', ['ngResource', 'ngRoute'])

# making AngularJS work with CSRF protection
hnApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

# configure our location provider to be in HTML5 mode (remove # from URL)
@hnApp.config(['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode true
])

# AngularJS Routes
@hnApp.config(['$routeProvider', ($routeProvider) ->
  # $locationProvider.html5Mode true
  $routeProvider.
    otherwise({
      templateUrl: '/templates/dashboard.html',
      controller: 'HomeCtrl'
    })
])

# Makes AngularJS work with turbolinks
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])