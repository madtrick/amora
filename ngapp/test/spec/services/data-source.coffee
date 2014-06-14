'use strict'

describe 'Service: DataSource', () ->

  beforeEach ->
    @addMatchers toEqualData : (expected) -> angular.equals @actual, expected

  beforeEach module 'amoraApp'

  AmoraDataSource = {}
  $httpBackend    = {}

  beforeEach ->
    module ($provide) ->
      $provide.constant('$location', search : -> url : 'mocked-url')

    inject (_DataSource_, _$httpBackend_) ->
      AmoraDataSource = _DataSource_
      $httpBackend = _$httpBackend_

  describe "#fetchMemoryData", ->
    beforeEach ->
      $httpBackend.expectGET('/api/memory?url=mocked-url').
        respond([{ blup : 1 }])

    it "fetches memory info from the remote API", ->
      memoryData = AmoraDataSource.fetchMemoryData()

      expect(memoryData).toEqualData({})
      $httpBackend.flush()
      expect(memoryData).toEqualData({ blup : 1 })
