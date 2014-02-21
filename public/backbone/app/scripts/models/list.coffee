define ["jquery", "underscore", "backbone", "../collections/todos"],
($, _, Backbone, Todos) ->
  'use strict'
  
  class List extends Backbone.Model

    initialize: ->
      @todos = new Todos()
      @todos.url = "api/v1/lists/" + @id + "/todos"
      