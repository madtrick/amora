'use strict'

app = angular.module 'amoraApp', ['ngResource']

app.config ($locationProvider) ->
  $locationProvider.html5Mode true

# Rails fucks up content-type negotation so it tries to return
# a text/html content instead of the application/json requested
# by Angular. See the following links for more info:
#
#   * https://github.com/rails/rails/issues/9940
#   * https://groups.google.com/forum/?fromgroups=#!topic/angular/k8iEHBmQrJo
#
# This forces Angular to include the X-Requested-With header
# so Rails considers that the request deserves the JSON response.
app.config ($httpProvider) ->
  $httpProvider.defaults.headers['common']['X-Requested-With'] = 'XMLHttpRequest' 
