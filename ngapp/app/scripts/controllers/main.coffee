'use strict'

angular.module('amoraApp')
  .controller 'MainCtrl', ($scope, AmoraDataSource) ->

    AmoraDataSource.fetchMemoryData()

