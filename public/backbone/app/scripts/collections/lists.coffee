define ["jquery", "underscore", "backbone", "../models/list"],
($, _, Backbone, List) ->
  'use strict'
  
  class Lists extends Backbone.Collection

    model: List

    url: '/api/v1/lists'

    initialize: ->

    sync: (method, model, options) ->
      options = options || {}
      options = _.extend(options, headers: {email: localStorage.getItem("email"), token: localStorage.getItem("token")})
      super(method, model, options)