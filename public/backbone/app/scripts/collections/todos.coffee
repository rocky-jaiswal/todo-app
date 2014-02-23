define ["jquery", "underscore", "backbone", "../models/todo"],
($, _, Backbone, Todo) ->
  'use strict'
  
  class Todos extends Backbone.Collection

    model: Todo

    initialize: ->

    sync: (method, model, options) ->
      options = options || {}
      options = _.extend(options, headers: {email: localStorage.getItem("email"), token: localStorage.getItem("token")})
      super(method, model, options)
      