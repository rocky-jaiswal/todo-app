define ["jquery", "underscore", "backbone", "../models/todo"],
($, _, Backbone, Todo) ->
  'use strict'
  
  class Todos extends Backbone.Collection

    model: Todo

    initialize: ->
      