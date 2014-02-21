define ["jquery", "underscore", "backbone", "../collections/todos"],
($, _, Backbone, Todos) ->
  'use strict'
  
  class List extends Backbone.Model

    initialize: ->
      @todos = new Todos()
      @todos.url = "api/v1/lists/" + @id + "/todos"

    validate: (attrs, options) ->
      return {msg: "✗ List: name cannot be blank"} unless(attrs.name?.trim().length > 0)
      
      