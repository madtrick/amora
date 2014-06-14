'use strict'

angular.module('amoraApp')
  .service 'AmoraDataSource', ($resource, $location) ->

    memory = $resource("/api/memory")

    fetchMemoryData : ->
      memory.get url : $location.search().url
