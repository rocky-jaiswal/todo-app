define ["jquery", "underscore", "backbone", "../collections/todos"],
($, _, Backbone, Todos) ->
  'use strict'
  
  class List extends Backbone.Model

    initialize: ->
      @todos = new Todos()
      @todos.url = "api/v1/lists/" + @id + "/todos"

    validate: (attrs, options) ->
      return {msg: "✗ List: name cannot be blank"} unless(attrs.name?.trim().length > 0)

    sync: (method, model, options) ->
      options = options || {}
      options = _.extend(options, headers: {email: localStorage.getItem("email"), token: localStorage.getItem("token")})
      super(method, model, options)

