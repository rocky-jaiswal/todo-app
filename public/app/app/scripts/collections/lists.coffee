define ["jquery", "underscore", "backbone", "../models/list"],
($, _, Backbone, List) ->
  'use strict'
  
  class Lists extends Backbone.Collection

    model: List

    url: '/api/v1/lists'

    initialize: ->
